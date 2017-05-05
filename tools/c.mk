CC=clang
CFLAGS=-g

SOURCES=$(wildcard *.c)
OBJECTS=$(SOURCES:%.c=%.o)

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

$(PROJ): $(OBJECTS)
	$(CC) -o $@ $^

exec: clean $(PROJ)
	./$(PROJ)

clean:
	rm -rf $(OBJECTS) $(PROJ)

all: exec
