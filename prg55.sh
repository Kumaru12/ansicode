#!/bin/bash



echo "enter your pass pharse:"
read -s pass1
echo "enter your pass phrase again:"
read -s pass2
# now do the cmparision

if [ $pass1 = $pass2 ]
then
echo "you pass phrase is success"
elseif [ $pass1 != $pass2 ]
then
  echo "your pass phrase doesnt match ...try again"
fi
echo "the entered pass phrase are 1) $pass1 2) $pass2"
#end
