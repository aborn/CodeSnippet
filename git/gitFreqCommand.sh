## 初始化key
ssh-keygen

## 强制回滚到本地的某次历史commit
git reset --hard <commit-hash>
## 远程也进行强制同步
git push -f origin <branch>

## 设置用户名
git config user.name "Aborn Jiang"
git config --global user.name "Aborn Jiang"
git config --global user.email loveaborn@foxmail.com
git config --list
## 设置用户名(只对当前项目有效)，注意切到项目根目录
git config user.name "aborn"
git config user.email loveaborn@foxmail.com

## 三才相关
git config user.name "jiangguobao"
git config user.email jiangguobao@sancaiwulian.com

## 初始化一个空项目到本地git仓库
git init
git add .
git commit -m "Initial commit"
## 删除远程分支
git push origin :<branch_name>            # v1.5+
git push origin --delete <branch_name>    # v1.7+
git branch --delete dev # 删除本地分支

## 与远端关联
git remote add origin <remote-git-url>
git config --get remote.origin.url        # 获得远端git地址
# example: git remote add origin git@code.dianpingoa.com:mobile/knb-ua-kit.git
git push --set-upstream origin master
# 如果与远端有了关联，则直接git pull就好
git pull origin master
# 如果本地已经Commit过，可能会报如下错误：
# fatal: refusing to merge unrelated histories
# 请执行
git pull origin master --allow-unrelated-histories

## 撤销add
git reset <filename>
## reset single file
git checkout HEAD -- my-file.txt
git checkout -- components/TopBar.vue
git reset HEAD~1  ## 撤销上次commit，保留文件的改变，只将指针调到上一次

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

# 当rebase发生冲突时怎么处理?
git rebase master
git add .
git rebase --continue

# pull request  ID为PR的ID
git fetch origin pull/ID/head:BRANCHNAME

# git fetch origin pull/157/head:B157
# git checkout B157

# 查看单个文件的修改历史
git log -p filename

# git 切换到tag
git checkout tag_name
# 注意: tag 相当于是一个快照，是不能更改它的代码的，如果要在 tag 代码的基础上做修改，你需要一个分支：
git checkout -b branch_name tag_name

# git打tag
git tag v0.3.4
# 将tag推送到远端
git push origin v0.3.4
# 显示tag列表
git tag -l
# 删除tag
git tag -d tagName
# 删除远端tag
git push origin :refs/tags/tagName
# 或者
git push --delete origin tagName


## 删除所有commit，仅保留当前文件
# 1. Checkout
git checkout --orphan latest_branch
# 2. Add all the files
git add -A
# 3. Commit the changes
git commit -am "re-init"
# 4. Delete current master branch
git branch -D master
# 5. Rename the current branch to master
git branch -m master
# Finally, force update your repository
git push -f origin master

# 查看commitA到commitB之间的diff
git diff commitA^ commitB
# 查看某一次的commit的diff，下面两个命令都可以实现
git diff commit^
git show commit    # 更优
git diff COMMIT^!  # 某次commit与上一次的差异


# 清理不必要的文件，优化本地Rep
git gc --prune=now
# 删除所有远端在orgin下所有无用的分支
git remote prune origin

# 本地一个文件不再更新到远程，可以达到本地和远程不一样的效果
git update-index --skip-worktree path/to/your/file.txt

# 反向操作
git update-index --no-skip-worktree path

# 删除所有历史 commit，重新 commit
# https://stackoverflow.com/questions/13716658/how-to-delete-all-commit-history-in-github
git checkout --orphan latest_branch
git add -A
git commit -am "init"
git branch -D main
git branch -m main
git push -f origin main

# diff  不显示 + -
git diff --color-words
