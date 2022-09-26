# Task 1
# To count the total files recursively in the directory, including subdirectory
for i in */ .*/ ; do 
    echo -n $i": " ; 
    (find "$i" -type f | wc -l) ; 
done


# Task 2
# Generate a sha1 hash for every file. Store the hashes in some file.
# Install hashdeep
sudo apt-get update
sudo apt-get -y install autoconf automake
sudo apt-get install hashdeep

# Method 1 (Creating 2 hash files, sort and compare the difference)
# Recursive mode
hashdeep -b -r Andriod-AppOriginal > original-results.txt
# Negative Matching
hashdeep -x -k original-results.txt *
# Positive Matching
#hashdeep -M -k original-results.txt *

# Verifying checksum
hashdeep -c sha1 -r -o f * > original-results-verified.txt
sort original-results-verified.txt > original-results-sorted.txt


# Task 3
# Connect to Gitlab and generate the same info and compare them. 
# if they are the same, then return pass, else return fail and list out the files that are missing or hash is different


# Recursive mode
hashdeep -b -r Andriod-AppDuplicate > second-results.txt
# Verifying checksum
hashdeep -c sha1 -r -o f * > second-results-verified.txt
sort second-results-verified.txt > second-results-sorted.txt

diff original-results-sorted.txt second-results-sorted.txt > difference.txt
cat difference.txt

# Method 2
# To perform an audit
hashdeep -vvv -r -l -a -k original-results.txt Andriod-AppDuplicate/       # test the audit

rm -r original-results-verified.txt original-results-sorted.txt original-results.txt
rm -r second-results-sorted.txt second-results-verified.txt second-results.txt 