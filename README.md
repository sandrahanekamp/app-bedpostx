# bedpostx

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Fits FSL BedpostX (GPU version, FSL 6.0.1) multi-fibre ball-and-stick models to preprocessed DWI within a brain mask, producing the sample distributions needed for probabilistic tractography.**

Runs bedpostx_gpu on the DWI, bvals, bvecs and nodif brain mask to estimate up to nf fibre orientations per voxel with MCMC sampling. Use it before FSL probtrackx. Needs preprocessed (eddy/motion corrected) DWI and a brain mask in the same space, and a GPU node.

| | |
|---|---|
| 📥 **Inputs** | `neuro/dwi` · `neuro/mask` |
| 📤 **Outputs** | `neuro/FSLBedpostX` |
| 🐳 **Container** | `brainlife/fsl:6.0.1` |
| ⚙️ **Resources** | 8 CPUs · 16 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.578](https://doi.org/10.25663/brainlife.app.578) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `dwi` | `neuro/dwi` (preprocessed) | yes | A 4D series of data volumes. This will include diffusion-weighted volumes and volume(s) with no diffusion weighting. |
| `mask` | `neuro/mask` (dwi, brain, preprocessed) | yes | 3D binary brain mask volume derived from running bet on nodif (i.e. on a volume with no diffusion weighting). Created using FSL Brain Extraction (BET) on DWI brainlife/app-FSLBET |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/FSLBedpostX` | This folder contains the entire set of folders and files outputted by the FSL BedpostX process |

<details>
<summary><b>⚙️ Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `nf` | number | `3` | Maximum number of fibres to fit in each voxel. |
| `bi` | number | `1000` | burnin period, default 1000 |
| `fudge` | number | `1` | ARD fudge factor (integer) controlling automatic relevance determination of extra fibres. |

</details>

<!-- brainlife-app:end -->

