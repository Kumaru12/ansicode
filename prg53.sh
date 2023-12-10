#!/bin/bash
#Demonstrate while loop
#print natural numbers
read -p "enter the upper limit:" n
c=1
while [ $c -le $n ]
do 
  echo $c
  ((c++))
done
#end extra added
#hai this is new line for new commit