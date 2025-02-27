# Cookiecutter ML-DVC

A comprehensive cookiecutter template for machine learning projects with DVC (Data Version Control) integration.

## Overview
This template provides a structured foundation for machine learning projects with integrated data version control, reproducible pipelines, and development best practices. It's designed to help you start new ML projects quickly with all the necessary tooling in place.

## Features
- **Organized project structure** following ML best practices
- **DVC integration** for data version control and pipeline orchestration
- **Reproducible workflows** with parameterized ML pipelines
- **Development tools** including:
  - Pre-commit hooks (Black, isort, flake8)
  - Testing framework
  - GitHub Actions workflow for ML reports
- **Customizable** to suit your specific needs

## Requirements
- [Python][python]. For setting up the environment and Python dependencies (version 3.10 or higher).
- [Cookiecutter][cookiecutter]. For setting up the project structure.
- [Git][git]. For versioning your code.

## Usage

### Creating a New Project

To create a new project, run the following commands:

```bash
# install pipx for running cookiecutter
pip install pipx

# create a new project using the template
pipx run cookiecutter gh:eriknovak/cookiecutter-ml-dvc
```

You'll be prompted for inputs to customize your project:

- `project_name`: Name of your project
- `project_description`: Brief description of your project
- `version`: Initial version (default: 0.1.0)
- `python_version`: Python version (default: 3.10)
- `author_name`: Your name
- `author_email`: Your email
- ... and more configurable options

Afterwards, follow the README within the created project for further instructions.

### Git Init

After creating the project, initialize a new Git repository and commit the initial project structure:

```bash
cd <project_name>
git init
git add .
git commit -m "Initial commit"
```

You can then push the repository to your remote Git server. After that,
you can start developing your project.


# Acknowledgments

Inspired by the [cookiecutter][cookiecutter] project structure.

[cookiecutter]: https://github.com/cookiecutter/cookiecutter
[python]: https://www.python.org/
[git]: https://git-scm.com/