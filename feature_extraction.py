#import libraries
from crypt import methods
import numpy as np
import pandas as pd
import collections

import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from xgboost import XGBClassifier
from sklearn.model_selection import RandomizedSearchCV
from collections import Counter
from sklearn.metrics import confusion_matrix
from sklearn.metrics import plot_confusion_matrix
import warnings
warnings.filterwarnings('ignore')
from time import perf_counter
from category_encoders import TargetEncoder
from sklearn.preprocessing import StandardScaler
from sklearn.compose import ColumnTransformer
#the VarianceThreshold class from sklearn support a type of feature selection
from sklearn.feature_selection import VarianceThreshold

from sklearn.decomposition import PCA
from sklearn.manifold import Isomap # for Isomap dimensionality reduction
from sklearn.manifold import LocallyLinearEmbedding
from sklearn.manifold import TSNE
import umap
from sklearn.metrics import matthews_corrcoef
from sklearn.metrics import f1_score
from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import OneSidedSelection

class Extraction:
    def __init__(self):
        self.config = {
            'file': 'esc-01-Mixed-traffic_test.csv',
            'initial_test': True, # first run before transform
            'methods': ['pca', 'tsne', 'lle', 'umap'], # ['pca', 'tsne', 'lle', 'umap']
            'n_components': range(15,26,4),
            'smote': False, # Oversampling before transform
            'oss': True, # Undersampling before transform
            'pca_solvers': ['randomized'], # ['arpack', 'full','randomized']
            'tsne':  {
                'methods': ['exact'],
                'perplexity': range(5,51,15)
            },
            'lle': {
                'method': ['modified'],
                'neighbors': range(3,30,3) 
            },
            'umap': {
                'neighbors': range(3,13,3)
            }
            # 'svd_solvers': ['randomized'],
        }
        self.df = pd.DataFrame()
       

    def preprocessing(self):
        self.df=pd.read_csv(self.config.get('file'))
         #No trunkated 
        pd.set_option('display.max_columns', None)

        self.target_names = ['class 0', 'class 1']
        self.X_train = None
        self.X_test = None
        self.y_test = None
        self.y_train = None
        self.results = pd.DataFrame()
        self.fields = ['method', 'n', 'config', 'time', 'time_extraction', 'fn', 'fp', 'tp', 'tn', 'mf1', 'mcc', 'info_variance']

        print('Dataset dimensions, number of sessions and features: ', self.df.shape)
        print("counting classes: ", collections.Counter(self.df.label.values))
        print("check the number of null values: ", self.df.isnull().values.sum())

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
        # print(self.X_train.shape)
        
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

    def overSampling(self, X, y):
        print('Oversampling with smote...')
        smote = SMOTE()
        # fit on the trainning dataset
        self.X_train , self.y_train = smote.fit_resample(X, y)

    def underSampling(self, X, y):
        # define the undersampling method, n_jobs=-1 means using all processors
        oss = OneSidedSelection(random_state=0, n_jobs=-1)
        start=perf_counter()
        # fit on the trainning dataset
        self.X_train , self.y_train = oss.fit_resample(X, y)
        tl=(perf_counter()-start)/3600
        print ('Elapsed time: %.2f hrs.' %tl)
        # summarize the new class distribution
        print('Original dataset shape:', Counter(y))
        print('Resample dataset shape:', Counter(self.y_train))

    def beforeExtraction(self):
        print('Running initial test...')
        self.evaluateModel(self.X_train, self.X_test, 0, '', 'beforeExtraction', 0, 1)

    def evaluateModel(self, X_train_transformed, test_data, time_extraction, option, method, n, info_variance):
        print('Create and evaluate model...')
        modelXGBC, time = self.XGBC(X_train_transformed)
        y_pred = modelXGBC.predict(test_data)
        CM = confusion_matrix(self.y_test, y_pred)
        TN = CM[0][0]
        FN = CM[1][0]
        TP = CM[1][1]
        FP = CM[0][1]

        
        mf1 = f1_score(self.y_test, y_pred, average='macro')
        mcc = matthews_corrcoef(self.y_test, y_pred)
        row = pd.Series(data=[method, n, option, time, time_extraction, FN, FP, TP, TN, mf1, mcc, info_variance], index = self.fields)
        self.results = self.results.append(row, ignore_index = True)
        self.results.to_csv('results.csv')
        print('Done')

    def processData(self):
        print('List of extraction methods to test', self.config['methods'])
        for method in self.config['methods']:
            print("Extracting with method: ", method)

            for n in self.config['n_components']:
                print("n_components: ", n)
                if method == 'pca':
                    for config in self.config['pca_solvers']:
                        print('Solver: ', config)
                        [X_train_transformed, X_test_transformed, time_extraction, info_variance] = self.PCA(n, config, self.X_train, self.X_test)
                        self.evaluateModel(X_train_transformed, X_test_transformed, time_extraction, config, method, n, info_variance)
                if method == 'tsne':
                    for config in self.config['tsne']['perplexity']:
                        print('Perplexity: ', config)
                        [X_train_transformed, X_test_transformed, time_extraction, info_variance] = self.tsne(n, config, self.X_train, self.X_test)
                        config = 'perplexity=' + str(config)
                        self.evaluateModel(X_train_transformed, X_test_transformed, time_extraction, config, method, n, info_variance)
                if method == 'lle':
                    for neighbors in self.config['lle']['neighbors']:
                        for config in self.config['lle']['method']:
                            go = True
                            if( config == 'modified' and neighbors < n):
                                go = False
                            if(go):
                                print('Neighbors: ', neighbors, ' method: ', config)
                                config_lle = [neighbors, config]
                                [X_train_transformed, X_test_transformed, time_extraction, info_variance] = self.LLE(n, config_lle, self.X_train, self.X_test)
                                config_lle_str = 'n_neighbors=' + str(neighbors) + ', method=' + config
                                self.evaluateModel(X_train_transformed, X_test_transformed, time_extraction, config_lle_str, method, n, info_variance)
                if method == 'umap':
                    for config in self.config['umap']['neighbors']:
                        print('Neighbors', config)
                        [X_train_transformed, X_test_transformed, time_extraction, info_variance] = self.umap(n, config, self.X_train, self.X_test)
                        self.evaluateModel(X_train_transformed, X_test_transformed, time_extraction, config, method, n, info_variance)
                
                



    def umap(self, n, config, X_train, X_test):
        start=perf_counter()   
        reducer = umap.UMAP(n_components=n, n_neighbors=config)
        X_train_tranformed = reducer.fit_transform(X_train)
        X_test_tranformed = reducer.transform(X_test)
        tl=(perf_counter()-start)    
        print(tl)
        return X_train_tranformed, X_test_tranformed, tl, 0
            
    def LLE(self, n, config, X_train, X_test):
        start=perf_counter()
        embedding = LocallyLinearEmbedding(n_components=n, n_neighbors=config[0], method=config[1], n_jobs = -1)
        X_train_tranformed = embedding.fit_transform(X_train)
        X_test_tranformed = embedding.transform(X_test)
        tl=(perf_counter()-start)
        return X_train_tranformed, X_test_tranformed, tl, 'unknown'

            
    def PCA(self, n, solver, X_train, X_test):
        start=perf_counter()
        pca = PCA(n_components = n, svd_solver = solver)
        pca.fit(X_train)
        info_variance = (pca.explained_variance_ratio_*100).sum()

        index = np.arange(n)

        plt.figure()
        ax = plt.subplot()
        cumulative = np.cumsum(pca.explained_variance_ratio_)
        ax.bar(index, pca.explained_variance_ratio_)
        ax.bar(index, cumulative)


        plt.plot(np.cumsum(pca.explained_variance_ratio_))
        X_train_tranformed = pca.transform(X_train)
        X_test_tranformed = pca.transform(X_test)
        tl=(perf_counter()-start)
        return X_train_tranformed, X_test_tranformed, tl, info_variance

    def tsne(self, n, config, X_train, X_test):
        start=perf_counter()
        tsne = TSNE(n_components = n, verbose = 1, perplexity = config, method='exact', n_jobs = -1)
        print(type(self.X_train))
        X_train_tranformed = tsne.fit_transform(self.X_train)
        X_test_tranformed = tsne.fit_transform(self.X_test)
        tl=(perf_counter()-start)
        return X_train_tranformed, X_test_tranformed, tl, 0

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
        isomap = embed3.fit(X_train)
        X_test_tranformed = isomap.fit_transform(X_test)
        X_train_tranformed = isomap.fit_transform(X_train)
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

        model.fit(X_train, self.y_train.values)
        tl=(perf_counter()-start)
        return model, tl

    def writeResults(self):
        self.results.to_csv('results.csv')


e = Extraction()
e.preprocessing()
if(e.config['initial_test']):
    e.beforeExtraction()
if(e.config['smote']):
    e.overSampling(e.X_train, e.y_train)
if(e.config['oss']):
    e.underSampling(e.X_train, e.y_train)
e.processData()
e.writeResults()
