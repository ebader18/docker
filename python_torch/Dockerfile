# Step 1: Choose a base image WITH CUDA support
# Example: Using NVIDIA's official CUDA 12.1 image with cuDNN 8 on Ubuntu 22.04
# Check NVIDIA's Docker Hub (hub.docker.com/r/nvidia/cuda) for other versions if needed.
FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Install Python 3, pip, JupyterLab, and PyTorch with CUDA support
# - Update apt package list
# - Install essential packages like python3 and python3-pip (-y assumes yes to prompts)
# - Clean up apt cache to reduce image size
# - Upgrade pip using the python3 executable
# - Install jupyterlab
# - Install PyTorch, torchvision, torchaudio compatible with CUDA 12.1
#   (Get the correct URL from pytorch.org/get-started/locally/ if CUDA version differs)
# - Use --no-cache-dir to keep the image smaller
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir jupyterlab tqdm && \
    python3 -m pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# Step 4: Expose the default Jupyter port
EXPOSE 8888

# Step 5: Define the command to run when the container starts
# (Using python3 explicitly in case the base image has multiple pythons)
# Arguments for jupyter lab remain the same
CMD ["python3", "-m", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--notebook-dir=/app", "--NotebookApp.token=''", "--NotebookApp.password=''"]