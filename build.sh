# build this repo
export PATH=/usr/bin:${PATH}
[ -d llama.cpp ] || git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make

# download the model from a torrent (4GB)
[ -f ggml-alpaca-7b-native-q4.bin ] || aria2c --seed-time=0 "magnet:?xt=urn:btih:0e51003c8a5610aa713f675891f0a7f87051be1a&dn=ggml-alpaca-7b-native-q4.bin&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce"

# run it:
# ./main --color -i -ins -n 512 -p "You are a helpful AI who will assist, provide information, answer questions, and have conversations." -m ../ggml-alpaca-7b-native-q4.bin


# other stuff that might be useful

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
