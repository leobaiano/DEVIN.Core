#!/bin/sh

clear_screen() {
    printf "\033c"
}

create_basic_structure_project() {
    clear_screen

    LANGUAGE=(gum choose "NodeJS" "Python")
    echo -e "Well, it is nice to meet you, $(gum style --foreground 212 "$LANGUAGE")."
}

main() {
    create_basic_structure_project
}

main

