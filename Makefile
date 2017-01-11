# To deal with the Tabs getting converted to spaces, run vim as "vim -u NONE ./Makefile"
# $@ - left side of rule.
# $^ - right side of rule.

CC = gcc -pthread -std=gnu99

DEPS = threadpool/threadpool.h threadpool/threads.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $<


OBJ_S = server.o threadpool/threadpool.o
server: $(OBJ_S)
	$(CC) -o $@ $^

clean:
	rm -rf ./server
	find . -name "*.o" -type f -delete
