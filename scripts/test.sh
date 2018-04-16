echo "Build meta.json"
rm source/meta.json -f
echo '{
	"baseURL": ""
}' > source/meta.json
echo "Fix Jus Ignore"
bash scripts/fixJus.sh
echo "Get Data Github and NPM"
bash scripts/updateData.sh
bash scripts/getProjectsGithub.sh
node scripts/getProjectsNPM.js
echo "Start with jus"
npx jus server source
