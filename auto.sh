#! /bin/sh

echo "\n****** begin ****** \n"

pod_spec_name="HYUIKit-ios" 
pod_spec_version="0.0.8"
git_commit_des="测试使用脚本shell自动化发布"

echo "\n 执行 pod install ------ \n"
cd Example
pod install

# 回到上级目录
cd ..

echo "\n 执行 git 本地提交代码操作 ------ \n"
# git 操作
git add .
git status
git commit -m ${git_commit_des}

echo "\n 执行 pod 本地校验 ------ \n"
# pod 本地校验
pod lib lint --allow-warnings --verbose

echo "\n 执行 git 打标签tag，并推送到远端 ------ \n"
# git推送到远端
git tag ${pod_spec_version}
git push origin master --tags

echo "\n 执行 pod 远端校验 ------ \n"
# pod 远端校验
pod spec lint --allow-warnings --verbose

echo "\n 执行 pod 发布 ------ \n"
# 发布
pod trunk push --allow-warnings


echo "****** end ******"
