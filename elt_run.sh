#!/bin/bash

echo "========== Start Orcestration Process =========="

# Virtual Environment Path
VENV_PATH="C:\Users\LENOVO THINKPAD\Documents\Github\Pacmann---Data-Storage_-Warehouse--Mart---Lake\mentoring 3\pactravel-dataset-main\pipeline\src_query\dbt_env\bin\activate"

# Activate Virtual Environment
source "$VENV_PATH"

# Set Python script
PYTHON_SCRIPT="C:\Users\LENOVO THINKPAD\Documents\Github\Pacmann---Data-Storage_-Warehouse--Mart---Lake\mentoring 3\pactravel-dataset-main\elt_pipeline.py"

# Run Python Script 
python3 "$PYTHON_SCRIPT"


echo "========== End of Orcestration Process =========="