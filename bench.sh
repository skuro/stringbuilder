#!/bin/sh

SUITE=$1

if [ "$SUITE" = "ibm5" ]
then
	JAVA="/home/vagrant/java/ibm-java2-i386-50/bin/java"
elif [ "$SUITE" = "ibm6" ]
then
	JAVA="/home/vagrant/java/ibm-java-i386-60/bin/java"
elif [ "$SUITE" = "ibm7" ]
then
	JAVA="/home/vagrant/java/ibm-java-i386-70/bin/java"
elif [ "$SUITE" = "java5" ]
then
	JAVA="/home/vagrant/java/jdk1.5.0_22/bin/java"
elif [ "$SUITE" = "java6" ]
then
	JAVA="/home/vagrant/java/jdk1.6.0_41/bin/java"
elif [ "$SUITE" = "java7" -o "$SUITE" = "ecj" ]
then
	JAVA="/home/vagrant/java/jdk1.7.0_17/bin/java"
fi

if [ "$SUITE" = "ecj" ]
then
	JAVAC="/home/vagrant/java/jdk1.7.0_17/bin/java -jar /home/vagrant/java/ecj-4.2.2/ecj-4.2.2.jar -5"
else
	JAVAC=$JAVA"c"
fi

echo "Testing $SUITE"
echo "java  => $JAVA"
echo "javac => $JAVAC"

echo "Prepare the environment"
$JAVAC *.java
rm -Rf $SUITE > /dev/null 2>&1
mkdir $SUITE
mv *.class $SUITE
cd $SUITE

echo "Running tests for $SUITE"
for i in catplus catsb catsb2
do
	$JAVA CatTest $i
done
cd ..
