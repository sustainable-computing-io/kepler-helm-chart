![GitHub](https://img.shields.io/github/license/sustainable-computing-io/kepler-helm-chart) [![Contribute](https://img.shields.io/static/v1?label=Contributing&message=guide&color=blue)](https://github.com/sustainable-computing-io/kepler/blob/main/CONTRIBUTING.md) [![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/kepler)](https://artifacthub.io/packages/search?repo=kepler) [![Releases downloads](https://img.shields.io/github/downloads/sustainable-computing-io/kepler-helm-chart/total.svg)](https://github.com/sustainable-computing-io/kepler-helm-chart/releases)
# kepler-helm-chart

### ⚠️ Deprecated ⚠️

This repository is **deprecated** and will be **archived**. The Kepler Helm chart now lives in the main Kepler repository, under [manifests/helm](https://github.com/sustainable-computing-io/kepler/tree/main/manifests/helm), and is published as an OCI artifact.

**Please use the up-to-date installation instructions instead:** [Kepler Installation Guide](https://github.com/sustainable-computing-io/kepler/blob/main/docs/user/installation.md)

Quick start with the new chart:

```bash
helm install kepler oci://quay.io/sustainable_computing_io/charts/kepler \
  --namespace kepler \
  --create-namespace
```

No further changes will be made to this repository. Please file issues and contribute chart changes in the [main Kepler repository](https://github.com/sustainable-computing-io/kepler) instead.

---

### Archived Installation Docs

This repository is for the Helm chart for Kepler.  We are using `gh-pages` branch to host and index the chart.  When modifying the chart please bump the version in the [Chart.yaml](/chart/kepler/Chart.yaml) file.

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

The chart is accessible using the following commands:

Add the helm repo

```bash
helm repo add kepler https://sustainable-computing-io.github.io/kepler-helm-chart
```

You can see the latest version by using the folllowing command:

```bash
helm search repo kepler
```

If you would like to test and look at the manifest files before deploying you can run:

```bash
helm install kepler kepler/kepler --namespace kepler --create-namespace --dry-run --devel
```

Then to install run the following:

```bash
helm install kepler kepler/kepler --namespace kepler --create-namespace
```
