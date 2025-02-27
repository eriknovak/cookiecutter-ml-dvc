# {{ cookiecutter.project_name }}

[![Python Version](https://img.shields.io/badge/python-{{ cookiecutter.python_version }}-orange.svg)](https://www.python.org/downloads/)
[![CCDS Project](https://img.shields.io/badge/CCDS-Project%20template-orange?logo=cookiecutter)](https://github.com/eriknovak/cookiecutter-ml-dvc/)
[![DVC](https://img.shields.io/badge/DVC-Data_Version_Control-orange)](https://dvc.org/)
[![License](https://img.shields.io/badge/License-BSD--2--Clause-orange.svg)](LICENSE)


{{ cookiecutter.project_description }}

Inspired by the [cookiecutter] folder structure. Supports DVC for ML pipeline orchestration.

## 📁 Project structure

The project is structured as follows:

```plaintext
.
├── data/                    # Data used in the experiments
├── models/                  # Model artifacts
├── notebooks/               # Jupyter notebooks
├── results/                 # Experiment results
├── scripts/                 # Helper scripts
├── src/                     # Source code
├── tests/                   # Tests
├── .dvcignore               # DVC ignore config
├── .gitignore               # Git ignore config
├── LICENSE                  # License
├── Makefile                 # Makefile with project commands
├── README.md                # Project readme
├── requirements.txt         # Project dependencies
├── pyproject.toml           # The project config
├── dvc.yaml                 # DVC pipeline config
└── params.yaml              # DVC pipeline params
```

## ☑️ Requirements

Before starting the project make sure these requirements are available:

- [python]. For setting up the environment and Python dependencies.
- [git]. For versioning your code.

## 🛠️ Setup

### Automatic setup


To setup the project, run the following commands:

```bash
bash scripts/setup_env.sh
```

This script will:

1. Create a python environment named `{{ cookiecutter.project_slug }}`
2. Install all required dependencies including dev dependencies
3. Set up the git filter for Jupyter notebooks
4. Create necessary data directories

### Manual setup

If you prefer to set up the project manually, follow the instructions below.

#### Create a python environment

First, create a virtual environment where all the modules will be stored. Using the `venv` command, run the following commands:

```bash
# create a new virtual environment
python -m venv venv

# activate the environment (UNIX)
source ./venv/bin/activate

# activate the environment (WINDOWS)
source ./venv/Scripts/activate

# deactivate the environment (UNIX & WINDOWS)
deactivate
```

#### Install dependencies

Check the `requirements.txt` file. If you have any additional requirements, add them here.

Afterwards, install the dependencies:

```bash
# install the dependencies in development mode
pip install -e .[dev]
```

#### Create data directories

Create the necessary data directories:

```bash
mkdir -p data/raw data/processed data/final data/external
```

## 🗃️ Data

### Data structure

The data is stored in the `data/` directory. The structure is as follows:

- Raw data goes in `data/raw/`
- Processed data will be stored in `data/processed/`
- Final data will be stored in `data/final/`
- External data will be stored in `data/external/`
- All data files are tracked by DVC (not Git)

### Setting up DVC remote storage

This project uses DVC for data versioning and storage. You can configure remote storage in several ways:

```bash
# Run the automated setup script
bash scripts/setup_dvc.sh
```

The script will guide you through setting up one of these remote storage options: amazon S3, Google Cloud Storage, Azure Blob Storage, SSH, or local storage.

## ⚙️ Configuration

Project parameters are stored in [params.yaml](params.yaml):

- **Common parameters**: Dataset name, random seed, etc.
- **Model parameters**: Learning rates, batch sizes, etc.

To modify parameters, edit the `params.yaml` file.


## ⚗️ Experiments

To run the experiments, run the following commands:

```bash
dvc repro
```

This will run the scripts and pipelines defined in dvc.

## 📊 Results

The results of the experiments are stored in the `results/` directory.

## 📣 Acknowledgments

TODO: Acknowledgements


[python]: https://www.python.org/
[cookiecutter]: https://drivendata.github.io/cookiecutter-data-science/
[git]: https://git-scm.com/