CXX :=          $(shell which g++ || which clang++ || which c++)
CXXFLAGS =	-g -stdlib=libc++ -std=c++11
LDFLAGS =	-lcrypto -lssl
INCLUDES =      
OPT_FLAGS =     -O3
DEBUG_FLAGS =   -g
WARN_FLAGS =    -Wall -Wpedantic -Wsign-compare -Wno-deprecated-declarations
CXXFLAGS =      -std=c++11 $(OPT_FLAGS) $(DEBUG_FLAGS) $(WARN_FLAGS) $(INCLUDES)

all: dirs bin/openssl_async_echo_client bin/openssl_async_echo_server

.PHONY: dirs

clean: ; rm -fr bin

dirs: ; mkdir -p bin

bin/openssl_async_echo_client: src/openssl_async_echo_client.cc
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) -o $@

bin/openssl_async_echo_server: src/openssl_async_echo_server.cc
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) -o $@
