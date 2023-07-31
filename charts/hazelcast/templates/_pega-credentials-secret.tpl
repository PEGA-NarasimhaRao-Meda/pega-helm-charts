{{- define "pegaCredentialsSecretTemplate" }}
kind: Secret
apiVersion: v1
metadata:
  name: {{ template "pegaCredentialsSecret" $ }}
  namespace: {{ .Release.Namespace }}
  annotations:
    "helm.sh/hook": pre-install, pre-upgrade
    "helm.sh/hook-weight": "0"
    "helm.sh/hook-delete-policy": before-hook-creation
data:
  # Base64 encoded username used for authentication in Hazelcast client-server mode
  HZ_CS_AUTH_USERNAME: {{ .Values.username | b64enc }}
  # Base64 encoded password used for authentication in Hazelcast client-server mode
  HZ_CS_AUTH_PASSWORD: {{ .Values.password | b64enc }}
type: Opaque
{{- end }}
