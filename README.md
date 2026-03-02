# llmPoolGo

A high-performance image analysis pipeline implemented in Go using **goroutines** and **channels**.

This project provides a Go-native alternative to the [llmpool](https://github.com/rajeshkumarblr/llmpool) C++ implementation, demonstrating Go's efficient concurrency model for handling LLM-based tasks.

## Features

- **Concurrent Processing**: Leverages goroutines and channels for efficient worker pool management.
- **Vision Model Integration**: Uses [Ollama](https://ollama.com/) with the `qwen3-vl` model for image description.
- **Base64 Encoding**: On-the-fly image encoding for API transmission.
- **Clean Output**: Generates concise, 10-line text descriptions for each processed image.
- **Scalable**: Configurable worker count (default: 3) to optimize throughput.

## Prerequisites

- **Go**: 1.23+ recommended.
- **Ollama**: Must be running locally (`ollama serve`).
- **Model**: Ensure the `qwen3-vl` model is pulled:
  ```bash
  ollama pull qwen3-vl
  ```

## Usage

1. **Clone the repository**:
   ```bash
   git clone <repo-url>
   cd llmPoolGo
   ```

2. **Configure Paths**:
   The `main.go` file is configured to look for images in `/home/rajesh/code/cpp/concurrency/llmpool/images`. Update `imgDir` in `main.go` if your images are located elsewhere.

3. **Run the pipeline**:
   Using the Makefile:
   ```bash
   make run
   ```
   Or build and run:
   ```bash
   make build
   ./llmPoolGo
   ```

## Architecture

The system uses a simple but effective producer-consumer pattern:
1. **Main Goroutine**: Reads the image directory and sends `Task` objects into a buffered channel.
2. **Worker Goroutines**: A fixed set of goroutines (default 3) consume tasks from the channel.
3. **Execution**: Each worker performs Base64 encoding, calls the Ollama API, and writes the resulting text description to a `.txt` file alongside the original image.

## Comparison with C++

| Feature | Go (llmPoolGo) | C++ (llmpool) |
| :--- | :--- | :--- |
| **Concurrency** | Goroutines & Channels | `std::thread` Pool & `std::future` |
| **HTTP Client** | `net/http` (Standard Library) | `libcpr` (Modern C++ Wrapper) |
| **JSON Support** | `encoding/json` | `nlohmann/json` |
| **Error Handling** | Explicit multiple returns | Exceptions / Return codes |
