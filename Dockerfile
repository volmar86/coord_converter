# syntax=docker/dockerfile:1

FROM python:3.10-slim-bullseye

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

# Declare port used by jupyter-lab
EXPOSE 8888

# Set default command
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

#"jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"
# "voila" "--port=8888" "--no-browser" "--Voila.ip=0.0.0.0" "Coord_app.ipynb"
#"jupyter-lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root" "--NotebookApp.default_url=/voila/render/Coord_app.ipynb"