#!/usr/bin/env bash

set -e

export stm="f0 f1 f4 l4 g0"

for i in $stm; do
    rm -rf "$i"

    git clone "ssh://aur@aur.archlinux.org/stm32${i}-headers-git.git" "$i"

    cat <<EOF > "$i/PKGBUILD"
#Maintainer: Sam Bazley <sambazley@fastmail.com>
dev=${i^^}
EOF

    cat PKGBUILD >> "$i/PKGBUILD"

    cd "$i"
    makepkg

    makepkg --printsrcinfo > .SRCINFO

    cd ..
done
