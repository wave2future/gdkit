chmod 777 scripts/echo-plist-node.rb
chmod 777 scripts/update-plist-node.rb
CURDIR=`pwd`
DEST=archives/
APP_SHORT_NAME=${PROJECT}
APP=${APP_SHORT_NAME}.app
VERSION=`./scripts/echo-plist-node.rb Info.plist CFBundleShortVersionString`
BUILD_VERSION=`./scripts/echo-plist-node.rb Info.plist CFBundleVersion`
VERSION=${VERSION}.${BUILD_VERSION}
DYSM="${APP}.dSYM"
DYSM_FILE="${APP}.${VERSION}.dSYM"
WRAPPER="${APP_SHORT_NAME}.${VERSION}+dYSM"
ZIPNAME="${WRAPPER}.zip"
cd $DEST
mkdir -p "$WRAPPER"
cp -Rpf ${TARGET_BUILD_DIR}/${APP} "${WRAPPER}/${APP}"
cp -Rpf ${TARGET_BUILD_DIR}/${DYSM} "${WRAPPER}/${DYSM_FILE}"
#zip -r9o "$ZIPNAME" "${WRAPPER}/${APP}" "${WRAPPER}/${DYSM_FILE}"
ditto -cj --keepParent ${WRAPPER} $ZIPNAME
rm -rf "$WRAPPER"
cd $CURDIR