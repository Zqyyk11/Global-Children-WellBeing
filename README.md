# Interactive World Map Visualization

An interactive D3.js world map visualization that displays country data when you click on countries.

## Features

- **Interactive World Map**: Click on any country to view its data
- **Data Integration**: Automatically loads data from `WHR23_Data_Figure_2.1.csv`
- **Hover Effects**: Countries highlight when you hover over them
- **Smart Country Matching**: Handles variations in country names between the map and CSV data

## Files

- `index.html` - Main visualization file (includes all HTML, CSS, and JavaScript)
- `WHR23_Data_Figure_2.1.csv` - World Happiness Report data
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
