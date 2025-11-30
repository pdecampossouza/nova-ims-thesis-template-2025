# NOVA IMS Thesis Template 2025--2026

This repository provides an **adapted NOVAthesis template** configured
specifically for the Master's and Doctoral programmes of **NOVA
Information Management School (NOVA IMS)**.

It is intended primarily for NOVA IMS students, supervisors, and
academic services who need a consistent LaTeX template for dissertations
and theses.

------------------------------------------------------------------------

## 1. Origin and License

This work is based on the official **NOVAthesis** class and template by
João Lourenço, available at the NOVAthesis project page.

-   Original project: `novathesis` (LPPL 1.3c)
-   License: **LaTeX Project Public License (LPPL) 1.3c**
-   This adaptation keeps the same license.

If you use this template, please be kind and cite the NOVAthesis manual
in your thesis, as requested by the original author.

------------------------------------------------------------------------

## 2. What is customized for NOVA IMS?

This version contains, among other things:

-   NOVA IMS--specific **front and back covers** for each
    programme/specialization.
-   Updated **NOVA IMS green visual identity** and logos (when
    applicable).
-   Pre-configured **degree names and acronyms** (e.g., MGI, MDSAA,
    MDDM, MEGI, etc.).
-   Updated **page layout, margins and typography** aligned with
    NOVAthesis 7.2.1 (2024-10-15).
-   English and Portuguese strings adapted for NOVA IMS context.

All macros and internal logic are kept as close as possible to the
original NOVAthesis to simplify future updates.

------------------------------------------------------------------------

## 3. Main Files

Typical key files in this project:

-   `template.tex` -- Main LaTeX file. Students normally **do not need
    to change its structure**, only the metadata and content in
    dedicated sections.
-   `novathesis.cls` -- NOVAthesis class (from the official project).
-   `nova/ims/nova-ims-defaults.ldf` -- NOVA IMS configuration file
    (degrees, covers, page setup).
-   `Chapters/` -- Example chapters and content.
-   `FrontBackMatter/` -- Abstract, acknowledgements, lists, etc.
-   `Figures/`, `Covers/`, etc. -- Visual assets for NOVA IMS covers and
    branding.

The structure follows the official NOVAthesis repository so users
familiar with it will feel at home.

------------------------------------------------------------------------

## 4. How to create a new thesis from this template

### 4.1. Using Overleaf (recommended)

1.  Open the NOVA IMS template on Overleaf (link to be provided by NOVA
    IMS or academic services).
2.  Click **"Open as Template"** or **"Copy project"**.
3.  Give the project a name, e.g., `Thesis_YourName_2025`.
4.  Edit the **metadata file(s)** (student name, title, advisers,
    degree, language).
5.  Replace example chapters with your own content.

## 4.2. Local compilation (advanced users)

1.  Clone or download this repository as a ZIP.
2.  Ensure you have a **recent TeX Live** distribution (2024 or later is
    recommended).
3.  From the project root, run:

``` bash
lualatex template.tex
biber template
lualatex template.tex
lualatex template.tex
```

### 5. Selecting the NOVA IMS programme and specialization

The NOVA IMS--specific programmes and specializations are configured in\
`nova/ims/nova-ims-defaults.ldf` and in a small block near the top of
`template.tex`.

Typically you will find something like:

    % Course and specialization for IMS cover design
    \newcommand{\imsDegree}{mgi}        % mgi, megi, mdsaa, mddm, ...
    \newcommand{\imsSpecialization}{bi} % bi, gcbi, gsti, gsi, mi, td, ...

-   `\imsDegree` selects the programme (e.g. mgi, mdsaa, mddm, megi,
    dgi, mgt, ...).\
-   `\imsSpecialization` selects the specialization within that
    programme (e.g. bi, gcbi, ba, ds, mi, mrcrm, ...).

Each valid combination has a corresponding pair of cover files (front
and back) and header configuration.

### 6. Recommended testing (for NOVA IMS academic services)

Before making the template official for students, it is recommended to:

-   Compile the template with all supported degrees (MGI, MEGI, MDSAA,
    MDDM, CSIG, MCSIG, DGI, MGT, ...).
-   Test at least one specialization per degree.
-   Inspect covers, title pages, margins, fonts, abstract pages.
-   Confirm no missing images or LaTeX warnings.

### 7. How to cite NOVAthesis

Please refer to the official NOVAthesis repository/documentation for the
current recommended BibTeX entry.

### 8. Contact

Template adaptation for NOVA IMS (2025--2026)\
Paulo Vitor de Campos Souza\
NOVA Information Management School (NOVA IMS)\
Email: psouza@novaims.unl.pt

> **Important:** Always compile with the same LaTeX engine/version
> recommended in the NOVAthesis manual (usually **LuaLaTeX** with a
> recent TeX Live).

------------------------------------------------------------------------

