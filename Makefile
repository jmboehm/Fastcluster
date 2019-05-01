CC=gcc
CFLAGS=-I.

libfastcluster.so: fastcluster.o
	$(CC) -shared -fPIC -o libfastcluster.so fastcluster.o -lstdc++

fastcluster.o: src/fastcluster.cpp
	$(CC) -c src/fastcluster.cpp -o fastcluster.o

clean ::
	rm -f fastcluster.o