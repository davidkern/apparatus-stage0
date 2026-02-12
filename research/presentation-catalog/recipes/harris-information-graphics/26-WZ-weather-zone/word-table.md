---
name: Word Table
slug: word-table
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Word Table, p. 441"

intent: Organize qualitative or descriptive information in a tabular format using words rather than numbers
direction: both

components:
  - element: row-headers
    encodes: Row categories or labels
    required: true
  - element: column-headers
    encodes: Column categories or labels
    required: true
  - element: cells
    encodes: Descriptive content (words, phrases, or paragraphs)
    required: true

parameters:
  cell_content_length: single-word | phrase | sentence | paragraph

related: []  # TBD: table, matrix, text-table

warnings:
  - "Cell content length may vary from single words to paragraphs"

extensions:
  harris_entry: "Word Table"
  typical_use: "organizing qualitative information, comparing descriptions across categories"
---

## Description

A table consisting largely or entirely of words rather than numeric data. The number of words in each cell might vary from a single word to a sentence or even a paragraph, depending on the information being organized.

Word tables provide the organizational benefits of tabular structure for qualitative or descriptive information.

## Examples

Harris illustrates a word table (p. 441) with:

**Columns**: Product introduced | Product growing | Product maturing

**Rows and cells**:
- Sales: Negligible | Rapid increase | Stable
- Profit: Negative | Break even | Positive
- Cash flow: Negative | Stable | Positive

> "A table consisting largely or entirely of words, as shown at the right. The number of words in each cell might vary from a single word to a sentence or even a paragraph." (p. 441)

## Usage

Word tables are appropriate for:
- Organizing qualitative assessments
- Comparing characteristics across categories
- Presenting decision matrices with text criteria
- Summarizing stages or phases with descriptive attributes

### Cell Content

Cells may contain:
- **Single words**: Concise descriptors (e.g., "Positive", "Stable")
- **Phrases**: Short descriptive phrases
- **Sentences**: Brief explanatory statements
- **Paragraphs**: Detailed descriptions (though this reduces scannability)

### Design Considerations

**Consistency**: Try to maintain similar content lengths within a table for visual balance

**Scannability**: Shorter cell content allows faster comparison across rows and columns

**White space**: Longer cell content requires more spacing to remain readable

## Notes

Word tables bridge the gap between unstructured text and numeric tables, providing organization for qualitative data that doesn't reduce to numbers. They're particularly useful for lifecycle models, maturity frameworks, and comparative assessments where the information is inherently descriptive.
