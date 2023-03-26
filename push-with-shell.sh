#!/bin/sh

branch_file=".last_branch"

if [ -f "$branch_file" ]; then
  branch=$(cat "$branch_file")
else
  # prompt the user to enter the branch name
  echo "Please enter the branch name:"
  read branch
  # save the branch name to the branch file
  echo "$branch" > "$branch_file"
fi

echo "Please choose a commit message:"
echo "1) Fixing bugs"
echo "2) Adding new feature"
echo "3) Refactoring code"
echo "4) Custom"
read choice

case $choice in
  1) commit_message="Fixing bugs";;
  2) commit_message="Adding new feature";;
  3) commit_message="Refactoring code";;
  4) echo "Please enter a commit message:"; read commit_message;;
  *) echo "Invalid choice"; exit 1;;
esac

git add .
git commit -m "$commit_message"

read -r -p "Sync Changes?[Y/n]" input
case $input in
    [yY][eE][sS]|[yY])
        echo "Syncing..."
        git pull origin $branch
        git push origin $branch
        ;;
    [nN][oO]|[nN])
        echo "Exit"
        exit 1
        ;;
    *)
        echo "Invalid input"
        exit 1
        ;;
esac

echo "$branch" > "$branch_file"