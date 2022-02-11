#import libraries
from turtle import color
import numpy as np
import pandas as pd
import collections
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from xgboost import XGBClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import RandomizedSearchCV
from collections import Counter
from sklearn.metrics import confusion_matrix
from sklearn.metrics import classification_report
from sklearn.metrics import plot_confusion_matrix
from sklearn.metrics import precision_score
import warnings
warnings.filterwarnings('ignore')
from time import perf_counter
#load library for target encoder 
from category_encoders import TargetEncoder
from sklearn.preprocessing import StandardScaler
from sklearn.compose import ColumnTransformer
#the VarianceThreshold class from sklearn support a type of feature selection
from sklearn.feature_selection import VarianceThreshold

from sklearn.decomposition import PCA
from sklearn.decomposition import KernelPCA
from sklearn.decomposition import TruncatedSVD
from sklearn.manifold import Isomap # for Isomap dimensionality reduction
from sklearn.manifold import LocallyLinearEmbedding
import umap



class Extraction:
    def __init__(self):
        self.df=pd.read_csv('esc-01-Mixed-traffic.csv')
        #No trunkated 
        pd.set_option('display.max_columns', None)

        self.target_names = ['class 0', 'class 1']
        self.X_train = None
        self.X_test = None
        self.y_test = None
        self.y_train = None
        self.results = pd.DataFrame()
        self.fields = ['method', 'n', 'config', 'time', 'time_extraction', 'precision', 'recall', 'specificity', 'fn', 'fp', 'tp', 'tn']
        # self.methods = ['pca', 'svd', 'isomap']
        self.methods = ['umap']
        self.n_components = range(7,20,1)

        print('Dataset dimensions, number of sessions and features: ', self.df.shape)
        print("counting classes: ", collections.Counter(self.df.label.values))
        print("check the number of null values: ", self.df.isnull().values.sum())

    def preprocessing(self):
        self.df.dropna(inplace=True)
        #sumarize the number of unique values for each column 
        # print(self.df.nunique())
        # Delete time stamp (ts), srcIP and dstIP features
        # Models do not learn with IP addresses
        self.df.drop(['ts','srcIP','dstIP'],axis=1,inplace=True)
        #Delete Rows That Contain Duplicate Data
        self.df.drop_duplicates(inplace=True)
        self.X_train,self.X_test,self.y_train,self.y_test = train_test_split(self.df.drop(columns=['label']), self.df['label'], test_size=0.2, random_state=42)
        # Selecting the three categorical variables to be coded
        enc = TargetEncoder(cols=['proto','srcPrt','dstPrt'])
        # fit on the trainning dataset
        enc.fit_transform(self.X_train, self.y_train)
        # Coding categorical variables of the trainning dataset
        training_numeric_dataset=enc.transform(self.X_train)
        # Coding categorical variables of the test dataset
        testing_numeric_dataset = enc.transform(self.X_test)
        numeric_cols = training_numeric_dataset.select_dtypes(include=['float64', 'int']).columns.to_list()
        preprocessor = ColumnTransformer([('scale', StandardScaler(), numeric_cols)], remainder='passthrough')
        # fit on the trainning dataset
        preprocessor.fit_transform(training_numeric_dataset)
        X_train_stand = preprocessor.transform(training_numeric_dataset)
        X_test_stand  = preprocessor.transform(testing_numeric_dataset)
        labels=list(training_numeric_dataset.columns.values.tolist())
        self.X_train=pd.DataFrame(X_train_stand,columns=labels)
        self.X_test=pd.DataFrame(X_test_stand,columns=labels)

        
        var_thr = VarianceThreshold(threshold = 0.25) #.25 would mean dropping the column where 75% of the values are similar.
        # fit on the trainning dataset
        var_thr.fit(self.X_train)
        # Get a mask of the selected features 
        var_thr.get_support()
        concol = [column for column in self.X_train.columns 
          if column not in self.X_train.columns[var_thr.get_support()]]
        #Dropping Low Variance Columns:
        self.X_train.drop(concol,axis=1,inplace=True)
        self.X_test.drop(concol,axis=1,inplace=True)

    def beforeExtraction(self):
        [model, time] = self.XGBC(self.X_train)
        [precision, recall, specificity, FN, FP, TP, TN] = self.evaluateModel(model, self.X_test)
        print(self.fields)
        data = ['before', 0, 'beforeExtraction', time, 0, precision, recall, specificity, 0, 0, 0, 0]
        print(data)
        row = pd.Series(data=data, index = self.fields)
        print(self.results)
        print(row)
        self.results = self.results.append(row, ignore_index = True)

    def evaluateModel(self, model, test_data):
        y_pred = model.predict(test_data)
        # plot_confusion_matrix(model, test_data, self.y_test, display_labels=self.target_names,cmap=plt.cm.Blues)
        CM = confusion_matrix(self.y_test, y_pred)
        TN = CM[0][0]
        FN = CM[1][0]
        TP = CM[1][1]
        FP = CM[0][1]

        precision = TP/(TP+FP)
        recall = TP/(TP+FN)
        # sensinivity = TP/(TP+FN)
        specificity = TN/(FP+TN)
        # print(TN, FN, TP, FP)

        return precision, recall, specificity, FN, FP, TP, TN

    def extraction(self):
        
        solvers = ['randomized']
        solversSvd = ['randomized']

        for method in self.methods:
            print("method: ", method)
            if method == "pca":
                for solver in solvers:
                    for n in self.n_components:
                        print("config: ", n, solver)
                        [X_train_transformed, X_test_transformed, time_extraction] = self.PCA(n, solver, self.X_train, self.X_test)
                        modelXGBC, time = self.XGBC(X_train_transformed)
                        print(time)
                        [precision, recall, specificity, FN, FP, TP, TN] = self.evaluateModel(modelXGBC, X_test_transformed)
                        row = pd.Series(data=['pca', n, 'svd_solver = "%s"' % (solver), time, time_extraction, precision, recall, specificity], index = self.fields)
                        self.results = self.results.append(row, ignore_index = True)
                        self.results.to_csv('results.csv')
            if method == "svd":
                for solver in solversSvd:
                    for n in self.n_components:
                        print("config: ", n, solver)
                        [X_train_transformed, X_test_transformed, time_extraction] = self.svd(n, solver, self.X_train, self.X_test)
                        modelXGBC, time = self.XGBC(X_train_transformed)
                        print(time)
                        [precision, recall, specificity, FN, FP, TP, TN] = extraction.evaluateModel(modelXGBC, X_test_transformed)
                        row = pd.Series(data=['svd', n, 'solver = %s' % (solver), time, time_extraction, precision, recall, specificity, FN, FP, TP, TN], index = self.fields)
                        self.results = self.results.append(row, ignore_index = True)
                        self.results.to_csv('results.csv')
            if method == "isomap":
                for solver in ["arpack"]: #["arpack", "dense"]
                    for n in self.n_components:
                        print("config: ", n, solver)
                        [X_train_transformed, X_test_transformed, time_extraction] = self.isomap(n, solver, self.X_train, self.X_test)
                        modelXGBC, time = self.XGBC(X_train_transformed)
                        print(time)
                        [precision, recall, specificity, FN, FP, TP, TN] = extraction.evaluateModel(modelXGBC, X_test_transformed)
                        row = pd.Series(data=['isomap', n, 'solver = %s' % (solver), time, time_extraction, precision, recall, specificity, FN, FP, TP, TN], index = self.fields)
                        self.results = self.results.append(row, ignore_index = True)
                        self.results.to_csv('results.csv')
            if method == "lle":
                for n in self.n_components:
                    print("config: ", n)
                    [X_train_transformed, X_test_transformed, time_extraction] = self.LLE(n, self.X_train, self.X_test)
                    modelXGBC, time = self.XGBC(X_train_transformed)
                    print(time)
                    [precision, recall, specificity, FN, FP, TP, TN] = extraction.evaluateModel(modelXGBC, X_test_transformed)
                    row = pd.Series(data=['lle', n, '', time, time_extraction, precision, recall, specificity, FN, FP, TP, TN], index = self.fields)
                    self.results = self.results.append(row, ignore_index = True)
                    print(row)
                    self.results.to_csv('results.csv')
            if method == "umap":
                [X_train_transformed, X_test_transformed, time_extraction] = self.umap(self.X_train, self.X_test)
                modelXGBC, time = self.XGBC(X_train_transformed)
                [precision, recall, specificity, FN, FP, TP, TN] = extraction.evaluateModel(modelXGBC, X_test_transformed)
                row = pd.Series(data=['umap', 3, '', time, time_extraction, precision, recall, specificity, FN, FP, TP, TN], index = self.fields)
                self.results = self.results.append(row, ignore_index = True)
                print(row)
                self.results.to_csv('results.csv')


    def umap(self, X_train, X_test):
        start=perf_counter()   
        reducer = umap.UMAP(n_components=3)
        X_train_tranformed = reducer.fit_transform(X_train)
        X_test_tranformed = reducer.transform(X_test)
        tl=(perf_counter()-start)    
        return X_train_tranformed, X_test_tranformed, tl
            
    def LLE(self, n, X_train, X_test):
        start=perf_counter()
        embedding = LocallyLinearEmbedding(n_components=n)
        X_train_tranformed = embedding.fit_transform(X_train)
        X_test_tranformed = embedding.transform(X_test)
        tl=(perf_counter()-start)
        return X_train_tranformed, X_test_tranformed, tl

            
    def PCA(self, n, solver, X_train, X_test):
        start=perf_counter()
        pca = PCA(n_components = n, svd_solver = solver)
        pca.fit(X_train)
        X_train_tranformed = pca.transform(X_train)
        X_test_tranformed = pca.transform(X_test)
        tl=(perf_counter()-start)
        return X_train_tranformed, X_test_tranformed, tl

    def svd(self, n, solver, X_train, X_test):
        start=perf_counter()
        svd = TruncatedSVD(n_components = n, algorithm = solver)
        svd.fit(X_train)
        X_train_tranformed = svd.transform(X_train)
        X_test_tranformed = svd.transform(X_test)
        tl=(perf_counter()-start)
        return X_train_tranformed, X_test_tranformed, tl

    def isomap(self, n, config, X_train, X_test):
        start=perf_counter()
        print(start)
        embed3 = Isomap(
            n_neighbors=5, # default=5, algorithm finds local structures based on the nearest neighbors
            n_components=n, # number of dimensions
            eigen_solver='auto', # {‘auto’, ‘arpack’, ‘dense’}, default=’auto’
            tol=0, # default=0, Convergence tolerance passed to arpack or lobpcg. not used if eigen_solver == ‘dense’.
            max_iter=None, # default=None, Maximum number of iterations for the arpack solver. not used if eigen_solver == ‘dense’.
            path_method='auto', # {‘auto’, ‘FW’, ‘D’}, default=’auto’, Method to use in finding shortest path.
            neighbors_algorithm='auto', # neighbors_algorithm{‘auto’, ‘brute’, ‘kd_tree’, ‘ball_tree’}, default=’auto’
            n_jobs=-1, # n_jobsint or None, default=None, The number of parallel jobs to run. -1 means using all processors
            metric='minkowski', # string, or callable, default=”minkowski”
            p=2, # default=2, Parameter for the Minkowski metric. When p = 1, this is equivalent to using manhattan_distance (l1), and euclidean_distance (l2) for p = 2
            metric_params=None # default=None, Additional keyword arguments for the metric function.
        )
        print(embed3)
        isomap = embed3.fit(X_train)
        print(isomap)
        X_test_tranformed = isomap.fit_transform(X_test)
        print(X_test_tranformed)
        X_train_tranformed = isomap.fit_transform(X_train)
        print(X_train_tranformed)
        tl=(perf_counter()-start)
        return X_train_tranformed, X_test_tranformed, tl

    def XGBC(self, X_train):
        #Run grid search only on training set using cross-validation, n_jobs to -1, it will use all cores
        start=perf_counter()
        parameters = {'max_depth': np.arange (2, 10),'n_estimators': np.arange(60, 220, 40), 
                    'learning_rate': [0.1, 0.01, 0.05],'gamma' : [0.1, 1, 1.5], 
                    'subsample' : [0.8, 0.9, 1.0],
                    'colsample_bytree' : [0.3, 0.5, 1.0]}
        model = RandomizedSearchCV(XGBClassifier(eval_metric='logloss',use_label_encoder =False),
                                    parameters, cv=5, n_jobs=-1,scoring='roc_auc',verbose=False)
        # print(X_train)
        # print(self.y_train.values)
        model.fit(X_train, self.y_train.values)
        tl=(perf_counter()-start)
        # print ('Elapsed time: %.2f hrs.' %tl)
        return model, tl
        # df_X_test_pca = pca.transform(df_X_test_stand)

    def writeResults(self):
        self.results.to_csv('results.csv')

    def readResults(self):
        self.results = pd.read_csv('results.csv')

    def report(self):

        self.results.sort_values(['n'])
        # plot = plt.scatter(self.results["n"], self.results["precision"], color = 'g', s = 200)
        # plot = plt.scatter(self.results["n"],  self.results["specificity"], color = 'b', s = 100)
        # plot.show
        print(self.results)
        
       

        colors =  ['#777777','g','b', '#777777']
        self.methods.append('before')


        fig, ax = plt.subplots()
        for idx, method in enumerate(self.methods): #['pca', 'svd', 'isomap', 'before']
                data = self.results.where(self.results['method'] == method)
                print(data)
                ax.scatter(data["n"], data['time'], color = colors[idx])
                ax.plot(data["n"], data['time'], color = colors[idx])

        fig, ax2 = plt.subplots()
        for idx, method in enumerate(self.methods): #['pca', 'svd', 'isomap', 'before']
            data = self.results.where(self.results['method'] == method)
            print(data)
            for index, metric in enumerate(['precision', 'specificity', 'recall']):
                ax2.scatter(data["n"], data[metric], color = colors[index])
                ax2.plot(data["n"], data[metric], color = colors[index], label = metric)
                if(method != 'before'):
                    ax2.legend(loc='upper center', shadow=True, fontsize='x-large')  
                # ax2.legend()
                # ax2.legend(loc='upper center', shadow=True, fontsize='x-large')
                # for i, txt in enumerate(data['method']):
                #     ax.annotate(txt, (data['n'][i], data[metric][i]))
            # ax2 = ax.twinx()
            # ax2.scatter(data["n"], data["time"], color = colors[idx], marker = "*")
            # ax2.plot(data["n"], data["time"], color = colors[idx])
            # ax.scatter(data["n"],  data["specificity"], color = 'b', s = 100)
            # ax.scatter(data["n"],  data["recall"], color = 'r', s = 100)

        # volume = np.random.rayleigh(27, size=40)
        # amount = np.random.poisson(10, size=40)
        # ranking = np.random.normal(size=40)
        # price = np.random.uniform(1, 10, size=40)

        # fig, ax = plt.subplots()

        # # Because the price is much too small when being provided as size for ``s``,
        # # we normalize it to some useful point sizes, s=0.3*(price*3)**2
        # scatter = ax.scatter(volume, amount, c=ranking, s=0.3*(price*3)**2,
        #                     vmin=-3, vmax=3, cmap="Spectral")

        # # Produce a legend for the ranking (colors). Even though there are 40 different
        # # rankings, we only want to show 5 of them in the legend.
        # legend1 = ax.legend(*scatter.legend_elements(num=5),
        #                     loc="upper left", title="Ranking")
        # ax.add_artist(legend1)

        # # Produce a legend for the price (sizes). Because we want to show the prices
        # # in dollars, we use the *func* argument to supply the inverse of the function
        # # used to calculate the sizes from above. The *fmt* ensures to show the price
        # # in dollars. Note how we target at 5 elements here, but obtain only 4 in the
        # # created legend due to the automatic round prices that are chosen for us.
        # kw = dict(prop="sizes", num=5, color=scatter.cmap(0.7), fmt="$ {x:.2f}",
        #         func=lambda s: np.sqrt(s/.3)/3)
        # legend2 = ax.legend(*scatter.legend_elements(**kw),
        #                     loc="lower right", title="Price")

        # plt.show()

        # # Multi-Axis
        # self.results = self.results.sort_values(['time'])
        # fig, ax = plt.subplots()
        # ax.plot(self.results["config"], self.results["time"], label="Time vs Precision")
        # ax2 = ax.twinx()
        # ax2.plot(self.results["config"], self.results["precision"], color = "red")

        # fig, ax = plt.subplots()
        # ax.plot(self.results["config"], self.results["time"], label="Time vs specificity")
        # ax2 = ax.twinx()
        # ax2.plot(self.results["config"], self.results["specificity"], color = "red")

        # fig, ax = plt.subplots()
        # ax.plot(self.results["config"], self.results["time"], label="Time vs recall")
        # ax2 = ax.twinx()
        # ax2.plot(self.results["config"], self.results["recall"], color = "red")



extraction = Extraction()
extraction.preprocessing()
extraction.beforeExtraction()
extraction.extraction()
extraction.writeResults()
# extraction.readResults()
extraction.report()