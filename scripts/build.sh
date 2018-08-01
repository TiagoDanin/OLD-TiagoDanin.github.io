echo "Check npm and git update"
git pull
npm install
echo "Fix Jus Ignore"
bash scripts/fixJus.sh
echo "Get Data Github and NPM"
bash scripts/getProjectsGithub.sh
node scripts/getProjectsNPM.js
echo "Clear old build"
bash scripts/clear.sh
echo "Build with Jus"
npx jus build source .
echo "Commit"
date=$(date +%D-%H:%M)
git add -A
git commit -S -m "Build in $date"
git push
echo "Done! :)"
