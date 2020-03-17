# DO288 Containerized Example Applications


oc new-app https://github.com/openshift/ruby-hello-world -l name=hello-world
oc new-app https://github.com/openshift/test-maven-app -l name=my-maven-app
oc new-app https://github.com/sclorg/cakephp-ex -l name=my-php-app

app-config

