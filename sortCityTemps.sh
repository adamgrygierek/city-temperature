#!/bin/bash
#array of cities
cities=("Wroclaw" "London" "Berlin")

#creating empty file to store temperatures
> temperatures.txt

#creating loop to iterate through cities
for city in ${cities[@]}
do
#calling external script for weather and trimming output to city and number
#    echo $(./weather.sh -s $city | sed 's/+//' | sed 's/°C//')
#rediriecting output to file
    ./weather.sh -s $city | sed 's/+//' | sed 's/°C//' >> temperatures.txt
#wait 1 second to prevent sending to many requests
    sleep 1
done
sort -k2 temperatures.txt > sorted_temperatures.txt