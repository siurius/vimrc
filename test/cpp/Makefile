CXX = g++
CXXFLAGS += -I./include -std=c++11 -O2 -g
LDFLAGS += -lstdc++

all: test

OBJS  = build/main.o
OBJS += build/module.o

build/main.o: src/main.cc include/module.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

build/module.o: src/module.cc include/module.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

build/test: $(OBJS)
	$(CXX) $^ $(LDFLAGS) -o $@

test: build/test

clean:
	rm -f $(OBJS) build/test
