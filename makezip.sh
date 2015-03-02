#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: makebuilds <version number>"
    exit 1
fi

rm Builds/README.txt
echo -n "Build time: " >> Builds/README.txt 
ls -lT ../Builds/GLOBE_Jeopardy_1.1_mac.app/ | awk '{print $6, " ", $7, " ", $8, " ", $9 }' >> Builds/README.txt
echo "" >> Builds/README.txt
cat README.md >> Builds/README.txt

cd Builds

echo "Making mac .zip file"
cp -r ../../Builds/*$1_mac.app .
zip -r GLOBE_Jeopardy_$1_mac.zip *$1_mac.app README.txt
rm -r *$1_mac.app

echo "Making PC .zip file"
cp -r ../../Builds/*$1_windows* .
zip -r GLOBE_Jeopardy_$1_windows.zip *$1_windows* README.txt
rm -r *$1_windows_Data *$1_windows.exe

exit 0
