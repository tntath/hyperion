import cdsapi
import requests
import xarray as xr
import io
from datetime import datetime, timedelta

# Initialize the CDS API client
c = cdsapi.Client()
# Request data and get the download URL without downloading the file
now = datetime.now()
# Extract the hour
current_date = now.date()
start_date = current_date - timedelta(days=30)
formated_start_date = start_date.strftime("%Y-%m-%d")
formatted_date = current_date.strftime("%Y-%m-%d")
formatted_hour = now.strftime("%H:00")

data_request = c.retrieve(
    "cams-europe-air-quality-forecasts",
    {
        "model": "ensemble",
        "date": formated_start_date + "/" + formatted_date,
        "format": "netcdf",
        "variable": [
            "particulate_matter_10um",
            "particulate_matter_2.5um",
            "residential_elementary_carbon",
            "total_elementary_carbon",
        ],
        "level": "0",
        "type": "analysis",
        "time": formatted_hour,
        "leadtime_hour": "0",
        "area": [
            40.66,
            22.89,
            40.6,
            23,
        ],
    },
)
download_url = data_request.location

# Use requests to get the data from the download URL
response = requests.get(download_url)

# Check if the request was successful
if response.status_code == 200:
    # Read data into an xarray Dataset
    with xr.open_dataset(io.BytesIO(response.content)) as ds:
        # Convert to pandas DataFrame if needed
        df = ds.to_dataframe()

        # Print DataFrame
        print(df.head())
else:
    print(f"Failed to retrieve data: {response.status_code}")
