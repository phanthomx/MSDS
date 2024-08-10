import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
houseprices_data = pd.read_csv("C:/Users/LAB PC/Downloads/h.csv")
sns.boxplot(data = houseprices_data, x= houseprices_data["Price"])
plt.figure(figsize= (12,6))
ax = sns.boxplot(data = houseprices_data, x= houseprices_data["Price"])
ax.set_xlabel('House Prices in millions',fontsize = 15)
ax.set_title('Univariate analysis of House Prices',fontsize= 20)
plt.ticklabel_format(style='plain', axis='x')   
plt.show()     
sns.violinplot(data = houseprices_data, x= houseprices_data["Price"])
plt.figure(figsize= (12,6))
ax = sns.violinplot(data = houseprices_data, x=
houseprices_data["Price"])
ax.set_xlabel('House Prices in millions',fontsize = 15)
ax.set_title('Univariate analysis of House Prices',fontsize= 20)
plt.ticklabel_format(style='plain', axis='x') 
plt.show() 
houseprices_data.describe()        

