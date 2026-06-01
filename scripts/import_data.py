import pandas as pd
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv
from pathlib import Path

load_dotenv()
SERVER = os.environ.get("DB_SERVER")
DATABASE = os.environ.get("DB_NAME")
DRIVER = os.environ.get("DB_DRIVER")
PATH_STRING = os.environ.get("FILE_PATH")

DATA_FOLDER = Path(PATH_STRING) / "data"

connection_string = f"mssql+pyodbc://@{SERVER}/{DATABASE}?driver={DRIVER}&trusted_connection=yes"

engine = create_engine(connection_string)

files_to_import = {
    'customers': 'olist_customers_dataset.csv',
    'geolocation': 'olist_geolocation_dataset.csv',
    'order_items': 'olist_order_items_dataset.csv',
    'order_payments': 'olist_order_payments_dataset.csv',
    'order_reviews': 'olist_order_reviews_dataset.csv',
    'orders': 'olist_orders_dataset.csv',
    'products': 'olist_products_dataset.csv',
    'sellers': 'olist_sellers_dataset.csv',
}

for table, csv_file in files_to_import.items():
    csv_path = DATA_FOLDER / csv_file
    df = pd.read_csv(csv_path)
    df.to_sql(table, con=engine, if_exists='replace', index=False, chunksize=1000)

print("Datasets have succesffully imported into SQL Server.")
    