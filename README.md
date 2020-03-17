# DO288 Containerized Example Applications


oc new-app https://github.com/openshift/ruby-hello-world -l name=hello-world
oc new-app https://github.com/openshift/test-maven-app -l name=my-maven-app
oc new-app https://github.com/sclorg/cakephp-ex -l name=my-php-app

chapter2
[app-config]
oc new-project  chapter2-app-config 
git clone https://github.com/woyaowoyao/DO288-apps
DO288-apps/app-config
oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=app-config --name myapp 

oc expose svc/myapp
oc get route
oc create configmap myconfig --from-literal APP_MSG='TEST'

oc get -o json cm/myconfig

oc set env dc/myapp --from cm/myconfig

oc edit configmap/myconfig

 oc rollout latest dc/myapp 

oc create secret generic myappfilesec  --from-file myapp.sec 
 
oc set volume dc/myapp --add  -t secret -m /opt/app-root/secure --name myappsec-vol --secret-name myappfilesec 

