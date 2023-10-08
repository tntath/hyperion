import pandas as pd
import xarray as xr


# Open the netCDF file
dataset = xr.open_dataset("download.nc")

# Convert the Dataset into a DataFrame
df = dataset.to_dataframe()

# Print the data
print(df.head())
print(df.describe())
