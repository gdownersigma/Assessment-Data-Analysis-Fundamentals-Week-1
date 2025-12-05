from subprocess import run, CalledProcessError

import os

import pytest


@pytest.fixture()
def run_sql_file():
    """Runs an SQL file through the terminal, returning the results as csv-formatted string."""

    def func(filename: str) -> str:

        try:
            env = os.environ.copy()
            env["PGPASSWORD"] = "postgres"
            cmd = f"psql -h localhost northwind --csv -f {filename}"
            result = run(cmd.split(), capture_output=True, check=True, env=env)

            if result.returncode == 0:
                return result.stdout.decode("UTF-8").strip()
        except CalledProcessError:
            raise Exception(f"psql command '{cmd}' could not run successfully")

    return func


@pytest.fixture(autouse=True)
def reset_database(run_sql_file):
    """Resets the database before each query."""

    try:
        env = os.environ.copy()
        env["PGPASSWORD"] = "postgres"
        cmd = "psql -h localhost postgres -f ./northwind.sql"
        result = run(cmd.split(), capture_output=True, check=True, env=env)
    except CalledProcessError:
        raise Exception(f"Unable to set up database for testing.")
