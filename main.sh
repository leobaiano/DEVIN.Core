#!/bin/sh

create_basic_structure_project() {
    clear

    echo "Choose the service language?"
    LANGUAGE=$(gum choose "NodeJS" "Python")
    clear

    echo "What is the name of the service?"
    PROJECT_NAME=$(gum input --placeholder "project_name")

    mkdir "$PROJECT_NAME" && cd "$PROJECT_NAME"
}

main() {
    create_basic_structure_project
}

main

