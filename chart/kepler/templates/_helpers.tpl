{{/*
Expand the name of the chart.
*/}}
{{- define "kepler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kepler.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kepler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kepler.labels" -}}
helm.sh/chart: {{ include "kepler.chart" . }}
{{ include "kepler.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kepler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kepler.name" . }}
app.kubernetes.io/component: exporter
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "kepler.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kepler.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Calculate the image identifier to use
*/}}
{{- define "kepler.imageIdentifier" -}}
{{- if .Values.image.digest }}
  {{- $digest := .Values.image.digest }}
  {{- if not (hasPrefix "sha256:" $digest) }}
    {{- $digest = printf "sha256:%s" $digest }}
  {{- end }}
  {{- printf "@%s" $digest }}
{{- else if .Values.image.tag }}
  {{- printf ":%s" .Values.image.tag }}
{{- else }}
  {{- printf ":%s" .Chart.AppVersion }}
{{- end }}
{{- end }}
