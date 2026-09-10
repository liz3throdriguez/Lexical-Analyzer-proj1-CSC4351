export CLASSPATH=$CLASSPATH:$(pwd):$(pwd)/lib/classes
make clean
make 
java Parse.Main test.c