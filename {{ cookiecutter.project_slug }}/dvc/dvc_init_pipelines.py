#!/usr/bin/env python
# init_pipelines.py - Generate pipeline files from templates

import os
import shutil
from pathlib import Path


def setup_pipelines():
    """Set up DVC pipeline files from templates."""
    template_dir = Path("dvc/templates")

    # Process each template file
    for template_file in template_dir.glob("*.template"):
        output_file = Path(template_file.stem)  # Remove .template extension

        if not output_file.exists():
            print(f"Creating {output_file} from template...")
            shutil.copy(template_file, output_file)


if __name__ == "__main__":
    setup_pipelines()
