# Microcosm Evolution Analysis

This repository contains R scripts used to analyse evolutionary dynamics in experimental fly microcosms across 2500 generations. The dataset includes functional traits, morphological traits, semi‑cryptic traits, and 20 neutral genetic markers.

Raw data is NOT included for ethical reasons. Only scripts and documentation are provided.

## Analyses Included

### 1. NMDS (Non‑metric Multidimensional Scaling)
- Manhattan distance on genetic markers (gm1–gm20)
- NMDS ordination using vegan::metaMDS
- Stress value trends to detect temperature gradient changes
- Population divergence visualisation

### 2. Trait Trends
- Mean ft1, ft2, ft3 across 2500 generations
- Full trait mean trajectories (ft, mt, sct)

### 3. Genetic Marker Behaviour
- Fixation/loss detection for gm1–gm20
- Allele frequency calculations
- First fixed/lost marker identification

## Repository Structure

Microcosm-Evolution-Analysis/
│
├── README.md
│
├── scripts/
│   ├── NMDS_stress_analysis.R
│   ├── NMDS_population_structure.R
│   ├── trait_trends_ft1_ft2_ft3.R
│   ├── trait_means_all_traits.R
│   ├── marker_fixation_loss_core.R
│   ├── marker_fixation_over_time.R
│
└── data/
    └── README_data_structure.md   (no raw data included)

## Scripts Included

- **NMDS_stress_analysis.R** — Calculates NMDS stress values across generations to detect temperature gradient changes.
- **NMDS_population_structure.R** — Performs NMDS ordination and visualises population divergence using Manhattan distances.
- **trait_trends_ft1_ft2_ft3.R** — Computes and plots mean ft1, ft2, ft3 values across 2500 generations.
- **trait_means_all_traits.R** — Tracks mean trajectories for all functional, morphological, and semi‑cryptic traits.
- **marker_fixation_loss_core.R** — Checks fixation or loss of key markers (gm1 and gm20) at specific generations.
- **marker_fixation_over_time.R** — Identifies the first generation where any marker becomes fixed or lost.

## Tools Used

- **R**
- **vegan** (NMDS ordination)
- **ggplot2** (visualisation)
- **dplyr** (data manipulation)

## Author

**Harshita Khot**  
Bioinformatics Graduate — UWA  

