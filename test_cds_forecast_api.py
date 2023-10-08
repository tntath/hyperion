# import cdsapi
# import netCDF4 as nc

# c = cdsapi.Client()

# c.retrieve(
#     "cams-europe-air-quality-forecasts",
#     {
#         "model": "euradim",
#         "date": "2023-10-07/2023-10-07",
#         "format": "netcdf",
#         "variable": [
#             "nitrogen_dioxide",
#             "particulate_matter_10um",
#             "particulate_matter_2.5um",
#             "residential_elementary_carbon",
#             "total_elementary_carbon",
#         ],
#         "level": "0",
#         "type": "forecast",
#         "time": "00:00",
#         "leadtime_hour": [
#             "0",
#             "4",
#             "8",
#         ],
#         "area": [
#             40.66,
#             22.89,
#             40.6,
#             23,
#         ],
#     },
#     "download.nc",
# )

# fn = "download.nc"
# ds = nc.Dataset(fn)

# print(ds.variables.keys())

import cdsapi
import requests
import xarray as xr
import io
from datetime import datetime

# Initialize the CDS API client
c = cdsapi.Client()
# Request data and get the download URL without downloading the file
now = datetime.now()
# Extract the hour
current_hour = now.hour
current_date = now.date()
formatted_date = current_date.strftime("%Y-%m-%d")

# Request data and get the download URL without downloading the file
data_request = c.retrieve(
    "cams-europe-air-quality-forecasts",
    {
        "model": "ensemble",
        "date": formatted_date + "/" + formatted_date,
        "format": "netcdf",
        "variable": [
            "nitrogen_dioxide",
            "particulate_matter_10um",
            "particulate_matter_2.5um",
            "residential_elementary_carbon",
            "total_elementary_carbon",
        ],
        "level": "0",
        "type": "forecast",
        "time": "00:00",
        "leadtime_hour": [
            str(current_hour),
        ],
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
