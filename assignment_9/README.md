# Assignment 9

Write a bash script ` script.sh ` to process iris data and return descriptive statistics of a particular column of the dataset.

## Iris flower data set

* Source
    - Creator : R. A. Fischer
    - [https://archive.ics.uci.edu/ml/datasets/iris](https://archive.ics.uci.edu/ml/datasets/iris)

### Attribute Information

1. sepal length in cm
2. sepal width in cm
3. petal length in cm
4. petal width in cm
5. class:
    - Iris Setosa
    - Iris Versicolour
    - Iris Virginica

The dataset is stored in a table in sqlite3 database.
* Database name : ` iris-flower.sqlite3 `
* Table name : ` iris `
* Table Schema : `CREATE TABLE iris (id INTEGER PRIMARY KEY AUTOINCREMENT, sepal_length REAL, sepal_width REAL, petal_length REAL, petal_width REAL, class VARCHAR(20));`

* Find the database in this directory : `/opt/iris`

Directory Structure :

```tree
/opt/
  |_ iris/
       |_ iris-flower.sqlite3
```

Fetch the data in a form suitable for your need.

Hint :

* Use ` .help ` in ` sqlite3 ` interpreter to know how to get the data in desired form.
* You can use ` heredoc ` feature of ` bash `
* Use ` .quit ` to quit the ` sqlite3 ` interpreter

After getting the data, compute the descriptive statistics using awk (can use any other command line utility in bash).

The output must be `jq` parsable.

The script will be invoked as follows:

```terminal
~$ ./script.sh <class> <feature_name>
```

Argument 1 :

* ` <class> `

    - ` setosa ` : For class Iris Setosa
    - ` versicolor ` : For class Iris Versicolour
    - ` virginica ` : For class Iris Virginica

Argument 2 :

* ` <feature_name> `
    
    - ` sepal_length `
    - ` sepal_width `
    - ` petal_length `
    - ` petal_width `

* ` jq ` parsable output :

    ```json
    {"mean":<mean>, "std":<std>}
    ```

* ` <mean> ` : mean of rows of ` <feature_name> ` over ` <class> `
* ` <std> ` : standard deviation of rows of ` <feature_name> ` over ` <class> `

Round off all values up to 3 decimal places.

## Bonus AWK Library : ` t2pjlibee `

* The library ` t2pjlibee ` ( ` t `ext ` to ` ` p `arsable ` j `son ` li `brary ` b `ee ) is given to you which makes it easy to convert a string suitable for ` jq ` processing.

* It has an awk library file ` jlibee ` which defines a function ` jbee ` to convert a string to json data.

* More information is available in ` README.md ` file in directory ` t2pjlibee `.

* Find the library in this directory : ` /opt/t2pjlibee `

Directory Structure :

```tree
/opt/
  |_ t2pjlibee/
        |- jlibee
        |_ README.md
```
