skopeo copy --dest-tls-verify=false \    
--dest-creds=developer:$TOKEN \    
oci:/home/student/DO288/labs/expose-image/php-info \    
docker://docker-registry-default.apps.lab.example.com/common/php-info
