CPATH='../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo "File has been found"
else 
    echo "File has not been found"
fi

rm -rf tempFile
mkdir tempFile
cp student-submission/ListExamples.java tempFile


cd tempFile
ls 
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > junitOutput.txt 
ls
FAILURES=`grep -c FAILURES!!! junitOutput.txt`
if [[ $FAILURES -eq 0 ]]
then
    echo 'You passed all the tests'
    echo '4/4'
else
    RESULTS=`grep "Tests:" junitOutput.txt`
    COUNTER=$RESULTS
    echo "Score: $COUNTER/4 "
fi
