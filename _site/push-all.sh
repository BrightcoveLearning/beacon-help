setopt localoptions rmstarsilent
rm -f _site/feed.xml
bold=`tput bold`
normal=`tput sgr0`
echo "Enter your ${bold}COMMIT MESSAGE${normal}:"
read COMMITMESSAGE 
git pull
./push-s.sh
git add .
git commit -m '$COMMITMESSAGE'
git push
git submodule foreach "git fetch origin main"
git submodule foreach "git checkout main ; git pull ; git add . ; git commit -m '$COMMITMESSAGE' ; git push"