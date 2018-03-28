echo "Check npm update"
npm install
echo "Build meta.json"
rm source/meta.json -f
echo '{
	"baseURL": "https://tiagodanin.github.io"
}' > source/meta.json
echo "Fix Jus Ignore"
bash scripts/fixJus.sh
echo "Get Data Github and NPM"
bash scripts/updateData.sh
bash scripts/getProjectsGithub.sh
node scripts/getProjectsNPM.js
echo "Clear old build"
bash scripts/clear.sh
echo "Build with Jus"
npx jus build source .
echo "Copy files"
cp source/images/logo.png images/
cp source/images/github.png images/
cp source/cubohub/links.html cubohub/
echo "Commit"
date=$(date +%D-%H:%M)
git add -A
git commit -S -m "Build in $date"
echo "Done! :)"
