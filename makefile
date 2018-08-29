# Specify the final target name
EXE := Inventarz

CXX :=g++

#VPATH :=/home/user/Repos/EQ

# Specify the source files
# Effectively list all source files in the current directory
SRC := main.cpp

# From the source file list, get the corresponding object file list
# This is a clearer syntax for $(patsubst %.cpp,%.o,$(SRC))
OBJ := $(SRC:.cpp=.o)

# From the object file list, get the dependency file list to handle automatic
# recompilation when a header file is modified
DEP := $(OBJ:.o=.d)

# Specify preprocessor flags (this is a built-in variable)
CPPFLAGS :=-I/usr/include -I/home/user/Repos/EQ/Include/
# Required flags to enable the automatic dependency generation by the compiler
CPPFLAGS += -MMD -MP

# Specify compiler flags (this is a built-in variable)
# Here some basic warning flags
CXXFLAGS := -Wall -g -O0 -std=c++11

# Specify linker flags (this is a built-in variable)
LDFLAGS := -L/home/user/Repos/EQ/Libraries/SFML -L/usr/lib/x86_64-linux-gnu 

# Specify linker libraries (this is a built-in variable)
LDLIBS=-lsfml-graphics-s -lsfml-window-s -lsfml-audio-s -lsfml-system-s -lfreetype -lpng -ljpeg -lFLAC -logg -lvorbisenc -lvorbis -lvorbisfile -lxcb-randr -lxcb-image -lXrandr -lX11-xcb -lX11 -ludev -lGL -lglut -lopenal -lpthread -lz

# Tell make that these target are not real files
.PHONY: all clean

# Now the standard primary rule
all: $(EXE)

# How do we make $(EXE) ? Remember the recipe describe the linking phase
$(EXE): $(OBJ)
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@

# Let's clean up the mess
clean:
	$(RM) $(OBJ) $(DEP)

# Don't forget to include the dependency files to let make know when to recompile
#-include $(DEP)