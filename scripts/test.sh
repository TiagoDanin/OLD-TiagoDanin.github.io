echo "Build meta.json"
rm source/meta.json -f
echo '{
	"baseURL": ""
}' > source/meta.json
echo "Start jus"
npx jus server source
