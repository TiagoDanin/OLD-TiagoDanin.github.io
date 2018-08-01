echo "Get Data Github and NPM"
bash scripts/updateData.sh
bash scripts/getProjectsGithub.sh
node scripts/getProjectsNPM.js
echo "Start with jus"
npx jus server source
