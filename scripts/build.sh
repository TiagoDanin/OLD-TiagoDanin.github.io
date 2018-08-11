echo "Git pull"
git pull
echo "Fix Jus Ignore"
bash scripts/fixJus.sh
echo "Get Data Github and NPM"
bash scripts/getProjectsGithub.sh
node scripts/getProjectsNPM.js
echo "Clear old build"
bash scripts/clear.sh
cp source/cubohub/links.html cubohub/ -f
echo "Build with Jus"
npx jus build source .
echo "Commit"
date=$(date +%D-%H:%M)
git add -A
git commit -S -m "Build in $date"
git push
echo "Done! :)"
