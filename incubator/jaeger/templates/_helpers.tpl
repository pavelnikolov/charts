{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "jaeger.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "jaeger.fullname" -}}
{{- $name := default "jaeger" .Values.nameOverride -}}
{{- if ne .Chart.Name .Release.Name -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cassandra.fullname" -}}
{{- printf "%s-%s" .Release.Name "cassandra" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "elasticsearch.client.url" -}}
{{- $scheme := .Values.storage.elasticsearch.scheme -}}
{{- $port := .Values.storage.elasticsearch.port -}}
{{- if .Values.provisionDataStore.elasticsearch }}
{{- $host := printf "%s-%s-%s" .Release.Name "elasticsearch" "client" | trunc 63 | trimSuffix "-" -}}
{{- printf "%s://%s:%s" $scheme $host $port }}
{{- else }}
{{- $host := .Values.storage.elasticsearch.host -}}
{{- printf "%s://%s:%s" $scheme $host $port }}
{{- end }}
{{- end -}}
