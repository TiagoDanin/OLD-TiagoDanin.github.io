echo "Git pull"
git pull
echo "Get Data Github and NPM"
node scripts/getProjectsGithub.js
node scripts/getProjectsNPM.js
echo "Clear old build"
bash scripts/clear.sh
echo "Build with Jus"
yarn jus-lite build source .
cp source/cubohub/links.html cubohub/ -f
echo "Commit"
date=$(date +%D-%H:%M)
git add -A
git commit -S -m "chore: Build in $date"
git push
echo "Done! :)"
