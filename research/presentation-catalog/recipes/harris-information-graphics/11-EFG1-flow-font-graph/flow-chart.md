---
name: Flow Chart
slug: flow-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Flow Chart, pp. 155-156"

intent: Diagram sequential steps, decisions, and processes using standardized symbols connected by flow lines
direction: both

components:
  - element: process-symbol
    encodes: Specific step, activity, or procedure (rectangle)
    required: true
  - element: decision-symbol
    encodes: Point where selection between alternatives occurs (diamond)
    required: false
  - element: terminator-symbol
    encodes: Beginning or end of process (rounded rectangle/oval)
    required: true
  - element: flow-lines
    encodes: Direction and sequence of steps (arrows)
    required: true
  - element: document-symbol
    encodes: Document input or output (wavy-bottom rectangle)
    required: false
  - element: manual-input-symbol
    encodes: Data entry via keyboard (parallelogram with slanted top)
    required: false
  - element: storage-symbol
    encodes: Filing or storage of information (triangle or cylinder)
    required: false
  - element: delay-symbol
    encodes: Idle or waiting period (D-shape)
    required: false
  - element: connector-symbol
    encodes: Link between parts of diagram (circle)
    required: false

parameters:
  symbol_standard: "ISO | ANSI | custom"
  orientation: "horizontal | vertical"
  time_base: "included | excluded"
  detail_level: "high-level | detailed | pictorial"

related: []

warnings:
  - "The same symbol sometimes means different things in different contexts (process flow, computer program, machine operation)"
  - "Legends help minimize misunderstandings due to multiple symbol standards"
  - "No universally accepted standards exist; appearance varies significantly"

extensions:
  harris_entry: "Flow Chart"
  alternate_names: ["Flow Diagram (type 1)", "Process Flow Chart"]
  typical_use: "documenting processes, procedures, decision logic, and workflows"
  standards_bodies: ["ISO", "ANSI"]
---

## Description

A flow chart is a graphic representation of a sequence of operations, movements, and decisions, including their interrelationships. Flow charts display information proceeding in a sequential, step-by-step fashion. They may consist of words, symbols, or a combination of both. Flow charts are versatile tools used across many fields including business processes, computer programming, manufacturing, and decision documentation.

Symbol standards have been established by professional organizations such as the International Organization for Standardization (ISO) and the American National Standards Institute (ANSI). However, because the same symbol sometimes means different things in different contexts, legends help minimize misunderstandings.

## Symbol Vocabulary

The following symbols are commonly used in flow charts:

**Process Symbols:**
- **Rectangle**: Specific step, activity, procedure (e.g., painting a fender, typing a letter)
- **Rounded rectangle with vertical lines**: Manual operation (e.g., operating a punch press)
- **Hexagon**: Auxiliary operation such as inspection, examination, coding, calibration
- **Circle with horizontal line**: Combined activity (inspection concurrent with another operation)

**Flow Control:**
- **Diamond**: Decision point where selection between alternatives is possible
- **Oval/Rounded rectangle**: Terminator (beginning, end, start, finish, stop, interrupt)
- **Small circle**: Connector between noncomputer entities or parts of diagram

**Data Handling:**
- **Parallelogram**: Input or output to a system
- **Document shape (wavy bottom)**: Document such as purchase order, sales order
- **Multiple documents**: Multiple copies of a document
- **Trapezoid**: Manual input via keyboard
- **Monitor shape**: Information displayed on computer or television screen

**Storage and Delay:**
- **Triangle**: Filing or storage of information or material
- **D-shape**: Idle period, waiting period, or delay
- **Cylinder**: Information transferred to storage within computer

## Examples

> "Because of the versatility of flow charts and the lack of universally accepted standards for constructing them, their appearance varies significantly." (p. 155)

Harris illustrates several flow chart variations on pages 155-156:

- **Divergence and convergence**: Flow charts showing how processes might split into multiple paths or merge from multiple paths
- **Time-based flow charts**: Process steps aligned with a time scale (Week 1 through Week 5), noting that "Most flow charts do not include a time base; however, on occasion they do. PERT and critical path charts are two other examples where time is occasionally incorporated."
- **Department responsibility**: Arrows on the left-hand side denote which department has responsibility for specific steps
- **Pictorial flow charts**: Using pictures or icons with word descriptions to aid rapid understanding, "particularly where the subject matter is complex or the viewer might be more familiar with the visual image"
- **Proportional flow lines**: No symbols used; the thickness of the line is proportional to the value it represents
- **Detailed information panels**: Sometimes detailed information regarding specific elements is included with the flow chart

## Usage

Flow charts are appropriate when:
- Documenting sequential processes with decision points
- Communicating procedures across teams or departments
- Analyzing workflow for improvement opportunities
- Training personnel on standard procedures

Flow charts are less effective when:
- The process has no clear sequence
- Too many parallel processes exist simultaneously
- The audience is unfamiliar with flow chart conventions (consider pictorial versions)

Additional information can be encoded into symbols by means of color, fill, dashes, etc.

## Notes

In certain cases symbols are not used to enclose some or all elements of a flow chart. Descriptive information is sometimes simply placed alongside the arrows. This simpler approach works when the audience needs quick comprehension without learning symbol conventions.
