# kepler-helm-chart

This repository is for the Helm chart for Kepler.  We are using `gh-pages` branch to host and index the chart.  When modifying the chart please bump the version in the [Chart.yaml](/chart/kepler/Chart.yaml) file.

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
