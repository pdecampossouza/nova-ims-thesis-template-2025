Partner logos for 2025-style covers.

Files in this folder (trimmed to their visible content, PDF):
  uji.pdf            Universitat Jaume I
  uni-muenster.pdf   Universitaet Muenster (2023 logo)
  erasmus-plus.pdf   Erasmus+ logo (EU flag and "Erasmus+"), vector

They are listed, without extension, in thesis-info.tex:
  \partnerlogos{Logos/uji,Logos/uni-muenster,Logos/erasmus-plus}

All logos are set to the same height in one row, centred vertically.
To resize one logo for an even visual weight, use for example
  \partnerlogoscale{Logos/uji}{0.8} If the row is wider than
the text area it is scaled down. A missing file shows as a labelled empty box,
so the document still compiles. PDF, PNG and JPG work; convert SVG files to
PDF first (for example in Inkscape: Save As, PDF).

Note: under the EU visibility rules for 2021-2027, EU-funded projects show the
EU emblem with the statement "Co-funded by the European Union". If the
programme office asks for that version, add it here (for example
eu-cofunded.pdf) and add Logos/eu-cofunded to \partnerlogos.
