#!/bin/sh

cat <<EOF | kubectl apply -f -
apiVersion: cert-manager.io/v1alpha2
kind: Certificate
metadata:
  name: test-prod
  namespace: istio-system
spec:
  secretName: test-certificate
  issuerRef:
    name: letsencrypt-prod
  commonName: agile-devops.club
  dnsNames:
  - agile-devops.club
  acme:
    config:
    - http01:
        ingressClass: istio
      domains:
      - agile-devops.club
---
EOF

