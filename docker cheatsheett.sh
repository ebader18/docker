Create environment
    Create folder for environments
    python3 -m menv gpu
Activate environment
    Go to folder where environment is located
    source /bin/activate

List containers
    docker ps
List images
    docker images

Build image from dockerfile
    Make sure to activate python environment
    Go to location of dockerfile
    docker build -t pytorch-jupyterlab .
        tag image with name "pytorch-jupyterlab"
Run image
    sudo docker run --rm -p 8888:8888 -v ~/_sw/docker/python/notebooks:/app --name jupyter-server my-jupyter-lab
    sudo docker run --rm --gpus all -p 8888:8888 -v ~/_sw/docker/python_torch/notebooks:/app --name jupyter-gpu-server my-jupyter-lab-gpu
Access JypterLab
    http://127.0.0.1:8888