FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

ENV PORT=

WORKDIR /app/FastChat

# Install OS dependencies
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get update
# RUN apt-get install -y \
#   build-essential \
#   make \
#   net-tools \
#   wget
RUN apt-get install -y \
  git

# Install Python
RUN apt-get install -y \
  python3.11 \
  python3-pip

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install FastChat
# https://github.com/lm-sys/FastChat#method-2-from-source
RUN git clone https://github.com/lm-sys/FastChat.git .
RUN pip3 install --upgrade pip
RUN pip3 install -e .

# FastChat Model
# https://github.com/lm-sys/FastChat#vicuna-7b
RUN mkdir -p /app/models/output
RUN python3 -m fastchat.model.apply_delta \
    --base-model-path /app/models/llama-7b \
    --target-model-path /app/models/output/vicuna-7b \
    --delta-path lmsys/vicuna-7b-delta-v1.1

# EXPOSE $PORT

# ENTRYPOINT ["python3 -m fastchat.serve.cli --model-path /path/to/model/weights"]
