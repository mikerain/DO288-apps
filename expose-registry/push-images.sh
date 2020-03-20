# export TOKEN=$(oc whoami -t)

skopeo copy --dest-tls-verify=false \
    --dest-creds=developer:$TOKEN \
    oci:/home/student/DO288/labs/expose-registry/rhel7-info \
    docker://docker-registry-default.apps.lab.example.com/common/rhel7-info