SHELL:=/bin/bash

test_works: mkTb_rca32.cxx
	c++ -O0  -Wall -Wno-unused -D_FILE_OFFSET_BITS=64 -Ilib -Wno-uninitialized -fpermissive -fPIC -c -o "mkTb_rca32.o" "mkTb_rca32.cxx" -v
test_O1: mkTb_rca32.cxx
	c++ -O1  -Wall -Wno-unused -D_FILE_OFFSET_BITS=64 -Ilib -Wno-uninitialized -fpermissive -fPIC -c -o "mkTb_rca32.o" "mkTb_rca32.cxx" -v
test_broken: mkTb_rca32.cxx
	c++ -O3  -Wall -Wno-unused -D_FILE_OFFSET_BITS=64 -Ilib -Wno-uninitialized -fpermissive -fPIC -c -o "mkTb_rca32.o" "mkTb_rca32.cxx" -v -save-temps
clean:
	rm -rf mkTb_rca32.cxx
	rm -rf mkTb_rca32.ii

.PHONY: clean
.DEFAULT_GOAL := test_broken

