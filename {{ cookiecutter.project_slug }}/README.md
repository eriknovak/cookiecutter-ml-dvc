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
├── data/               # Data used in the experiments
├── experiments/        # Experiment definition
├── models/             # Model artifacts
├── notebooks/          # Jupyter notebooks
├── results/            # Experiment results
├── scripts/            # Helper scripts
├── src/                # Source code
├── tests/              # Tests
├── .dvcignore          # DVC ignore config
├── .gitignore          # Git ignore config
├── LICENSE             # License
├── Makefile            # Makefile with project commands
├── README.md           # Project readme
├── requirements.txt    # Project dependencies
└── pyproject.toml      # The project config
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
3. Create necessary data directories

### Manual setup

If you prefer to set up the project manually, follow the instructions below.

#### Create a python environment

First, create a virtual environment where all the modules will be stored.
Using the `venv` command, run the following commands:

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
mkdir -p data/raw data/processed data/final
```

## 🗃️ Data

### Data structure

The data is stored in the `data/` directory. The structure is as follows:

- Raw data goes in `data/raw/`
- Processed data will be stored in `data/processed/`
- Final data will be stored in `data/final/`
- All data files are tracked by DVC (not Git)

### Setting up DVC remote storage

This project uses DVC for data versioning and storage.
You can configure remote storage in several ways:

```bash
# Run the automated setup script
bash scripts/setup_dvc.sh
```

The script will guide you through setting up one of these remote storage options:
amazon S3, Google Cloud Storage, Azure Blob Storage, SSH, or local storage.

## ⚗️ Experiments

All experiments are defined in the `experiments/` folder using DVC.
Each experiment is organized in its own subdirectory (e.g., `experiments/exp-1/`) containing
the `dvc.yaml` file which defines the experiment pipeline stages. The parameters
are found in the `params.yaml` file in the root of the project.

### Running Experiments

To run an experiment, use one of the following commands:

1. From the project root using the full path:
```bash
# Run a specific experiment
dvc exp run experiments/exp-1/dvc.yaml

# Run with modified parameters
dvc exp run experiments/exp-1/dvc.yaml --set-param models.model1.learning_rate=0.01
```

2. From the experiment directory (requires proper wdir configuration in dvc.yaml):
```bash
# Navigate to the experiment directory
cd experiments/exp-1

# Run the experiment
dvc exp run --set-param models.model1.learning_rate=0.01

# Or to simply reproduce the experiments
dvc repro
```

### Experiment Parameters

The `dvc exp run` command supports various parameters:

| Parameter | Description |
|-----------|-------------|
| `--set-param`  | Set a parameter value (e.g., `--set-param models.model1.learning_rate=0.01`) |
| `--queue`      | Place this experiment at the end of a line for future execution, but don't run it yet. Use `dvc queue start` to process the queue. |
| `--run-all`    | Run all queued experiments (see `--queue`) and outside your workspace (in `.dvc/tmp/exp`). Use `-j` to execute them in parallel. |
| `--temp`       | Run the experiment outside your workspace (in `.dvc/tmp/exps`). Useful to continue working (e.g. in another terminal) while a long experiment runs. |
| `--message`    | Custom message to use when saving the experiment. |
| `--name`       | Name the experiment. |

### Managing Experiments

```bash
# List all experiments
dvc exp list

# Show experiment details
dvc exp show

# Compare experiments
dvc exp diff

# Apply experiment changes to workspace
dvc exp apply <experiment_name>

# Remove an experiment
dvc exp remove <experiment_name>
```

### Experiment Metrics

Experiments automatically track metrics defined in the `dvc.yaml` file.
These metrics are logged and can be compared across experiments:

```bash
# Show metrics for all experiments
dvc metrics show

# Show metrics for a specific experiment
dvc metrics show --rev <experiment_name>
```

## 📊 Results

The results of the experiments are stored in the `results/` directory.

## 📣 Acknowledgments

TODO: Acknowledgements


[python]: https://www.python.org/
[cookiecutter]: https://drivendata.github.io/cookiecutter-data-science/
[git]: https://git-scm.com/