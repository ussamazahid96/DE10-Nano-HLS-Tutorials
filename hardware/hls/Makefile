DEVICE     := 5CSEBA6U23I7
DATE 	   := date
ECHO 	   := echo
TARGETS    := dtime clean csim csynth dtime
COMP_FILE  := top.cpp
TB_FILE	   := top_tb.cpp 
            
CXX    := i++
RM     := rm -rf

.PHONY: all
all: $(TARGETS)

dtime:
	@$(DATE)

clean:
	-$(RM) csim *.prj

csim: $(TB_FILE)
	@$(ECHO) "Running CSIM..."
	$(CXX) $(CXXFLAGS) -v -march=x86-64 $< -o $@
	./$@

csynth: $(COMP_FILE)
	@$(ECHO) "Running CSYNTH..."
	$(CXX) $(CXXFLAGS) -v --simulator none --quartus-compile -march=$(DEVICE) $< -o $@

