import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns        
penguins_data = pd.read_csv("penguins_size.csv ")
penguins_data = penguins_data[['species','culmen_length_mm']]        
penguins_data.head()
penguins_data.shape
penguins_data.dtypes
sns.histplot( data = penguins_data, x= penguins_data["culmen_length_mm"])
plt.figure(figsize= (12,6))
ax = sns.histplot( data = penguins_data, x= penguins_data["culmen_length_mm"])
ax.set_xlabel('Culmen Length in mm',fontsize = 15)
ax.set_ylabel('Count of records', fontsize = 15)
ax.set_title('Univariate analysis of Culmen Length',fontsize= 20)
plt.show()        
