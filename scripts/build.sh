bash scripts/fixJus.sh
bash scripts/updateData.sh
bash scripts/getProjectsGithub.sh
node scripts/getProjectsNPM.js
bash scripts/clear.sh
npx jus build . dist
cp source/images/logo.png images/
cp source/images/github.png images/
cp source/cubohub/links.html cubohub/
