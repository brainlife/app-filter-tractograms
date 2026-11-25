[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-brainlife.app.619-blue.svg)](https://doi.org/10.25663/brainlife.app.619)

# Sample tractograms based on labels assignments

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Keeps the streamlines of a tractogram whose label is 1 in a binary labels file (e.g. from SIFT) and removes the rest, using MRtrix3 connectome2tck.**

Uses MRtrix3 connectome2tck with the per-streamline labels as node assignments to extract the streamlines labelled 1 into a new tractogram. Use it to apply a streamline selection, such as the SIFT surviving-streamline labels, to the original tractogram. The labels file must have one entry per streamline of the input tractogram.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.619](https://doi.org/10.25663/brainlife.app.619)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `track` | `neuro/track/tck` | yes | Tractogram to filter. |
| `labels` | `neuro/labels` | yes | Per-streamline labels (one value per streamline); streamlines labelled 1 are kept. |

| Output | Datatype | Description |
|---|---|---|
| `filtered_track` | `neuro/track/tck` | Tractogram containing only the streamlines labelled 1. |

| Parameter | Type | Default | Description |
|---|---|---|---|
| `binarize_labels` | boolean | `true` | Intended to binarise the labels (any value > 0 becomes 1) with binarize_labels.py before filtering. Note: main on this branch never runs binarize_labels.py, so the setting has no effect. |

Runtime: container `brainlife/mrtrix3:3.0.3`; 4 CPUs; 40 GB memory; 1 h walltime.

<!-- brainlife-app:end -->

This app will sample streamlines from an input tractogram based on a binary labels assignment file, where 1 == streamlines to keep and 0 == streamlines to remove. For example, one could pass the labels datatype from the SIFT app into this app, and return a subsampled tractogram.

### Authors

- Brad Caron (bacaron@utexas.edu)

### Contributors

- Soichi Hayashi (shayashi@iu.edu)

### Funding Acknowledgement

brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations

We kindly ask that you cite the following articles when publishing papers and code using this code.

1. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). https://doi.org/10.1038/s41597-019-0073-y

2. Tournier, J.-D.; Smith, R. E.; Raffelt, D.; Tabbara, R.; Dhollander, T.; Pietsch, M.; Christiaens, D.; Jeurissen, B.; Yeh, C.-H. & Connelly, A. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage, 2019, 202, 116137

#### MIT Copyright (c) 2020 brainlife.io The University of Texas at Austin and Indiana University

## Running the App

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/brainlife.app.619](https://doi.org/10.25663/brainlife.app.619) via the 'Execute' tab.

### Running Locally (on your machine)

1. git clone this repo

2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "track": "/input/track/track.tck",
    "labels": "/input/labels/labels.csv"
}
```

### Sample Datasets

You can download sample datasets from Brainlife using [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input
bl dataset download
```

3. Launch the App by executing 'main'

```bash
./main
```

## Output

The main output of this App is a subsampled tractogram.

#### Product.json

The secondary output of this app is `product.json`. This file allows web interfaces, DB and API calls on the results of the processing.

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.

- MRTrix3: https://www.mrtrix.org/

#### MIT Copyright (c) 2020 brainlife.io The University of Texas at Austin and Indiana University
