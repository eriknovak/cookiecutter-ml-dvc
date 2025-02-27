# Makefile for ML-DVC project

.PHONY: setup clean lint test run-dvc dvc-init dvc-repro dvc-push dvc-pull dvc-metrics help

# Default target
.DEFAULT_GOAL := help

# Help command
help:
	@echo "Available commands:"
	@echo "  setup         : Set up the development environment"
	@echo "  clean         : Clean up generated files and caches"
	@echo "  lint          : Run linters (black, isort, flake8)"
	@echo "  test          : Run tests"
	@echo "  dvc-init      : Initialize DVC and set up remotes"
	@echo "  dvc-repro     : Reproduce DVC pipelines"
	@echo "  dvc-push      : Push DVC tracked files to remote"
	@echo "  dvc-pull      : Pull DVC tracked files from remote"
	@echo "  dvc-metrics   : Show DVC metrics"
	@echo "  help          : Show this help message"

# Environment setup
setup:
	@echo "Setting up the development environment..."
	bash scripts/setup_env.sh

# Clean up
clean:
	@echo "Cleaning up..."
	rm -rf __pycache__ .pytest_cache .coverage
	rm -rf .ruff_cache
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

# Linting
lint:
	@echo "Running linters..."
	black src tests
	isort src tests
	flake8 src tests

# Testing
test:
	@echo "Running tests..."
	pytest tests/

# DVC commands
dvc-init:
	@echo "Setting up DVC..."
	bash scripts/setup_dvc.sh

dvc-repro:
	@echo "Reproducing DVC pipelines..."
	dvc repro

dvc-push:
	@echo "Pushing data to DVC remote..."
	dvc push

dvc-pull:
	@echo "Pulling data from DVC remote..."
	dvc pull

dvc-metrics:
	@echo "Showing DVC metrics..."
	dvc metrics show
	dvc plots show