oc set build-hook bc/hook --post-commit --command -- \
    bash -c "curl -s -S -i -X POST http://builds-formanagers.apps.lab.example.com/api/builds -f -d \"developer=\${DEVELOPER}&git=\
	${OPENSHIFT_BUILD_SOURCE}&project=\${OPENSHIFT_BUILD_NAMESPACE}\""
