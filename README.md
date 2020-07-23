# Docker for Conda 

Docker for Conda aims to generate reproducible Anaconda-based environments in Debian containers. 

## Installation

1. Install Docker on your system.
2. Generate your own or export an  Anaconda environment YAML file using 
```bash
$ conda env -n your_env export > conda_environment.yml
```
3. Replace the original **conda_environment.yml** with your own Anaconda environment. Make sure to change the prefix, if desired.

## Usage

1. Generate the Docker image.
```bash
$ cd docker-conda
$ docker build .
```
2. Run a container with the generated Docker image and forward port 8080 for Jupyter Lab.
```bash
$ docker run -p 8080:8080 <image_id>
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)