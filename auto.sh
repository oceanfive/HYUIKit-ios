#! /bin/sh

echo "****** begin ******"

pod_spec_name="HYUIKit-ios" 
pod_spec_version="0.0.6"
git_commit_des="测试自动化"

cd Example
pod install

# 回到上级目录
cd ..

# git 操作
git add .
git status
git commit -m ${git_commit_des}

# pod 本地校验
pod lib lint --allow-warnings --verbose

# git推送到远端
git tag ${pod_spec_version}
git push origin master --tags

# pod 远端校验
pod spec lint --allow-warnings --verbose

# 发布
pod trunk push --allow-warnings


echo "****** end ******"
