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

In the file `Config/1_novathesis.tex`, you will find:

```tex
\newcommand{\imsDegree}{mgi}
\newcommand{\imsSpecialization}{bi}
\newcommand{\ntsetup{lang=en}}
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

## 6.1 Master's Degree Program in Information Management — MGI

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name | Portuguese Name |
|--------------------------|---------------------------------------|--------------|---------|
| `mgi` | `bi` | Business Intelligence | Inteligência de Negócio |
| `mgi` | `gcbi` | Knowledge Management and Business Intelligence | Gestão de Conhecimento e Inteligência de Negócio |
| `mgi` | `gsti` | Information Systems Management | Gestão de Sistemas e Tecnologias de Informação |
| `mgi` | `gsi` | Information Systems and Technlogies Management | Gestão de Sistemas de Informação |
| `mgi` | `mi` | Marketing Intelligence | Inteligência de Marketing |
| `mgi` | `td` | Digital Transformation | Transformação Digital |

---

## 6.2 Master's Degree Program in Data Science and Advanced Analytics — MDSAA

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name | Portuguese Name |
|--------------------------|---------------------------------------|--------------|---------|
| `mdsaa` | `ba` | Business Analytics |  Métodos Analíticos para a Gestão |
| `mdsaa` | `ds` | Data Science | Ciência de Dados |

---

## 6.3 Master's in Data Driven Marketing — MDDM

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`)| English Name | Portuguese Name |
|--------------------------|---------------------------------------|--------------|---------|
| `mddm` | `dma` | Digital Marketing and Analytics | Marketing Digital e Análise de Dados |
| `mddm` | `ds4m` | Data Science for Marketing |  Ciência de Dados Aplicada ao Marketing |
| `mddm` | `mi` | Marketing Intelligence |  Inteligência de Marketing |
| `mddm` | `mrcrm` | Marketing Research & CRM | Estudos de Marketing e Gestão do Relacionamento com o Cliente |

---

## 6.4 Master's Degree Program in Statistics and Information Management — MEGI

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name | Portuguese Name |
|--------------------------|---------------------------------------|--------------|---------|
| `megi` | `agi` | Data Analytics | Análise e Gestão de Informação |
| `megi` | `agr` | Risk and Analysis Management | Análise e Gestão de Risco |
| `megi` | `mrcrm` | Marketing Research & CRM | Estudos de Marketing e Gestão do Relacionamento com o Cliente |

---

## 6.5 Master's Degree Program in Geographic Information Systems and Science — MCSIG

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name | Portuguese Name |
|--------------------------|---------------------------------------|--------------|---------|
| `mcsig` | `csig` | Geographic Information Systems and Science | Ciência e Sistemas de Informação Geográfica` |
| `mcsig` | `cdg` | Geospatial Data Science | Ciência dos Dados Geoespaciais |

---

## 6.6 Doctoral Program in Information Management — DGI

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name | Portuguese Name |
|--------------------------|---------------------------------------|---------|-------|
| `dgi` | `main` | `DGI-EN`, `DGI-PT` | Doctoral Program in Information Management (ENG) / Doutoramento em Gestão de Informação (PT) |

---

## 6.7 Master's Degree Program in Geospatial Technologies — MGT

| Programme (`\imsDegree`) | Specialization (`\imsSpecialization`) | English Name | Portuguese Name |
|--------------------------|---------------------------------------|---------|-------|
| `mgt` | `main` | `MGT-EN` | Master's Degree Program in Geospatial Technologies (ENG) | - |


---

## 7. Example: Setting your programme

### Example for **MGI — Business Intelligence (EN)**

```tex
\newcommand{\imsDegree}{mgi}
\newcommand{\imsSpecialization}{bi}
\newcommand{\ntsetup{lang=en}}
```

### Example for **MDDM — Marketing Intelligence (PT)**

```tex
\newcommand{\imsDegree}{mddm}
\newcommand{\imsSpecialization}{mi}
\newcommand{\ntsetup{lang=pt}}
```

---

## 8. Contact

Template adaptation (2025–2026):  
**Paulo Vitor de Campos Souza**  
NOVA Information Management School  
Email: psouza@novaims.unl.pt  
