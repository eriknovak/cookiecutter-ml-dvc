# {{ cookiecutter.project_name }}

<a target="_blank" href="https://github.com/eriknovak/cookiecutter-ml-dvc/">
    <img src="https://img.shields.io/badge/CCDS-Project%20template-328F97?logo=cookiecutter" />
</a>

{{ cookiecutter.project_description }}

Inspired by the [cookiecutter] folder structure. Supports DVC for ML pipeline orchestration.

## 📁 Project structure

The project is structured as follows:

```plaintext
.
├── data/                    # Data used in the experiments
├── dvc/                     # DVC cache and metafiles
├── models/                  # Model artifacts
├── notebooks/               # Jupyter notebooks
├── results/                 # Experiment results
├── scripts/                 # Helper scripts
├── src/                     # Source code
├── tests/                   # Tests
├── .dvcignore               # DVC ignore config
├── .gitignore               # Git ignore config
├── .pre-commit-config.yaml  # Pre-commit config
├── Makefile                 # Makefile with project commands
├── dvc.yaml                 # DVC pipeline config
├── params.yaml              # DVC pipeline params
├── LICENSE                  # License
├── README.md                # Project readme
├── pyproject.toml           # The project config
└── requirements.txt         # Project dependencies
```

## ☑️ Requirements

Before starting the project make sure these requirements are available:

- [python]. For setting up the environment and Python dependencies (version 3.10 or higher).
- [git]. For versioning your code.

## 🛠️ Setup

To setup the project, run the following commands:

```bash
bash scripts/setup_env.sh
```

This script will setup the environment and install the required dependencies. If you want to do it manually, follow the steps below.

### Create a python environment

First, create a virtual environment where all the modules will be stored.

#### Using venv

Using the `venv` command, run the following commands:

```bash
# create a new virtual environment
python -m venv venv

# activate the environment (UNIX)
source ./venv/bin/activate

# activate the environment (WINDOWS)
./venv/Scripts/activate

# deactivate the environment (UNIX & WINDOWS)
deactivate
```

### Install

Check the `requirements.txt` file. If you have any additional requirements, add them here.

#### Using pip
To install the requirements run:

```bash
# install the dependencies
pip install -e .[dev]
```

### Add a git filter

To avoid commiting outputs in notebooks that should not be commited, run the following command:

```bash
git config filter.strip-notebook-output.clean 'jupyter nbconvert --ClearOutputPreprocessor.enabled=True --to=notebook --stdin --stdout --log-level=ERROR'
```

## 🗃️ Data

Run the following command to create the data directory structure:

```bash
mkdir -p data/raw data/processed data/final data/external
```

### Setting up DVC Remote Storage

This project uses DVC for data versioning and storage. You can configure remote storage in several ways:

```bash
# Run the automated setup script
bash scripts/setup_dvc.sh
```

The script will guide you through setting up one of these remote storage options: amazon S3, Google Cloud Storage, Azure Blob Storage, SSH, or local storage.

### Data Structure

The data is stored in the `data/` directory. The structure is as follows:

- Raw data goes in `data/raw/`
- Processed data will be stored in `data/processed/`
- Final data will be stored in `data/final/`
- External data will be stored in `data/external/`
- All data files are tracked by DVC (not Git)

## ⚗️ Experiments

To run the experiments, run the following commands:

```bash
TODO: Provide scripts for the experiments
```

### Results

The results of the experiments are stored in the `results/` directory.


## 📣 Acknowledgments

TODO: Acknowledgements


[cookiecutter]: https://drivendata.github.io/cookiecutter-data-science/
[python]: https://www.python.org/
[git]: https://git-scm.com/