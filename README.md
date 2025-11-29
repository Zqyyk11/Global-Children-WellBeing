# Interactive World Map Visualization

An interactive D3.js world map visualization that displays country data when you click on countries.

## Features

- **Interactive World Map**: Click on any country to view its data
- **Data Integration**: Automatically loads data from `WHR23_Data_Figure_2.1.csv`
- **Hover Effects**: Countries highlight when you hover over them
- **Smart Country Matching**: Handles variations in country names between the map and CSV data

## How to Use

1. **Open the visualization**: Simply open `index.html` in a web browser
   - You can double-click the file, or
   - Use a local web server (recommended for loading CSV files):
     ```bash
     # Using Python 3
     python -m http.server 8000
     
     # Then open: http://localhost:8000
     ```

2. **Interact with the map**:
   - **Hover** over countries to see their names
   - **Click** on any country to view its data in the info panel below
   - The selected country will be highlighted in blue

3. **View country data**: When you click a country, the info panel will display:
   - Ladder score
   - GDP per capita
   - Social support
   - Healthy life expectancy
   - And other metrics from your CSV file

## Files

- `index.html` - Main visualization file (includes all HTML, CSS, and JavaScript)
- `WHR23_Data_Figure_2.1.csv` - World Happiness Report data
- `README.md` - This file

## Technical Details

- **D3.js v7**: For data visualization and map rendering
- **TopoJSON**: For efficient map data storage
- **Mercator Projection**: Standard world map projection
- **Responsive Design**: Works on different screen sizes

## Customization

You can customize the visualization by:

1. **Changing colors**: Edit the CSS in the `<style>` section
2. **Modifying data display**: Update the `displayCountryData()` function
3. **Adding more data sources**: Extend the `loadCountryData()` function
4. **Adjusting map projection**: Change the `projection` settings

## Notes

- The map data is loaded from a CDN (requires internet connection)
- Some country names may not match exactly between the map and CSV - the code includes smart matching to handle common variations
- If a country doesn't have data, a message will be displayed

