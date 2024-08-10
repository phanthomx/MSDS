import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import statsmodels.api as sm
from statsmodels.formula.api import ols
from statsmodels.stats.multicomp import pairwise_tukeyhsd
data = pd.read_csv("mds.csv")
print(data.head())
sns.boxplot(x = "TV", y = "Sales", data = data);
#plt.show()
sns.boxplot(x = "Influencer", y = "Sales", data = data);
#plt.show()
data = data.dropna(axis=0)
print(data.isnull().sum(axis=0))
ols_formula = 'Sales ~ C(TV)'
OLS = ols(formula = ols_formula, data = data)
model = OLS.fit()
model_results = model.summary()
print(model_results)
residual = model.resid
fig, axes = plt.subplots(1, 2, figsize=(8, 4))
sns.histplot(residual,ax=axes[0])
axes[0].set_xlabel("Residual Value")
axes[0].set_title("Histogram of Residuals")
sm.qqplot(residual, line='s',ax = axes[1])
axes[1].set_title("Normal QQ Plot")
plt.tight_layout()
plt.show()


fig = sns.scatterplot(x = model.fittedvalues, y = model.resid)
fig.set_xlabel("Fitted Values")
fig.set_ylabel("Residuals")
fig.set_title("Fitted Values v. Residuals")
fig.axhline(0)
plt.show()
print(model_results)






