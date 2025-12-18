# Interactive World Map Visualization

An interactive D3.js world map visualization that displays country data when you click on countries.

## Features

- **Interactive World Map**: Click on any country to view its data
- **Data Integration**: Automatically loads data after creation of dataset in RCleaningAndMerging from various CSV files
- **Hover Effects**: Countries highlight when you hover over them
- **Smart Country Matching**: Handles variations in country names between the map and CSV data

## Files

- `index.html` - Main visualization file (includes all HTML, CSS, and JavaScript)
- `RCleaningAndMerging` - Folder including all raw CSV files used, and R script used for cleaning and merging 
- `worldchildwellbeing3 (1)csv` - Final merged dataset after R cleaning and merging script to include all data needed for visualization
- `annotated-mock-design-1.pdf` - Initial rough draft and explanation of planned visualization
- `README.md` - This file

## Technical Details

- **D3.js v7**: For data visualization and map rendering
- **TopoJSON**: For efficient map data storage
- **Mercator Projection**: Standard world map projection
- **Responsive Design**: Works on different screen sizes

## Notes

- The map data is loaded from a CDN (requires internet connection)
- Some country names may not match exactly between the map and CSV - the code includes smart matching to handle common variations
- If a country doesn't have data, a message will be displayed
