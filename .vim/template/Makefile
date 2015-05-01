#EXEC_NAME=test_tableau
#FILE=rapport
#Pour C
CC=gcc
CXX=g++
CFLAGS=-Wall -Wextra -g -std=c99 
LDFLAGS=#-lSDL -lSDL_mixer #Linker
SOURCES=.
HEADERS=.
OBJETS=.
LIBS= 
INCLUDES= 

C_FILES=$(wildcard *.c)
OBJ_FILES=$(C_FILES:%.c=%.o)
I_FILES=$(C_FILES:%.c=%.i)
AS_FILES=$(C_FILES:%.c=%.s)





SVG_SOURCES=$(wildcard *.svg)
SVG_PDFFILES=$(SVG_SOURCES:%.svg=%.pdf)

.PHONY : all, view, view_more, clean, realclean

#======================= PROGRAMMATION ===============

EXEC_NAME: $(C_FILES) 
	$(CC) $(CFLAGS) $(LDFLAGS) $(C_FILES) -o $@ 

%.o: %.c %.h
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@ 

%.i: %.c %.h
	$(CC) $(CFLAGS) $(LDFLAGS) -E $< -o $@

%.s: %.c %.h
	$(CC) $(CFLAGS) $(LDFLAGS) -S $< -0 $@ 


#========================= LATEX ======================

%.pdf: %.svg
	inkscape $< --export-pdf $@

%.pdf: %.tex 
	pdflatex $<

#========================== PHONY =======================

compile_run: clean  $(EXEC_NAME) 
	./$(EXEC_NAME)
view: $(EXEC_NAME)
	./$(EXEC_NAME)&

clean:
	rm -f $(FILE).ps $(FILE)-nup.ps $(FILE).log $(FILE).aux $(FILE).toc
	rm -f $(OBJ_FILES) $(I_FILES) $(AS_FILES)

realclean: clean 
	rm -f $(FILE).pdf
	rm -f $(EXEC_NAME)

debug: $(EXEC_NAME)
	xterm -hold -e gdb ./$(EXEC_NAME) &

valgrind: $(EXEC_NAME)
	xterm -hold -e valgrind ./$(EXEC_NAME) &
