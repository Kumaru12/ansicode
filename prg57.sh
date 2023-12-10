#!/bin/bash
#create a vg
read -p "enter the disk you want (do not prifix with /dev. just provide disk name:" disk
if [ -e /dev/$disk -a -b /dev/$disk ]
 then
	lsblk /dev/$disk
	read -p "choose the divice from the above list (do not include /dev in disk name):" part
	if [ -b /dev/$part ]
	then
	  echo "below are the volume groups exists:"
	  vgs
	  read -p "enter a new valume group name to be created:" vgname
	  vgs|grep -w $vgname>/dev/null 2>&1
	  if [ $? -ne 0 ]
	  then
	  getvg=`pvs -o +vgname /dev/$part --noheading --separator :| cut -f2 -d:`
	  if [ -z $getvg ]
	  then
		pvcreate -f /dev/$part
		if [ $? -ne 0 ]
		then 
		  echo "could not create pv"
		  exit
		  fi
		 vgcreate -f $vgname /dev/$part &>/dev/null
		 if [ $? -ne 0 ]
		 then
		   echo "could not create vg"
		   exit
		 fi
	else
	echo "the given disk/partition is in used by other valume group $getvg"
	exit
	fi
	fi # end of creation pv and  vg
	read -p "enter lv name..:" lv
	if [ -z $lv ]
	then
	   echo "can not create lv .. please provide valid lv name"
	   exit
	fi
	read -p "enter filesystem size in mb:" size
	if [ -z $size ]
	then
	   echo "you have not provided lv size.. proceeding with 256MB"
	   size=256
	fi
	read -p "enter filesystem mountpoint:" mp
        if [ -d $mp ]
        then
          echo "mounting point exists"
        else
          mkdir -p $mp &>/dev/null
	fi
	lvcreate -y -n $lv -L ${size}M $vgname /dev/$part &>/dev/null
	if [ $? -eq 0 ]
	then
	  mkfs.ext4 /dev/$vgname/$lv &>/dev/null
	fi
	grep $mp /etc/fstab &>/dev/null
	if [ $? -eq 0 ]
	then
	    echo "entry exists in /etc/fstab for $mp mount point... skipping the mount"
	    mount -a
	  else
	    echo "dev/$vgname/$lv $mp ext4 defaults 0 0">>/etc/fstab
	    mount -a
	  fi
	else
	  echo "invalied devies or partition selected.. return the program .. existing."
        fi
        else
        echo "the disk is invalid.. existing"
fi 
# i added extra line in this prg57.sh