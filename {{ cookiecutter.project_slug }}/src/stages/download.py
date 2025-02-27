#!/usr/bin/env python3
"""
Download stage script for data processing pipeline.
This script handles downloading data from a source file to a specified output location.
"""

import argparse
import logging
from pathlib import Path

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def parse_args():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(description='Download data from source to destination')
    parser.add_argument(
        '--input-file',
        type=str,
        required=True,
        help='Path to the input file containing source data'
    )
    parser.add_argument(
        '--output-dir',
        type=str,
        required=True,
        help='Directory where the output file will be saved'
    )
    parser.add_argument(
        '--output-file',
        type=str,
        required=True,
        help='Name of the output file'
    )
    return parser.parse_args()

def main(input_file: str, output_dir: str, output_file: str) -> None:
    """
    Download data from input file to output location.

    Args:
        input_file (str): Path to the input file
        output_dir (str): Directory where the output file will be saved
        output_file (str): Name of the output file
    """
    try:
        # Convert paths to Path objects
        input_path = Path(input_file)
        output_dir_path = Path(output_dir)
        output_path = output_dir_path / output_file

        # Create output directory if it doesn't exist
        output_dir_path.mkdir(parents=True, exist_ok=True)

        # TODO: Implement your download logic here
        logger.info(f"Downloading data from {input_path} to {output_path}")

        # Example placeholder for download logic
        # with input_path.open('r') as f_in:
        #     with output_path.open('w') as f_out:
        #         f_out.write(f_in.read())

        logger.info("Download completed successfully")

    except Exception as e:
        logger.error(f"Error during download: {str(e)}")
        raise

if __name__ == "__main__":
    args = parse_args()

    logger.info("Starting download process")
    main(args.input_file, args.output_dir, args.output_file)
    logger.info("Download process completed")
