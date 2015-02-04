set -e

LIB_VERSION="$1"

git pull --rebase

npm run minify

sed -E "s/.+version.+/  \"version\": \"$LIB_VERSION\",/" bower.json > bower.json.tmp && mv bower.json.tmp bower.json
sed -E "s/999\.999\.999/$LIB_VERSION/" dist/lightning.min.js > dist/lightning.min.js.tmp && mv dist/lightning.min.js.tmp dist/lightning.min.js

git add .
git commit -m "Release $LIB_VERSION"
git push
git tag -a $LIB_VERSION -m "$LIB_VERSION"
git push --tags
