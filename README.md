# NOVA IMS Thesis Template 2025–2026

This repository provides an **adapted NOVAthesis template** configured specifically for the Master’s and Doctoral programmes of the **NOVA Information Management School (NOVA IMS)**.

It is intended primarily for NOVA IMS students, supervisors, and academic services requiring a consistent and institution-approved LaTeX template for dissertations and theses.

---

## 1. Origin and License

This work is based on the official **NOVAthesis** class and template by João Lourenço, licensed under LPPL 1.3c.

- Original project: **NOVAthesis**
- License: **LaTeX Project Public License (LPPL) 1.3c**
- This adaptation keeps the same license.

If you use this template, please cite the NOVAthesis manual as requested by the original author.

---

## 2. What is customized for NOVA IMS?

This adaptation includes:

- NOVA IMS–specific **front and back covers** for all programmes and specializations  
- NOVA IMS **back covers**  
- NOVA IMS **green visual identity**  
- Pre-configured **degree names and acronyms**  
- Page layout identical to **NOVAthesis 7.2.1 (2024-10-15)**  
- English/Portuguese metadata adapted for NOVA IMS  

This template mirrors the NOVAthesis structure to ensure future compatibility.

---

## 3. Main Files in the Template

- `template.tex` — Main entry point (students mainly edit metadata)  
- `nova/ims/nova-ims-defaults.ldf` — All programme/specialization options  
- `Chapters/` — Example chapters  
- `FrontBackMatter/` — Abstracts, acknowledgements, lists  
- `Covers/` — All front and back covers  
- `novathesis.cls` — NOVAthesis class  

---

## 4. How to Create Your Thesis (Students)

### 4.1 Using Overleaf (recommended)

1. Open the NOVA IMS template on Overleaf.  
2. Click **“Open as template”**.  
3. Fill in your metadata (title, author, supervisors).  
4. Select the programme and specialization.  
5. Replace example chapters with your own content.

---

## 5. Selecting the NOVA IMS Programme and Specialization

In the file `template.tex`, you will find:

```tex
\newcommand{\imsDegree}{mgi}
\newcommand{\imsSpecialization}{bi}
```

These variables determine:

- which **front cover** is used  
- which **back cover** is used  
- which **degree metadata** appears  

They **must** be valid combinations from the list below.

---

# 6. VALID PROGRAMME + SPECIALIZATION COMBINATIONS  

Official list for **NOVA IMS 2025–2026**

---

## 6.1 Master’s in Information Management — MGI

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name |
|--------------------------|---------------------------------------|--------------|
| `mgi`                    | `bi`                                  | Business Intelligence |
| `mgi`                    | `gcbi`                                | Governance of Cybersecurity and Business Intelligence |
| `mgi`                    | `gsti`                                | Governance of Information Systems and Technologies |
| `mgi`                    | `gsi`                                 | Geographic Information Systems |
| `mgi`                    | `mi`                                  | Marketing Intelligence |
| `mgi`                    | `td`                                  | Technologies for Decision |

---

## 6.2 Master’s in Data Science and Advanced Analytics — MDSAA

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name |
|--------------------------|---------------------------------------|--------------|
| `mdsaa`                  | `ba`                                  | Business Analytics |
| `mdsaa`                  | `ds`                                  | Data Science |

---

## 6.3 Master’s in Data-Driven Marketing — MDDM

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name |
|--------------------------|---------------------------------------|--------------|
| `mddm`                   | `dma`                                 | Digital Marketing and Analytics |
| `mddm`                   | `ds4m`                                | Data Science for Marketing |
| `mddm`                   | `mi`                                  | Marketing Intelligence |
| `mddm`                   | `mrcrm`                               | Marketing Research and CRM |

---

## 6.4 Master’s in Statistics and Information Management — MEGI

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name |
|--------------------------|---------------------------------------|--------------|
| `megi`                   | `agi`                                 | Applied Geographic Information |
| `megi`                   | `agr`                                 | Agribusiness |
| `megi`                   | `mrcrm`                               | Marketing Research and CRM |

---

## 6.5 Master’s in Geographic Information Systems and Science — MCSIG

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name |
|--------------------------|---------------------------------------|--------------|
| `mcsig`                  | `csig`                                | Geographic Information Systems and Science |
| `mcsig`                  | `cdg`                                 | Cartography and Geographic Data |

---

## 6.6 Doctoral Programme in Information Management — DGI

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | Notes |
|--------------------------|---------------------------------------|-------|
| `dgi`                    | `main`                                | EN and PT — shared back cover |

---

## 6.7 Master’s in Geospatial Technologies — MGT

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | Notes |
|--------------------------|---------------------------------------|-------|
| `mgt`                    | `main`                                | Only EN version available |

---

## 7. Example: Setting your programme

### Example for **MGI — Business Intelligence (EN)**

```tex
\newcommand{\imsDegree}{mgi}
\newcommand{\imsSpecialization}{bi}
```

### Example for **MDDM — Marketing Intelligence (PT)**

```tex
\newcommand{\imsDegree}{mddm}
\newcommand{\imsSpecialization}{mi}
```

---

## 8. Recommended Testing For Academic Services

Academic Services should compile the template for:

- every programme  
- every specialization  
- both languages (PT and EN when available)

Check for:

- missing images  
- correct cover alignment  
- margins and typography  
- abstract page language  
- adviser labels (Supervised by / Orientada por)

---

## 9. Contact

Template adaptation (2025–2026):  
**Paulo Vitor de Campos Souza**  
NOVA Information Management School  
Email: psouza@novaims.unl.pt  
