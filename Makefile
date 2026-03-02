# Go Makefile

# Binary name
BINARY_NAME=llmPoolGo

# Main entry point
MAIN_FILE=main.go

.PHONY: all build run clean help

all: build

## build: Build the binary
build:
	go build -o $(BINARY_NAME) $(MAIN_FILE)

## run: Run the application directly
run:
	go run $(MAIN_FILE)

## clean: Remove build artifacts
clean:
	rm -f $(BINARY_NAME)

## help: Show this help message
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' |  sed -e 's/^/ /'
