---
name: Weather Map
slug: weather-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Weather Map, p. 439"

intent: Display meteorological data including temperature, pressure, fronts, and local weather conditions using specialized symbols and encoding techniques
direction: both

components:
  - element: base-map
    encodes: Geographic area for weather display
    required: true
  - element: temperature-bands
    encodes: Areas of equal temperature ranges using colored bands (isotherm/isopleth technique)
    required: false
  - element: pressure-isobars
    encodes: Lines connecting points of equal pressure in millibars
    required: false
  - element: front-symbols
    encodes: Weather front locations, types, and movement directions
    required: false
  - element: station-symbols
    encodes: Local weather data at specific observation points
    required: false
  - element: precipitation-indicators
    encodes: Type and amount of precipitation
    required: false

parameters:
  map_type: temperature | pressure | fronts | local-conditions | combined
  pressure_units: millibars | inches-of-mercury
  temperature_units: fahrenheit | celsius

related: []  # TBD: see also isopleth-map, flow-map

warnings:
  - "Pressure values often use abbreviated notation (e.g., 20 = 1020 mb, 996 = 999.6 mb)"
  - "Weather maps blend descriptive, statistical, and flow map techniques"

extensions:
  harris_entry: "Weather Map"
  alternate_names: ["meteorological chart", "synoptic chart"]
  typical_use: "displaying current or forecast weather conditions over a geographic region"
  map_classification: "blend of descriptive, statistical, and flow maps"
---

## Description

Weather maps are a specialized blend of descriptive, statistical, and flow map techniques used to display meteorological data. They employ a rich vocabulary of symbols and encoding methods to convey multiple types of weather information simultaneously.

Harris identifies four primary types of weather map displays:

1. **Temperature maps** - Use colored bands (isopleth/isotherm technique) to show areas of equal temperature ranges
2. **Pressure maps** - Use isolines (isobars) to connect points of equal atmospheric pressure
3. **Front maps** - Use specialized symbols to show weather front locations and movements
4. **Local weather maps** - Use station symbols to display detailed data at specific observation points

## Examples

### Temperature Display
> "Colored bands are used to indicate areas of equal temperature ranges. This usage is sometimes referred to as an isopleth (bands of equal values) map, or an isotherm (bands of equal temperature) map. The range of values that apply are generally shown in the bands. For example, a band labeled 40s means that the temperatures for the areas included in the band range from 40 degrees to 49 degrees." (p. 439)

### Pressure Display
> "When lines connect points of equal pressure, the map is sometimes called an isoline or isobar map. Values are shown on the lines and are generally stated in terms of millibars (mb), using only the last two or three digits. For example, 20 on the map equals a value of 1020 mb; 207 equals 1020.7 mb, and 996 equals 999.6 mb. The letters H and L designate the points of highest pressure in the region." (p. 439)

### Front Symbols
Harris illustrates six common front symbols (p. 439):
- Surface warm front (semicircles on one side)
- Surface cold front (triangles on one side)
- Surface stationary front (alternating semicircles and triangles on opposite sides)
- Upper warm front (open semicircles)
- Upper cold front (open triangles)
- Occluded front (alternating semicircles and triangles on same side)

> "Symbols for fronts convey information about what type of front it is, where it is located, and the directions it is moving." (p. 439)

## Usage

Weather maps are appropriate when:
- Displaying current meteorological conditions across a geographic area
- Showing weather forecasts and predictions
- Communicating complex multi-variable weather data
- Tracking weather systems and their movements

The station symbol technique allows encoding of multiple variables at a single point:
- Temperature (in degrees)
- Dew point (in degrees)
- Visibility (in miles)
- Pressure (in millibars)
- Pressure change during time period
- Wind direction and speed
- Type of weather (using standardized symbols)
- Type and amount of clouds
- Precipitation amounts

Wind speed is encoded using a flag system:
- Each pennant = 50 knots
- Each long bar (full-flag) = 10 knots
- Each short bar (half-flag) = 5 knots
- Calm = circle around station symbol with no flag

## Notes

Harris provides extensive symbol vocabularies for weather type (including drizzle, rain, snow, thunderstorm, fog, etc.), cloud types (ten standard types from altocumulus to stratus), and cloud amount (from clear sky to sky obscured). These standardized meteorological symbols form a complete visual language for weather communication.
