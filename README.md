# stripe-to-postgres

## Getting Started

To run the pipelines using a virtual environment:

1. Configure the environment variables by copying `.env.example` to `.env` and filling the values.
2. Install the dependencies in a virtual environment using `make setup`
3. Run the pipelines using `make run`

If you want to use Docker instead follow step 1 and run the following command:
1. Build the image using `make build`
2. Run the image using `make docker-run`

```
make build
make docker-run
```

## CLI Usage

```
python stripe_analytics_pipeline.py --help                                                
usage: stripe_analytics_pipeline.py [-h] [--dataset-name DATASET_NAME] {full_load,incremental_load} ...

CLI for loading data from Stripe to PostgreSQL.

positional arguments:
  {full_load,incremental_load}
    full_load           Reloads the data from all the endpoints using their primary key. If start and end date are passed, it load only data that was created during the specified period
    incremental_load    Load data incrementally using non-editable endpoints: Event, Invoice, BalanceTransaction

options:
  -h, --help            show this help message and exit
  --dataset-name DATASET_NAME
                        Name of the schema where the data will be stored. Default: dlt_stripe

```

