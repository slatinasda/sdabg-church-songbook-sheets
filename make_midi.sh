#!/bin/bash

INTROS_SOURCE_DIR="./MIDIs/Intros/Source"
INTROS_MIDI_OUTPUT_DIR="./MIDIs/Intros"
SONGS_SOURCE_DIR="./MIDIs/Songs/Source"
SONGS_MIDI_OUTPUT_DIR="./MIDIs/Songs"
MUSESCORE_EXECUTABLE="$1"

show_help() {
cat <<'EOF'
Usage: make_midi.sh <MUSESCORE_EXECUTABLE>
Generate MIDI files from the MSCZ source files.

Dependencies:
- MuseScore 3.5+
EOF
}

check_dependencies() {
    if [ ! -f "$MUSESCORE_EXECUTABLE" ]; then
        echo "Could not find MuseScore executable. Aborting script."
        show_help
        exit 1
    fi
}

generate_intros_midi() {
    for file in "$INTROS_SOURCE_DIR/"*.mscz; do
        if [ ! -f "$file" ]; then
            echo "Missing file: $file"
            continue
        fi

        "$MUSESCORE_EXECUTABLE" "$file" -o "$INTROS_MIDI_OUTPUT_DIR/$(basename "${file%.mscz}").mid" || exit 1
    done
}

generate_songs_midi() {
    for file in "$SONGS_SOURCE_DIR/"*.mscz; do
        if [ ! -f "$file" ]; then
            echo "Missing file: $file"
            continue
        fi

        "$MUSESCORE_EXECUTABLE" "$file" -o "$SONGS_MIDI_OUTPUT_DIR/$(basename "${file%.mscz}").mid" || exit 1
    done
}

main() {
    check_dependencies
    generate_intros_midi
    generate_songs_midi
}

main
