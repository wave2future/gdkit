DOWNLOAD_BASE_URL="http://sparkle.macendeavor.com/gity/download/"
RELEASENOTES_URL="http://static.macendeavor.com/support/gity/releasenotes.html"

chmod 777 scripts/echo-plist-node.rb
chmod 777 scripts/update-plist-node.rb
CURDIR=`pwd`

APP_SHORT_NAME=${PROJECT}
APP=${APP_SHORT_NAME}.app
VERSION=`./scripts/echo-plist-node.rb Info.plist CFBundleShortVersionString`
BUILD_VERSION=`./scripts/echo-plist-node.rb Info.plist CFBundleVersion`
VERSION=${VERSION}.${BUILD_VERSION}

DEST=release/
APPCAST="sparkle/appcast ${VERSION}.xml"
ARCHIVE_FILENAME_NGIT="$APP_SHORT_NAME $VERSION.zip"
ARCHIVE_IN_DEST=${DEST}/${ARCHIVE_FILENAME_NGIT}
DOWNLOAD_URL="${DOWNLOAD_BASE_URL}${ARCHIVE_FILENAME_NGIT}"
PRIVATE_KEY=${SRCROOT}/sparkle/dsa_priv.pem

SIZE=$(stat -f %z "$ARCHIVE_IN_DEST")
PUBDATE=$(date +"%a, %d %b %G %T %z")
SIGNATURE=$(openssl dgst -sha1 -binary < "$ARCHIVE_IN_DEST" | openssl dgst -dss1 -sign $PRIVATE_KEY | openssl enc -base64)

cat > $APPCAST <<EOF
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle"  xmlns:dc="http://purl.org/dc/elements/1.1/">
<channel>
	<title>$APP Changelog</title>
	<link>http://sparkle.macendeavor.com/gity/appcast.xml</link>
	<description>Most recent changes with links to updates.</description>
	<language>en</language>
	<item>
		<title>Version $VERSION</title>
		<pubDate>$PUBDATE</pubDate>
		<sparkle:releaseNotesLink>$RELEASENOTES_URL</sparkle:releaseNotesLink>
		<enclosure 
			url="$DOWNLOAD_URL"
			sparkle:version="$BUILD_VERSION"
			sparkle:shortVersionString="$VERSION"
			type="application/octet-stream"
			length="$SIZE"
			sparkle:dsaSignature="$SIGNATURE"
		/>
	</item>
</channel>
</rss>
EOF
