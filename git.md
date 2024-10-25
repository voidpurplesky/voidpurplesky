https://git-scm.com/book/ko/v2

git branch -M main
git branch (-m | -M) [<oldbranch>] <newbranch>
With a -m or -M option, <oldbranch> will be renamed to <newbranch>. If <oldbranch> had a corresponding reflog, it is renamed to match <newbranch>, and a reflog entry is created to remember the branch renaming. If <newbranch> exists, -M must be used to force the rename to happen.
-m 또는 -M 옵션을 사용하면 <oldbranch>가 <newbranch>로 이름이 변경됩니다. <oldbranch>에 해당 reflog가 있는 경우 <newbranch>와 일치하도록 이름이 변경되고 브랜치 이름 변경을 기억하기 위한 reflog 항목이 생성됩니다. <newbranch>가 있는 경우 -M을 사용하여 이름 변경을 강제로 실행해야 합니다.


gitignore

1. git init
2. git remote add origin https://github.com/voidpurplesky/ex00.git
5. git branch -M main
6. git status
7. git add .
8. git commit -m 'first commit'
9. git push -u origin main