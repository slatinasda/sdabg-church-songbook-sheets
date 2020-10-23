#!/bin/bash

SOURCE_FILES_DIR="./MSCZs"
OUTPUT_PDF_FILES_DIR="./PDFs"
MUSESCORE_EXECUTABLE="$1"

show_help() {
cat <<'EOF'
Usage: make_book.sh <MUSESCORE_EXECUTABLE>
Generate a PDF book from the MSCZ source files.

Dependencies:
- MuseScore 3.5+
- Ghostscript 9.26+
EOF
}

check_dependencies() {
    if [ ! -f "$MUSESCORE_EXECUTABLE" ]; then
        echo "Could not find MuseScore executable. Aborting script."
        show_help
        exit 1
    fi

    if [ "$(command -v gs)" = "" ]; then
        echo "Ghostscript is not installed on this system. Aborting script."
        show_help
        exit 1
    fi
}

create_output_pdfs_dir() {
    mkdir -p "$OUTPUT_PDF_FILES_DIR"
}

generate_pdfs() {
    local missing_songs=()
    for song_number in {1..300}; do
        if [ ! -f "$OUTPUT_PDF_FILES_DIR/${song_number}.pdf" ]; then
            missing_songs+=("$song_number")
        fi
    done

    for missing_song_number in "${missing_songs[@]}"; do
        "$MUSESCORE_EXECUTABLE" "$SOURCE_FILES_DIR/${missing_song_number}.mscz" -o "$OUTPUT_PDF_FILES_DIR/${missing_song_number}.pdf" || exit 1
    done
}

assemble_pdfs_in_book() {
    # https://linoxide.com/linux-how-to/merge-pdf-files-linux/
    (cd "$OUTPUT_PDF_FILES_DIR" && gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE="Church Songbook.pdf" -dBATCH {1..300}.pdf)
    mv "$OUTPUT_PDF_FILES_DIR/Church Songbook.pdf" ./
    echo "The songbook has been successfully generated!"
}

main() {
    check_dependencies
    create_output_pdfs_dir
    generate_pdfs
    assemble_pdfs_in_book
}

main
