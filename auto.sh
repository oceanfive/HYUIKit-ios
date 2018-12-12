#! /bin/sh

echo "\n****** begin ****** \n"

pod_spec_name="HYUIKit-ios" 
pod_spec_version="0.0.11"
git_commit_des="使用脚本shell自动化发布测试"


echo "\n 执行 pod install ------ \n"


echo "cd Example"
cd Example
echo "pod install"
pod install

# 回到上级目录
echo "cd .."
cd ..


echo "\n 执行 git 本地提交代码操作 ------ \n"
# git 操作
echo "git add ."
git add .
echo "git status"
git status
echo "git commit -m ${git_commit_des}"
git commit -m ${git_commit_des}


echo "\n 执行 pod 本地校验 ------ \n"
# pod 本地校验
echo "pod lib lint --allow-warnings --verbose"
pod lib lint --allow-warnings --verbose


echo "\n 执行 git 打标签tag，并推送到远端 ------ \n"
# git推送到远端
echo "git tag ${pod_spec_version}"
git tag ${pod_spec_version}
echo "git push origin master --tags"
git push origin master --tags


echo "\n 执行 pod 远端校验 ------ \n"
# pod 远端校验
echo "pod spec lint --allow-warnings --verbose"
pod spec lint --allow-warnings --verbose

echo "\n 执行 pod 发布 ------ \n"
# 发布
echo "pod trunk push --allow-warnings"
pod trunk push --allow-warnings


echo "\n****** end ******\n"
