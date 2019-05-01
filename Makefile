CC=gcc
CFLAGS=-I.

libfastcluster.so: fastcluster.o
	$(CC) -shared -fPIC -o libfastcluster.so fastcluster.o -lstdc++

fastcluster.o: src/fastcluster.cpp
	$(CC) -fPIC -c src/fastcluster.cpp -o fastcluster.o

install :
	mkdir bin
	mv libfastcluster.so bin/libfastcluster.so

clean ::
	rm -f fastcluster.o