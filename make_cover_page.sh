#!/bin/bash

COVER_PAGE_DIR="./Cover"
FILE_NAME="cover.pdf"
SYSTEM_FONTS_DIR="$HOME/.local/share/fonts"


check_dependencies() {
    if [ "$(command -v xelatex)" = "" ]; then
        echo "LaTeX is not installed on this system. Aborting script."
        exit 1
    fi
}

install_required_font() {
    if [ "$(fc-list opensans)" = "" ]; then
        # Open Sans is not installed. Download and install
        wget -c --content-disposition 'https://fonts.google.com/download?family=Open%20Sans' -P "$COVER_PAGE_DIR"
        mkdir -p "$SYSTEM_FONTS_DIR"
        unzip -j "$COVER_PAGE_DIR/Open_Sans.zip" -d "$SYSTEM_FONTS_DIR" "*.ttf"

        # Remove the fonts which have "wght" in their name. They make the Latex script fail on Github CI
        ls "$SYSTEM_FONTS_DIR"/*.ttf | grep ',wght.ttf' | xargs rm
    fi
}

generate_cover_page() {
    mkdir -p "$COVER_PAGE_DIR/out" &&
    xelatex -jobname="${FILE_NAME%.*}" --output-directory="$COVER_PAGE_DIR/out" --halt-on-error "$COVER_PAGE_DIR/cover-generator.tex" &&
    mv "$COVER_PAGE_DIR/out/$FILE_NAME" "$COVER_PAGE_DIR"
}

check_dependencies
install_required_font
generate_cover_page
