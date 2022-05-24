#Joaquin Quintana 
#simple makefile

#create and execution for the app and for the tests
all: myapp tests

#and a varaible so we can get user input for flags
#User can make file with optinal flags as make OPTS='-I' to overide default
CC=gcc
OPTS=-Wall

#link objects files and use -lm to link math.h library properly
myapp: app.o marine.o soar.o vouched.o
	$(CC) $(OPTS) -o myapp app.o marine.o soar.o vouched.o -lm	
#gcc -Wall -o myapp app.o marine.o soar.o vouched.o -lm

tests: test.o marine.o soar.o vouched.o
	$(CC) $(OPTS) -o tests test.o marine.o soar.o vouched.o -lm

#create object files for linking 
app.o: app.c
	$(CC) $(OPTS) -c app.c

marine.o: marine.c
	$(CC) $(OPTS) -c marine.c

soar.o:soar.c
	$(CC) $(OPTS) -c soar.c

vouched.o: vouched.c
	$(CC) $(OPTS) -c vouched.c

test.o: test.c
	$(CC) -c test.c

#gcc -o test test.o marine.o soar.o vouched.o -lm

#remove any file with .o ext and the created which are tests and myapp
clean:
	rm *.o 
	rm tests myapp