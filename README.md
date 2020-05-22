# **Covid-19**

## **Background**
This is an evaluation of a Covid-19 dataset that has been provided by a [repo](https://github.com/microsoft/Bing-COVID-19-Data) from [Bing's](https://www.bing.com/covid/local/unitedstatesa) Covid-19 tracker.  There is also a very informative [widget](https://github.com/microsoft/COVID-19-Widget) that you can embed into your website.
## **Objectives**
- Evaluate Deaths and Confirmed Cases worldwide then specifically in the United States according to this dataset.
- Determine if there are some conclusions this data can provide.
- Utilize tools such as Tableau, Pandas and SQL.

## **Process**
### Python and Pandas
1.  I first created a Jupyter notebook and evaluated what the data looked like and if there needed to be transformations done to columns.
2.  Replaced NA values where I could, changed data types to prep for database insertion and then exported a copy of the file to a csv.
3.  I created 3 python files to try and load the dataset to MySQL however there was an issue with my connect file.
<>