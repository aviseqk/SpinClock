# ---------------------------
#  SpinClock - Local Makefile
# ---------------------------


CC	:= gcc
CFLAGS := -Wall -Wextra -Werror -std=c11 -Iinclude
LDFLAGS := 
SRC_DIR := src
OBJ_DIR := build
TEST_DIR := tests
UNITY_DIR := $(TEST_DIR)/unity

SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))

TARGET := $(OBJ_DIR)/spinclock
TEST_TARGET := $(OBJ_DIR)/test_spinclock

# default target
all: build_dir $(TARGET)

# build main library
$(TARGET): $(OBJ_FILES) $(CC) $(CFLAGS) $^ -o $@

# compile object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(CC) $(CFLAGS) -c $< -o $@

# build and run tests
test: build_dir $(TEST_TARGET)
	@echo "Running unit tests..."
	./$(TEST_TARGET)

# build test executable (depends on Unity)
$(TEST_TARGET): $(TARGET) $(TEST_DIR)/test_main.c
	$(CC) $(CFLAGS) -I$(UNITY_DIR)/src $(TEST_DIR)/test_main.c $(SRC_FILES) -o $@

# run clang-tidy, for manual linting
lint:
	clang-tidy $(SRC_DIR)/*.c -- -Iinclude

# run sonar-scanner locally, for local sonar analysis
sonar:
	sonar-scanner

# create build directory
build_dir:
	@mkdir -p $(OBJ_DIR)

# clean build artifacts
clean:
	rm -rf $(OBJ_DIR)

.PHONY: all clean test lint sonar build_dir
