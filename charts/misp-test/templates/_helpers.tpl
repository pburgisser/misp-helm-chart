{{/*
Expand the name of the chart.
*/}}
{{- define "misp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "misp.fullname" -}}
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
{{- define "misp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "misp.labels" -}}
helm.sh/chart: {{ include "misp.chart" . }}
{{ include "misp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "misp.frontend.labels" -}}
helm.sh/chart: {{ include "misp.chart" . }}
{{ include "misp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "misp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "misp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector frontend labels
*/}}
{{- define "misp.frontend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "misp.name" . }}-frontend
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector workers labels
*/}}
{{- define "misp.workers.selectorLabels" -}}
app.kubernetes.io/name: {{ include "misp.name" . }}-workers
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector modules labels
*/}}
{{- define "misp.modules.selectorLabels" -}}
app.kubernetes.io/name: {{ include "misp.name" . }}-modules
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector modules labels
*/}}
{{- define "misp.cronjobs.selectorLabels" -}}
app.kubernetes.io/name: {{ include "misp.name" . }}-cronjobs
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "misp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "misp.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
{{/*
Create the name of the service account to use
*/}}
{{- define "misp.frontend.serviceAccountName" -}}
{{- if .Values.frontend.serviceAccount.create }}
{{- default (printf "%s-frontend" (include "misp.fullname" .)) .Values.frontend.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.frontend.serviceAccount.name }}
{{- end }}
{{- end }}
{{/*
Create the name of the service account to use
*/}}
{{- define "misp.modules.serviceAccountName" -}}
{{- if .Values.modules.serviceAccount.create }}
{{- default (printf "%s-modules" (include "misp.fullname" .)) .Values.frontend.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.modules.serviceAccount.name }}
{{- end }}
{{- end }}
{{/*
Create the name of the service account to use
*/}}
{{- define "misp.workers.serviceAccountName" -}}
{{- if .Values.workers.serviceAccount.create }}
{{- default (printf "%s-workers" (include "misp.fullname" .)) .Values.workers.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.workers.serviceAccount.name }}
{{- end }}
{{- end }}
{{/*
Create the name of the service account to use
*/}}
{{- define "misp.cronJobs.serviceAccountName" -}}
{{- if .Values.cronJobs.serviceAccount.create }}
{{- default (printf "%s-cronjobs" (include "misp.fullname" .)) .Values.cronJobs.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.cronJobs.serviceAccount.name }}
{{- end }}
{{- end }}