#!/bin/bash
folder="./src"
mkdir -p $folder
flexFiles=`ls ./*.flex`
for flexFile in $flexFiles
do
  jflex $flexFile
done

cupFiles=`ls ./*.cup`
for flexFile in $cupFiles
do
  java java_cup.Main $cupFiles
done

mv $folder/Main.java ./Main.java
rm $folder/*.java
rm ./*.java~
rm $folder/*.class
mv ./*.java $folder/

cd $folder
javaFiles=`find . -type f -name "*.java"`
for javaFile in $javaFiles
do
  `javac $javaFile`
done

echo "Processamento finalizado."
sleep 1
cp ../teste.txt ./
java Main
