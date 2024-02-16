import numpy as np, pandas as pd
# import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.datasets import fetch_20newsgroups
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.pipeline import make_pipeline
from sklearn.metrics import confusion_matrix, accuracy_score
import pymysql
con=pymysql.connect(host="localhost",port=3306,user="root",password="",db="cyberbullying")
cmd=con.cursor()

# sns.set() # use seaborn plotting style


import numpy as np
from sklearn.model_selection import StratifiedKFold
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB

# for removing repetition from positive and negative words
fulllist=[]
# positive = open("positive", "r+", encoding="UTF-8")
# file = positive.read()
positive_list = []
# positive_list = file.split("\n")
cmd.execute("select word from good")
res=cmd.fetchall()
for r in res:
    positive_list.append(r[0])


print(positive_list)
df_pos = []
for r in positive_list:
    if r not in df_pos:
        df_pos.append(r)
    if r not in fulllist:
        fulllist.append(r)
print("dpos",df_pos)




# negative = open("negative", "r+", encoding="UTF-8")
# file = negative.read()
negative_list = []
# negative_list = file.split("\n")
cmd.execute("select bull_word from bullying")
nes=cmd.fetchall()
for r in nes:
    negative_list.append(r[0])
print(negative_list)
df_neg = []
for r in negative_list:
    if r not in df_neg:
        df_neg.append(r)
    if r not in fulllist:
        fulllist.append(r)
# negative.close()
print("dneg",df_neg)

i = 0
corp = []
tcorp=[]
f_t_label = []
tlabel=[]
listcount = []
count = 0
for rr in df_pos:

#giving label as 0 for positive
    if str(rr) != 'nan':
        corp.append(rr)
        f_t_label.append(0)
        count = count + 1
        if count==10:
            count=0
            tcorp.append(rr)
            tlabel.append(0)

    listcount.append(count)
    i = i + 1
count = 0
for rr in df_neg:


#giving label as 1 for negative
    if str(rr) != 'nan':
        corp.append(rr)
        f_t_label.append(1)
        count = count + 1
        if count==10:
            count=0
            tcorp.append(rr)
            tlabel.append(0)
    listcount.append(count)



vectorizer = CountVectorizer()
X = vectorizer.fit_transform(corp)
print(len(vectorizer.get_feature_names()))
print(vectorizer.get_feature_names())

print(X.toarray())


# Load the dataset
# data = fetch_20newsgroups()# Get the text categories
text_categories = [0,1]#data.target_names# define the training set
train_data =corp #fetch_20newsgroups(subset="train", categories=text_categories)# define the test set
# test_data = fetch_20newsgroups(subset="test", categories=text_categories)



print("We have {} unique classes".format(len(text_categories)))
print("We have {} training samples".format(len(train_data)))
# print("We have {} test samples".format(len(test_data.data)))



# Build the model
model = make_pipeline(TfidfVectorizer(), MultinomialNB())# Train the model using the training data
model.fit(train_data, f_t_label)# Predict the categories of the test data
predicted_categories = model.predict(tcorp)




# _____________________________________________________________________________
import nltk



from nltk.tokenize import sent_tokenize,word_tokenize




def predictfn(sent):
    file=sent

    negative_list = file.split(" ")
    print(negative_list)
    df_neg=[]
    for r in negative_list:
        if r not in df_neg:
            if r!='':
                if r in fulllist:
                    df_neg.append(r)

    if len(df_neg)>0:
        print("df negative")
        predicted_categories = model.predict(df_neg)

        print(predicted_categories)
        res=((len(predicted_categories)-sum(predicted_categories))/len(predicted_categories))*100
        out="Positive "
        if res<50:
            out="Negative "
            res=100-res
        print("The input is a", out, "sentence with probability of", res, "%")
        return out

    else:
        print("The input is a", "Neutral", "sentence ")
        return "Neutral"

