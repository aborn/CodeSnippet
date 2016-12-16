# 更换homebrew源
# https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/

cd "$(brew --repo)"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
# git remote set-url origin http://mirrors.ustc.edu.cn/homebrew.git
# git remote set-url origin git://mirrors.tuna.tsinghua.edu.cn/homebrew.git

cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

brew update
