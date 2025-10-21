{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-dashboard-auth.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-dashboard-auth.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s-dashboard-auth.labels" -}}
helm.sh/chart: {{ include "k8s-dashboard-auth.chart" . }}
{{ include "k8s-dashboard-auth.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-dashboard-auth.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-dashboard-auth.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

