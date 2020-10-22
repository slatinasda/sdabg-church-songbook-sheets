# Adventist songbook sheets

This repository contains a collection of essential [Seventh-day Adventist](https://adventist.org) church songs.
The sheet music in this repository were created with [MuseScore](https://musescore.org).


## Dependecies

- Linux
- MuseScore 3.5+
- Ghostscript 9.26+


## Generate a PDF book

### Instructions

1. Grab a MuseScore executable

    - Head over to https://musescore.org/ and dowload the MuseScore AppImage.

    - **Note:** the sheets were originally created with MuseScore 3.5. If you have trouble generating sheets with newer versions of MuseScore, download a MuseScore 3.5 AppImage from here:
    - https://github.com/musescore/MuseScore/releases/tag/v3.5.1

2. Run the book generation script

    ```
    ./make_book.sh /path/to/MuseScore.AppImage
    ```

    The generated PDF Songbook is located in the root folder of this project.


## Generate MIDI files

### Instructions

1. Grab a MuseScore executable

2. Run the script to generate MIDI files

    ```
    ./make_midi.sh /path/to/MuseScore.AppImage
    ```

    The generated MIDI files are located in the `MIDIs` folder.


## Software

Learn more about the software that was used to create those sheets:

- MuseScore
    - https://musescore.org/
    - https://github.com/musescore/
