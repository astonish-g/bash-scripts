#/bin/bash

# If the download fails, then you will have to change the Blender download link to the updated one.

# Function to display ASCII art
display_hello() {
	cat << "EOF"
  ____  _     _____ _   _ ____  _____ ____  
 | __ )| |   | ____| \ | |  _ \| ____|  _ \ 
 |  _ \| |   |  _| |  \| | | | |  _| | |_) |
 | |_) | |___| |___| |\  | |_| | |___|  _ < 
 |____/|_____|_____|_| \_|____/|_____|_| \_\
                                            
EOF
}

#Display ASCII art
display_hello

echo "Hello, now we will install blender to your computer."
echo
echo "Sit behind, and enjoy."
echo

# Download Blender
curl https://ftp.halifax.rwth-aachen.de/blender/release/Blender4.0/blender-4.0.2-linux-x64.tar.xz > $HOME/Downloads/blender.tar.xz &&

# Extract Blender
mkdir -p $HOME/.local/share/apps/ &&
cd $HOME/Downloads/ &&
tar -xvf blender.tar.xz -C $HOME/.local/share/apps &&

# Create a blender.desktop file
<<EOF>> $HOME/.local/share/applications/blender.desktop cat
[Desktop Entry]
Name=Blender
GenericName=3D Modeler
Comment=3D modeling, animation, rendering and post-production
Keywords=3d;modeling;rendering;
Exec=$HOME/.local/share/apps/blender-4.0.2-linux-x64/blender
Icon=$HOME/.local/share/apps/blender-4.0.2-linux-x64/blender.svg
Terminal=false
Type=Application
PrefersNonDefaultGPU=true
X-KDE-RunOnDiscreteGpu=true
Categories=Graphics;3DGraphics;
MimeType=application/x-blender;
EOF

# Installation complete -hopefully-
echo
echo "Installation has completed, enjoy using the Blender!"
echo "See you! :-)"