# build this repo
export PATH=/usr/bin:${PATH}
[ -d llama.cpp ] || git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make

# models/llama-7B/ggml-model.bin
mkdir -p build

aria2c --seed-time=0 "magnet:?xt=urn:btih:5aaceaec63b03e51a98f04fd5c42320b2a033010&dn=ggml-alpaca-7b-q4.bin&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fopentracker.i2p.rocks%3A6969%2Fannounce"

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
