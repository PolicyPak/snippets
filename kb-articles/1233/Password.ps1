$key = (1,2,3,4,5,1,2,3,4,5,11,12,13,14,15,20,30,40,50,5,4,3,2,1)
read-host -assecurestring | convertfrom-securestring -key $key | out-file \\server\share\file.txt