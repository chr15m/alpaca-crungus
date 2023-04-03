#!/bin/sh

./llama.cpp/main --color -i -ins -n 512 --threads 8 -p "You are a helpful AI who will assist, provide information, answer questions, and have conversations." -m ggml-alpaca-7b-native-q4.bin
