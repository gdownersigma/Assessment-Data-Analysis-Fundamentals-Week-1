"""Tests for the SQL challenges."""

# pylint: skip-file

from io import StringIO

import pytest
import pandas as pd


@pytest.mark.parametrize("challenge_num", range(1, 14))
def test_correct_columns_challenge_(challenge_num, run_sql_file):

    out = run_sql_file(f"./queries/challenge_{challenge_num}.sql")
    out = pd.read_csv(StringIO(out))
    expected = pd.read_csv(f"./example-results/challenge_{challenge_num}.csv")
    
    assert out.columns.to_list() == expected.columns.to_list(), "Columns not correct or in incorrect order"


@pytest.mark.parametrize("challenge_num", range(1, 14))
def test_correct_number_of_rows_challenge_(challenge_num, run_sql_file):

    out = run_sql_file(f"./queries/challenge_{challenge_num}.sql")
    out = pd.read_csv(StringIO(out))
    expected = pd.read_csv(f"./example-results/challenge_{challenge_num}.csv")
    
    assert out.shape[0] == expected.shape[0], "Incorrect number of rows"


@pytest.mark.parametrize("challenge_num", range(1, 14))
def test_correct_data_challenge_(challenge_num, run_sql_file):

    out = run_sql_file(f"./queries/challenge_{challenge_num}.sql")
    out = pd.read_csv(StringIO(out))
    expected = pd.read_csv(f"./example-results/challenge_{challenge_num}.csv")
    
    assert out.equals(expected), "Query output does not match expected result"


def test_view_exists_challenge_14(run_sql_file):

    # Create the view
    run_sql_file("./queries/challenge_14.sql")

    # Check the view is present
    out = run_sql_file("./assessment-queries/challenge_14_exists.sql")
    out = pd.read_csv(StringIO(out))
    expected = pd.read_csv(f"./example-results/challenge_14_exists.csv")

    assert out.equals(expected), "Query output does not match expected result"


def test_data_correct_challenge_14(run_sql_file):

    # Create the view
    run_sql_file("./queries/challenge_14.sql")

    # Check the view is present
    out = run_sql_file("./assessment-queries/challenge_14_data.sql")
    out = pd.read_csv(StringIO(out))
    expected = pd.read_csv(f"./example-results/challenge_14_data.csv")

    assert out.equals(expected), "Query output does not match expected result"


def test_function_exists_challenge_15(run_sql_file):

    # Create the view
    run_sql_file("./queries/challenge_15.sql")

    # Check the view is present
    out = run_sql_file("./assessment-queries/challenge_15_exists.sql")
    out = pd.read_csv(StringIO(out))
    expected = pd.read_csv(f"./example-results/challenge_15_exists.csv")

    assert out.equals(expected), "Query output does not match expected result"


def test_data_correct_challenge_15(run_sql_file):

    # Create the view
    run_sql_file("./queries/challenge_15.sql")

    # Check the view is present
    out = run_sql_file("./assessment-queries/challenge_15_data.sql")
    out = pd.read_csv(StringIO(out))
    expected = pd.read_csv(f"./example-results/challenge_15_data.csv")

    assert out.equals(expected), "Query output does not match expected result"