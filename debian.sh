# Install OS dependencies
sudo apt-get update
sudo apt-get install -y \
  software-properties-common
sudo apt-get update
sudo apt-get install -y \
  curl \
  git

# Install Python
sudo apt-get install -y \
  python3.11 \
  python3-pip

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install FastChat
# https://github.com/lm-sys/FastChat#method-2-from-source
git clone https://github.com/lm-sys/FastChat.git
cd FastChat
pip3 install --upgrade pip
pip3 install -e .

# FastChat Model
# https://github.com/lm-sys/FastChat#vicuna-13b
cd ..
mkdir models
cd models
MODELS_PATH = $(echo $PWD)
cd ../FastChat
python3 -m fastchat.model.apply_delta \
    --base-model-path $MODELS_PATH/llama-13b \
    --target-model-path $MODELS_PATH/output/vicuna-13b \
    --delta-path lmsys/vicuna-13b-delta-v1.1
