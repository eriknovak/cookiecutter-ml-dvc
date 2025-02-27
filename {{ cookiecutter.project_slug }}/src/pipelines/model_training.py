import yaml
import argparse


def main(args):
    # Load parameters
    with open("params.yaml", "r") as f:
        params = yaml.safe_load(f)

    # Get common parameters
    common_params = params["common"]

    # Get model-specific parameters
    if args.model not in params["models"]:
        raise ValueError(f"Model {args.model} not found in params.yaml")

    model_params = params["models"][args.model]

    # Merge parameters for convenience
    all_params = {**common_params, **model_params, "model_name": args.model}

    print(f"Training {args.model} with parameters: {all_params}")

    # Your model training code here...


if __name__ == "__main__":
    # Parse command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--model", type=str, required=True, help="Model architecture to use"
    )
    args = parser.parse_args()
    main(args)
