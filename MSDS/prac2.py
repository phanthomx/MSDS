import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns        
penguins_data = pd.read_csv("penguins_size.csv ")
sns.countplot(data = penguins_data, x= penguins_data['species'])
plt.figure(figsize= (12,6))
ax = sns.countplot(data = penguins_data, x= penguins_data['species'])
ax.set_xlabel('Penguin Species',fontsize = 15)
ax.set_ylabel('Count of records',fontsize = 15)
ax.set_title('Univariate analysis of Penguin Species',fontsize= 20),ax.set_title('Univariate analysis of CulmenLength', fontsize= 20)  
plt.show()   
penguins_group = penguins_data.groupby('species').count()
penguins_group= penguins_group.reset_index()
plt.pie(penguins_group["culmen_length_mm"], labels =
penguins_group['species'])
plt.show()
cols = ['g', 'b', 'r']
plt.pie(penguins_group["culmen_length_mm"], labels =
penguins_group['species'],colors = cols)	
plt.title('Univariate Analysis of Species', fontsize=15)
plt.show()        
