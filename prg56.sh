#! /bin/bash
#demonstrate shell script using file tests
read -p "enter file name with absoulte path:" fname
if [ -e $fname ]
then
 echo "file exists"

 #check it is file
 if [ -f $fname ]
then
 echo "its a file"
fi

if [ -d $fname ]
 then 
  echo "its directory"
fi

if [ -L $fname ]
 then
 echo "its symbolink file"
fi

if [ -r $fname ]
 then
 echo "read permission is enabled for owner"
fi

if [ -w $fname ]
 then
 echo "write permission is enabled for owner"
fi

if [ -x $fname ]
 then
 echo "execute permission is enabled for owner"
fi

if [ -u $fname ]
 then
 echo "its uid is enabled"
fi

if [ -g $fname ]
 then  
 echo "its sgid is enabled"
fi

if [ -k $fname ]
 then
 echo "its sticky bit enabled"
fi

if [ -b $fname ]
 then
 echo "its block special file"
fi

if [ -c $fname ]
 then
 echo "its character special file"
fi

if [ -p $fname ]
 then
 echo "its named pipe file"
fi

else
 echo "file  not found"
fi
#End
