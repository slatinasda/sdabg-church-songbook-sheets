# Adventist songbook sheets

[![Build workflow](https://github.com/slatinasda/sdabg-church-songbook-sheets/workflows/Build/badge.svg)](https://github.com/slatinasda/sdabg-church-songbook-sheets/actions)

This repository contains a collection of essential [Seventh-day Adventist](https://adventist.org) church songs.
The sheet music in this repository were created with [MuseScore](https://musescore.org).


## Dependecies

- Linux
- MuseScore 3.6+
- Ghostscript 9.26+


## Generate a PDF book

### Instructions

1. Grab a MuseScore executable

    - Head over to https://musescore.org/ and dowload the MuseScore AppImage.

    - **Note:** the sheets were created with MuseScore 3.6. If you have trouble generating sheets with newer versions of MuseScore, download a MuseScore 3.6 AppImage from here:
    - https://github.com/musescore/MuseScore/releases/tag/v3.6

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


## Download CI Artifacts

You can download the generated PDF book and MIDI files through the Github Actions CI:

1. Click on the [Actions tab](https://github.com/slatinasda/sdabg-church-songbook-sheets/actions)

2. Open the latest successful build

3. Download the zip files located under the **Artifacts** section


## Software

Learn more about the software that was used to create those sheets:

- MuseScore
    - https://musescore.org/
    - https://github.com/musescore/
