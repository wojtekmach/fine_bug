SRC := c_src/fine1.cpp
TARGET := priv/fine1.so

CPPFLAGS := -std=c++17 -fPIC -I$(ERL_INCLUDE_DIR) -I$(FINE_INCLUDE_DIR)
LDFLAGS := -dynamiclib -undefined dynamic_lookup

all: $(TARGET)

$(TARGET): $(SRC)
	mkdir -p priv
	clang++ $(CPPFLAGS) $(LDFLAGS) -o $@ $^
