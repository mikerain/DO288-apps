# Chapter6
223p
考试检查模板文件错误

oc export is,bc,dc,svc,route,pvc --as-template test \    > ~/test-template.yaml

# oc get --export is,bc,dc,svc,route,pvc  -o yaml  > test-template.yaml

# oc get template/nginx-example -o json -n openshift >nginx-example-t.json

# cd create-template

oc create -f quotes-template.yaml 

grep kind: test-template.yaml
  
diff ~/test-template.yaml \    ~/DO288/labs/create-template/quotes-template-clean.yaml \

 oc process --parameters 
  
# 重点-实验  PDF 242，数字页码 224，手写模板

1. 首先 http://xxxxx/xxx.yaml 文件        <======= 下载模板

2. 这个模板的名称应该是 do280             <======= 模板的元数据信息中名称部分内容

3. 这个模板默认情况下，所有 openshift 用户都可以直接使用 | 只允许 project app6 的用户使用    <====== 这个模板默认存在的 namespace

4. 这个模板应该包含变量名为 HELLO_TEXT，这个变量的默认值是 hello，并且这个值不是必须的       <====== 这个值，在 参数部分不要写 required

5. 这个模板应该包含合适的 php 与 mysql 镜像 《====== 你自己要去 openshift is 中查找到底哪个 is tag 是可以正常使用的

6. 用户可以使用这个模板创建应用程序，当应用程序创建的时候，应该可以通过 http://xxxxxx.com 访问 <====== 这地方说的是 route 的 hostname

7. 当用户指定源码创建应用时，可以通过 http://yyyyyy.com 访问应用程序 <====== 这地方说的是 route 的 hostname

8. 当用户创建 app 时，如果没有 route hostname 会提示错误