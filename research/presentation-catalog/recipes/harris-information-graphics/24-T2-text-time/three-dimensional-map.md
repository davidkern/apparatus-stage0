---
name: Three-Dimensional Map
slug: three-dimensional-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Three-Dimensional Map, pp. 407-408"

intent: Display geographic or spatial data with elevation or quantitative values using a third vertical axis to show terrain features or statistical distributions across areas
direction: both

components:
  - element: geographic-base
    encodes: X-Y coordinates representing location (latitude/longitude or map coordinates)
    required: true
  - element: vertical-axis
    encodes: Elevation or quantitative variable (Z-axis)
    required: true
  - element: surface-representation
    encodes: Visual method for showing height variations (contours, stepped areas, smooth surface)
    required: true

parameters:
  map_type: "cosmetic-depth | shaded-relief | three-axis-statistical | three-axis-topographic"
  surface_style: "stepped | smooth-isolines | contour | block | profile"
  rotation_degrees: "0-360"
  tilt_degrees: "0-90"

related: []

warnings:
  - "In most cases it is difficult to accurately determine actual values from three-axis maps"
  - "Three-axis maps are generally used to indicate general nature of data rather than supplying detailed information"
  - "Extreme degrees of tilt or rotation introduce large amounts of distortion that can mislead the viewer"
  - "Orientations close to multiples of 90 degrees can be problematic"

extensions:
  harris_entry: "Three-Dimensional Map"
  alternate_names:
    - "perspective map"
    - "block diagram map"
  map_categories:
    - "cosmetic 3D (tilted 2D map)"
    - "shaded relief map"
    - "three-axis statistical map"
    - "three-axis topographic map"
---

## Description

Three-dimensional maps encompass several distinct types, from purely cosmetic tilted views to true three-axis displays of elevation or statistical data. While they effectively show overall patterns and distributions, they generally sacrifice precision in value determination for visual impact and pattern recognition.

## Examples

### Three Major Types of Three-Dimensional Maps (p. 407)

**Type 1: Cosmetic Depth (Two-Axis)**
> "One type of map that is sometimes referred to as three-dimensional is a two-axis map that has been tilted and rotated with depth added for cosmetic purposes. This type of map yields the same information as a conventional two-dimensional map."

**Type 2: Shaded Relief Map**
> "A second type of three-dimensional map is often called a shaded relief map. These are two-dimensional maps; however, they have have a third variable, elevation, encoded by means of contour lines. Shading is used to simulate shadows which gives the maps the appearance of being three-dimensional."

The primary function of shading is to make the map easier to interpret. Shaded relief maps are a variation of topographic maps.

**Type 3: Three-Axis Map**
> "This variation has a third axis along which elevations or quantitative Z-axis values are plotted. They are sometimes referred to as three-axis, three-dimensional maps. When statistical information is plotted on a three-axis map, it frequently resembles and functions like a three-dimensional graph."

### Variations of Three-Axis Maps (p. 407)

Harris shows five types:

1. **Stepped statistical map**: Discrete data where height of each area is proportional to the value it represents

2. **Smooth statistical map**: Continuous data plotted using isolines

3. **Contour topographic map**: Lines connecting points of equal elevation

4. **Block topographic map**: Showing general terrain features

5. **Profile map**: Displaying cross-sections at selected intervals

### Typical Uses

> "For example, they might be used for such things as displaying population figures to see where major markets are located, plotting pollution levels to see where major efforts should be concentrated, or showing the strength of a magnetic field around an electrical device to see where shielding should be provided." (p. 407)

### Direction of Rotation (p. 408)

> "With three-axis maps the direction of rotation can have significance if, for example, the higher elevations are concentrated on one side or if it is important for the viewer to see a particular side."

Harris shows the same data rotated clockwise vs. counterclockwise, demonstrating that more detail is visible regarding certain peaks depending on orientation.

### Amount of Tilt and Rotation (p. 408)

Harris shows five examples with varying tilt and rotation:
- Rotated 70 degrees, Tilted 10 degrees
- Rotated 10 degrees, Tilted 10 degrees  
- Rotated 45 degrees, Tilted 25 degrees
- Rotated 70 degrees, Tilted 60 degrees
- Rotated 10 degrees, Tilted 10 degrees

> "Values close to those of the example in the middle are frequently used when there are no special requirements that suggest some other combination. When the degree of rotation and/or tilt is close to zero or a multiple of 90 degrees, some of the advantages of a three-dimensional map are lost since it begins resembling a two-dimensional map."

### Two-Axis Map Tilt and Rotation (p. 408)

> "With two-axis maps the amount of rotation and tilt are less critical; however, orientations close to multiples of 90 degrees can be a problem... The concern with extreme degrees of either tilt or rotation is that the large amounts of distortion it introduces can mislead the viewer."

### Box Diagram Maps (p. 408)

> "When three-dimensional maps represent portions of a larger entity, they are sometimes referred to as block diagram maps."

Originally created with hachures and outlines, today most are fishnet or shaded relief type. When used as topographic maps, the sides of the block sometimes display geological information (soil layers, rock layers) or man-made structures (tunnels, sewers).

## Usage

### Selecting map type
- **Cosmetic depth**: When 2D information is sufficient but visual appeal matters
- **Shaded relief**: For topographic data where shadow simulation aids interpretation
- **Stepped statistical**: For discrete area-based data (population by region, sales by territory)
- **Smooth statistical**: For continuous phenomena (temperature, pollution levels)
- **Profile**: When cross-sectional views at specific locations are important

### Handling value precision limitations

> "Since it is so difficult to determine exact values from three-dimensional maps, the values are sometimes noted on the map, provided by means of a reference table or document, or in the case of some computer programs, the data are displayed on the screen by pointing at a specific point with the cursor." (p. 407)

### Optimizing tilt and rotation
- Avoid angles near 0 or 90 degrees
- Middle ranges (25-45 degree tilt) often work well
- Rotate to expose the most important features
- Consider what peaks or valleys need to be visible
- Greater tilt when many high peaks are close together (prevents front peaks from obscuring back ones)

### When to use block diagram maps
- Representing a portion of a larger geographic area
- Displaying geological cross-section information on sides
- Showing subsurface features (tunnels, sewers, geological layers)

## Notes

Harris emphasizes that three-dimensional maps trade precision for pattern recognition. They excel at showing "where" things are concentrated or how values vary across space, but they are poor choices when viewers need to extract specific values. The recommendation to provide reference tables or interactive value display acknowledges this fundamental limitation.

The distinction between cosmetic 3D (tilted 2D maps) and true three-axis maps is important: the former adds visual appeal without new information, while the latter encodes an additional variable.
