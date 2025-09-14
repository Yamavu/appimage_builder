#!/bin/bash

# https://www.freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-metadata_license

unzip tic80-v1.1-linux-pro

# inflating: tic80

mkdir -p Tic80.AppDir/usr/bin
mkdir -p Tic80.AppDir/usr/share/metainfo

mv tic80 Tic80.AppDir/usr/bin/

ln -s usr/bin/tic80 Tic80.AppDir/AppRun

wget https://user-images.githubusercontent.com/13716824/93653165-a3560b00-fa0f-11ea-880b-550c7184ecbc.png
magick 93653165-a3560b00-fa0f-11ea-880b-550c7184ecbc.png -resize 256x256\! Tic80.AppDir/tic80.png

chmod +x Tic80.AppDir/usr/bin/tic80
chmod +x Tic80.AppDir/AppRun


cat > Tic80.AppDir/Tic80.desktop <<EOL
[Desktop Entry]
Name=Tic80
Exec=tic80
Icon=tic80
Type=Application
Categories=Game;
Comment=TIC-80 is a FREE and OPEN SOURCE fantasy computer for making, playing and sharing tiny games
EOL

cat > Tic80.AppDir/usr/share/metainfo/com.tic80.appdata.xml <<EOL
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.tic80.desktop</id>
  <name>Tic-80</name>
  <summary>TIC-80 is a FREE and OPEN SOURCE fantasy computer for making, playing and sharing tiny games</summary>
  <description>
    <p>Tic-80 is a fantasy console for creating, sharing and playing small games and programs. It features a custom code editor, sprite editor, map editor, sound editor and more.</p>
  </description>
  <developer_name>Nesbox</developer_name>
  <launchable type="desktop-id">Tic80.desktop</launchable>
  <icon type="stock">tic80</icon>
  <url type="homepage">https://github.com/nesbox/TIC-80</url>
  <url type="homepage">https://tic80.com/</url>
  <provides>
    <binary>tic80</binary>
  </provides>
  <categories>
    <category>Game</category>
    <category>Development</category>
  </categories>
  <metadata_license>MIT</metadata_license>
  <content_rating type="oars-1.1" />
</component>
EOL

wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x ./appimagetool-x86_64.AppImage

ARCH=x86_64
./appimagetool-x86_64.AppImage Tic80.AppDir/ Tic80-v1.1-pro-x86_64.AppImage
