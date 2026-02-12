---
name: Yield Curve
slug: yield-curve
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Yield Curve, pp. 442-443"

intent: Display the relationship between interest rates on fixed-income securities and their time to maturity
direction: both

components:
  - element: horizontal-axis
    encodes: Time to maturity (typically 3 months to 30 years)
    required: true
  - element: vertical-axis
    encodes: Percent yield (linear scale)
    required: true
  - element: yield-line
    encodes: Interest rate at each maturity point
    required: true

parameters:
  curve_type: positive | negative | inverted | flat
  time_scale_style: uniform | non-uniform | labeled-maturities

related: []  # TBD: line-graph, financial-chart

warnings:
  - "Horizontal axis placement varies widely; same data can look quite different"
  - "Non-uniform time scales can distort visual interpretation"

extensions:
  harris_entry: "Yield Curve"
  alternate_names: ["term structure of interest rates"]
  typical_use: "bond market analysis, economic forecasting, interest rate comparison"
---

## Description

A yield curve displays the relationship between interest rates on fixed-income securities (e.g., bonds) and their time to maturity. Length of time to maturity is shown along the horizontal axis and percent yield along the vertical axis.

The shape of the curve conveys information about market expectations and economic conditions.

## Examples

### Scale Conventions
> "The vertical scale is always linear with units of percent. The lower and upper values are typically slightly below and above the lowest and highest values plotted, respectively. The lower and upper values on the horizontal axis are usually three months and 30 years, respectively." (p. 442)

### Horizontal Axis Variations
> "The placement of values on the horizontal axis varies widely. Sometimes they are placed uniformly, other times there is no apparent pattern. As a result, curves of the same data can look quite different." (p. 442)

Harris illustrates four different ways the same yield data might be displayed with different horizontal axis treatments:
1. Months and years with log-like spacing
2. Non-uniform time labels (3 mo, 6 mo, 1-2-3-5-7-10 years, 30 years)
3. Uniform year spacing (1, 5, 10, 20, 30 years)
4. Calendar years when bonds mature ('90, '95, '00, '05, '10, '15, '20)

### Curve Types
> "When the percent yield is higher on bonds with longer term maturities, the curve is called a positive yield curve. When the percent yield is lower on bonds with longer term maturities, the curve is referred to as a negative or inverted yield curve." (p. 443)

Harris shows:
- **Positive yield curve**: Slopes upward (long-term rates higher than short-term)
- **Negative/inverted yield curve**: Slopes downward (long-term rates lower than short-term)

## Usage

Yield curves are appropriate for:
- Comparing yields across different maturities
- Assessing market expectations for future interest rates
- Identifying normal vs. inverted yield curve conditions
- Making investment decisions based on term structure
- Economic analysis and forecasting

### Interpretation

**Positive (normal) yield curve**: Indicates expectations of stable or growing economy; investors demand higher yields for longer commitments due to uncertainty

**Negative (inverted) yield curve**: Often interpreted as predictor of economic recession; suggests investors expect lower future interest rates

**Flat yield curve**: Similar yields across maturities; suggests transition or uncertainty

### Design Considerations

The wide variation in horizontal axis treatment means that:
- Visual slope interpretation depends heavily on scale choices
- Comparison across different yield curve charts requires attention to axis conventions
- The same data can appear steep or flat depending on presentation

## Notes

The yield curve is one of the most closely watched indicators in financial markets because of its historical correlation with economic cycles. The inversion of the yield curve (short-term rates exceeding long-term rates) has preceded several recessions, making this chart type significant beyond its technical function.
