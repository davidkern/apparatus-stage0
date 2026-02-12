---
name: Specialized Multivariate Symbol
slug: specialized-multivariate-symbol
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Symbol, Unique symbols for encoding multiple variables, p. 385"

intent: Encode three or more variables into a single symbol using standardized conventions for specific domains
direction: both

components:
  - element: base-location
    encodes: Position on map or graph where data was collected
    required: true
  - element: primary-encoding
    encodes: Main variable (e.g., wind direction via angle)
    required: true
  - element: secondary-encoding
    encodes: Second variable (e.g., wind speed via barbs)
    required: true
  - element: tertiary-encoding
    encodes: Third variable (e.g., cloud cover via fill)
    required: true
  - element: additional-encodings
    encodes: Further variables as needed by domain
    required: false

parameters:
  domain: meteorological | financial | custom
  variable_count: 3 | 4 | 5+

related: []  # TBD: see icon-comparison-display

warnings:
  - "Requires viewer familiarity with the specific symbol convention"
  - "Domain-specific symbols may not transfer well to general audiences"

extensions:
  harris_entry: "Symbol"
  examples: ["wind speed and direction symbol", "stock price symbol"]
---

## Description

Most symbols encode only one or two pieces of information. However, some specialized but widely used symbols have been developed that routinely encode three or more bits of data. These symbols have become conventions within their specific domains (meteorology, finance, etc.) and enable dense information display.

Harris presents two prominent examples: the meteorological wind symbol and the stock price symbol.

## Examples

**Wind speed and direction symbol** (p. 385):

This symbol is used on meteorological maps to encode multiple bits of information about weather conditions:

> "- The angle of the flag indicates the direction of the wind.
> - The location of circle designates the point on the map at which the data was collected.
> - The number of pennants and bars indicates the speed of the wind.
> - The percent of the circle that is black indicates how cloudy it is."

The illustration shows the symbol used on a map, with multiple stations displaying wind conditions simultaneously.

**Stock price symbol** (p. 385):

This symbol is used on stock price charts to record various combinations of stock prices for given periods of time:

> "- The highest price for which the stock sold (high) [top of vertical line]
> - The price of the first sale of the period (open) [left tick mark]
> - The midpoint, average, or weighted average price [optional middle indicator]
> - The price of the last sale of the period (close) [right tick mark]
> - The lowest price for which the stock sold (low) [bottom of vertical line]"

The example shows this symbol used on a graph with time on the horizontal axis and stock price on the vertical axis, displaying multiple periods of trading data.

## Usage

**When specialized symbols are appropriate:**
- Domain has established conventions that audience understands
- Need to display multiple related variables at many locations
- Space constraints require dense encoding
- Data collection follows standardized protocols

**Design principles from these examples:**
- Use position (angle, location) for continuous variables
- Use discrete marks (barbs, ticks) for categorical or stepped values
- Use fill proportion for percentage or ratio data
- Maintain consistent orientation conventions

**Audience considerations:**
- Meteorologists instantly read wind symbols; general audiences require training
- Financial analysts understand candlestick/bar conventions; novices need explanation
- Include legend or explanation for non-expert audiences

## Notes

These specialized symbols represent mature solutions to recurring visualization challenges in their domains. They demonstrate how conventions can enable extremely efficient communication once adopted, encoding 4-5 variables in a compact form that trained viewers can decode instantly.

The stock price symbol has evolved into several variants (OHLC bars, candlesticks, etc.) that all derive from this basic multi-variable encoding approach. The meteorological wind symbol remains largely standardized internationally due to the global nature of weather reporting.

Harris also references icons as symbols that can encode 10-20 variables (see Icon Comparison Display), representing an even more extreme form of multivariate encoding.
