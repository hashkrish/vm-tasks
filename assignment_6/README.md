# Assignment 6

Write a bash script ` script.sh ` to scrape a weather forecast website.

The script takes 3 command line arguments

* argument 1 
        -  ` city-name `.
  
* argument 2 
        - One of ` min ` and ` max ` refers to minimum temperature and maximum temperature respectively.

* argument 3 
        - One of ` mode ` and ` average `.
        - If you get more than one mode, your script should return the smallest mode value.

Note : 

* Round of your answer to two decimal places.

Url of weather forecast website : [http://weather.local](http://weather.local)

Interpretation :

```
./script.sh city-name min average
```

This returns the ` average ` of the ` min `imum temperature of city ` city-name ` on all days given in forecast.
