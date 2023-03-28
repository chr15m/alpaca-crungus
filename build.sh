# build this repo
export PATH=/usr/bin:${PATH}
[ -d llama.cpp ] || git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make

# obtain the original LLaMA model weights and place them in ./models
#ls ./models
#65B 30B 13B 7B tokenizer_checklist.chk tokenizer.model

# install Python dependencies
#python3 -m pip install torch numpy sentencepiece

# convert the 7B model to ggml FP16 format
#python3 convert-pth-to-ggml.py models/7B/ 1

# quantize the model to 4-bits
#python3 quantize.py 7B

# run the inference
#./main -m ./models/7B/ggml-model-q4_0.bin -n 128
