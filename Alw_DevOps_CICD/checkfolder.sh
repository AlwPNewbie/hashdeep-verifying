#!/bin/bash

# Install hashdeep
sudo apt-get update
sudo apt-get -y install autoconf automake
sudo apt-get install hashdeep

# Download folder for testing 
git clone https://github.com/AlwPNewbie/Andriod-App.git
mv Andriod-App/ Andriod-AppOriginal/

git clone https://gitlab.com/AlwPNewbie/Andriod-App.git
mv Andriod-App/ Andriod-AppDuplicate/

# To count the total files recursively in the directory, including subdirectory
for i in */ .*/ ; do 
    echo -n $i": " ; 
    (find "$i" -type f | wc -l) ; 
done
