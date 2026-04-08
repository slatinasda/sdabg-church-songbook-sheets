#!/bin/bash

COVER_PAGE_DIR="./Cover"
FILE_NAME="cover.pdf"


check_dependencies() {
    if [ "$(command -v xelatex)" = "" ]; then
        echo "LaTeX is not installed on this system. Aborting script."
        exit 1
    fi
}

generate_cover_page() {
    mkdir -p "$COVER_PAGE_DIR/out" &&
    xelatex -jobname="${FILE_NAME%.*}" --output-directory="$COVER_PAGE_DIR/out" --halt-on-error "$COVER_PAGE_DIR/cover-generator.tex" &&
    mv "$COVER_PAGE_DIR/out/$FILE_NAME" "$COVER_PAGE_DIR"
}

check_dependencies
generate_cover_page
