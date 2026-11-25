<h1 align="center">Sample streamlines based on label assignments</h1>

<p align="center">
  A filtered tractogram containing only the streamlines labelled 1 in a per-streamline labels file, such as the SIFT surviving-streamline labels.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.619"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.619-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

## 🧠 At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Keeps the streamlines of a tractogram whose label is 1 in a binary labels file (e.g. from SIFT) and removes the rest, using MRtrix3 connectome2tck.**

Uses MRtrix3 connectome2tck with the per-streamline labels as node assignments to extract the streamlines labelled 1 into a new tractogram. Use it to apply a streamline selection, such as the SIFT surviving-streamline labels, to the original tractogram. The labels file must have one entry per streamline of the input tractogram.

| | |
|---|---|
| 📥 **Inputs** | `neuro/track/tck` · `neuro/labels` |
| 📤 **Outputs** | `neuro/track/tck` |
| 🐳 **Container** | `brainlife/mrtrix3:3.0.3` |
| ⚙️ **Resources** | 4 CPUs · 40 GB memory · 1 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.619](https://doi.org/10.25663/brainlife.app.619) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `track` | `neuro/track/tck` | yes | Tractogram to filter. |
| `labels` | `neuro/labels` | yes | Per-streamline labels (one value per streamline); streamlines labelled 1 are kept. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `filtered_track` | `neuro/track/tck` | Tractogram containing only the streamlines labelled 1. |

<details>
<summary><b>⚙️ Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `binarize_labels` | boolean | `true` | Intended to binarise the labels (any value > 0 becomes 1) with binarize_labels.py before filtering. Note: main on this branch never runs binarize_labels.py, so the setting has no effect. |

</details>

<!-- brainlife-app:end -->

## 🚀 Running the App

### ☁️ On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.619](https://doi.org/10.25663/brainlife.app.619), choose a `neuro/track/tck` tractogram and a `neuro/labels` dataset with one value per streamline (1 = keep, 0 = remove), and press **Execute**. For example, pass the labels from the SIFT App to obtain the subsampled tractogram. The App uses MRtrix3 `connectome2tck` with the labels as node assignments to extract the streamlines labelled 1, and archives the result to your project as a `neuro/track/tck` dataset tagged `filtered`.

The labels file must have one entry per streamline of the input tractogram. The `binarize_labels` option is not applied by this version of the App: labels must already be 0 or 1.

### 💻 Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). MRtrix3 3.0.3 runs inside the container.

1. Clone this repository and check out the branch brainlife.io runs: `git checkout binarize-labels`.
2. Create `config.json` with the paths to your inputs:

   ```json
   {
       "track": "/input/track/track.tck",
       "labels": "/input/labels/labels.csv",
       "binarize_labels": true
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

### 🧪 Sample data

Download sample datasets from brainlife.io with the [brainlife CLI](https://github.com/brainlife/cli):

```bash
npm install -g brainlife
bl login
mkdir input
bl dataset download <dataset-id>
```

## 📦 Outputs

```text
filtered_track/
└── track.tck   the streamlines labelled 1
```

## 🩺 Troubleshooting

- **`something went wrong. check derivatives`**: `filtered_track/track.tck` was not produced. Check that the labels file has one entry per streamline of the tractogram.

## 📚 Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Tournier J-D, Smith RE, Raffelt D, Tabbara R, Dhollander T, Pietsch M, Christiaens D, Jeurissen B, Yeh C-H, Connelly A. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. *NeuroImage* 202:116137 (2019).
- Sample streamlines based on labels assignments. brainlife.io App. [doi:10.25663/brainlife.app.619](https://doi.org/10.25663/brainlife.app.619)
- Tournier et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. *NeuroImage* 202:116137 (2019). [doi:10.1016/j.neuroimage.2019.116137](https://doi.org/10.1016/j.neuroimage.2019.116137)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## 👥 Authors

- Brad Caron

**Contributors:** Soichi Hayashi

## 💰 Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## ⚖️ License

[MIT](LICENSE). MRtrix3 itself is distributed under its own [license](https://www.mrtrix.org/).
