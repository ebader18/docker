# Step 1: Choose a base Python image
# Using a specific Python version is good practice. '-slim' variants are smaller.
FROM python:3.10-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Install JupyterLab
# Upgrade pip and install jupyterlab. Using --no-cache-dir keeps the image smaller.
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir jupyterlab

# Step 4: Expose the default Jupyter port
# This informs Docker that the container listens on this port.
EXPOSE 8888

# Step 5: Define the command to run when the container starts
# - Run 'jupyter lab'
# - Bind to all network interfaces inside the container (--ip=0.0.0.0) so it's accessible from the host
# - Use the standard port (--port=8888)
# - Allow running as the root user inside the container (--allow-root)
# - Prevent auto-opening a browser inside the container (--no-browser)
# - Set the directory for notebooks to our working directory (--notebook-dir=/app)
# - IMPORTANT SECURITY NOTE: The following disables token authentication for easier initial access.
#   Remove these lines if you need security (Jupyter will print a token in the logs).
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--notebook-dir=/app", "--NotebookApp.token=''", "--NotebookApp.password=''"]