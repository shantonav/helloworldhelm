{{/*
Expand the name of the chart.
*/}}
{{- define "helloworldchart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "helloworldchart.fullname" -}}
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
{{- define "helloworldchart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "helloworldchart.labels" -}}
helm.sh/chart: {{ include "helloworldchart.chart" . }}
{{ include "helloworldchart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "helloworldchart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helloworldchart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "helloworldchart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "helloworldchart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create the name of the deployment for angular service
*/}}
{{- define "helloworldangular.fullname" -}}
{{- $name := default .Chart.Name .Values.angular.labelprefix }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
Angular app labels
*/}}
{{- define "helloworldangular.labels" -}}
helm.sh/chart: {{ include "helloworldangular.chart" . }}
{{ include "helloworldangular.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Create chart name and version for angular app as used by the chart label.
*/}}
{{- define "helloworldangular.chart" -}}
{{- printf "%s-%s-%s" .Chart.Name .Values.angular.labelprefix .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Selector labels fopr angular app
*/}}
{{- define "helloworldangular.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helloworldangular.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Expand the name of the angular chart.
*/}}
{{- define "helloworldangular.name" -}}
{{- default .Chart.Name .Values.angular.labelprefix | trunc 63 | trimSuffix "-" }}
{{- end }}