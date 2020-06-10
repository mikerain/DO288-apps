# Chapter6
223p
考试检查模板文件错误

oc export is,bc,dc,svc,route,pvc --as-template test \    > ~/test-template.yaml

grep kind: test-template.yaml
  
diff ~/test-template.yaml \    ~/DO288/labs/create-template/quotes-template-clean.yaml \
  