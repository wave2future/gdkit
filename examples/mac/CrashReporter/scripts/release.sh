chmod 777 scripts/echo-plist-node.rb
chmod 777 scripts/update-plist-node.rb
CURDIR=`pwd`
DEST=release/
APP_SHORT_NAME=${PROJECT}
APP=${APP_SHORT_NAME}.app
VERSION=`./scripts/echo-plist-node.rb Info.plist CFBundleShortVersionString`
BUILD_VERSION=`./scripts/echo-plist-node.rb Info.plist CFBundleVersion`
VERSION=${VERSION}.${BUILD_VERSION}
ARCHIVE_FILENAME_NGIT="$APP_SHORT_NAME $VERSION.zip"
ARCHIVE_IN_DEST=${DEST}/${ARCHIVE_FILENAME_NGIT}
ditto -ck --keepParent "${BUILT_PRODUCTS_DIR}/$APP" "${DEST}/${ARCHIVE_FILENAME_NGIT}"