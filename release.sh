set -e

LIB_VERSION="$1"

git pull --rebase

npm run minify

sed -E "s/.+version.+/  \"version\": \"$LIB_VERSION\",/" bower.json > bower.json.tmp && mv bower.json.tmp bower.json
sed -E "s/999\.999\.999/$LIB_VERSION/" dist/vortex.min.js > dist/vortex.min.js.tmp && mv dist/vortex.min.js.tmp dist/vortex.min.js

git add .
git commit -m "Release $LIB_VERSION"
git push
git tag -a $LIB_VERSION -m "$LIB_VERSION"
git push --tags
