bash scripts/fixJus.sh
bash scripts/updateData.sh
bash scripts/getProjectsGithub.sh
node scripts/getProjectsNPM.js
rm -r dist/ -f
npx jus build . dist
cp images/logo.png dist/images/
cp images/github.png dist/images/
cp cubohub/links.html dist/cubohub/
