## 强制回滚到本地的本次历史commit
git reset --hard <commit-hash>
## 远程也进行强制同步
git push -f origin <branch>
## 设置用户名
git config user.name "Aborn Jiang"
git config --global user.name "Aborn Jiang"
git config --list
## 初始化
git init
git add .
git commit -m "Initial commit"
## 与远端关联
git remote add origin <remote-git-url>
# example: git remote add origin git@code.dianpingoa.com:mobile/knb-ua-kit.git
git push --set-upstream origin master
# 如果远端有了，则git pull下
git pull origin master

## 撤销add
git reset <filename>

## github 的pull/request前先同步上流源
## github fork and sync upstream
# 如果没有upstram，添加之
git remote add upstream https://github.com/whoever/whatever.git
# example
git remote add upstream https://github.com/melpa/melpa.git #git@github.com:melpa/melpa.git
# 拉取所有远端，同步之
git fetch upstream
# 切到master
git checkout master
# rebase
git rebase upstream/master

# pull request  ID为PR的ID
git fetch origin pull/ID/head:BRANCHNAME

# git fetch origin pull/157/head:B157
# git checkout B157
