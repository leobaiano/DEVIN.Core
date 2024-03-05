#!/bin/sh

create_basic_structure_project() {
    clear

    echo "Choose the service language?"
    LANGUAGE=$(gum choose "nodejs" "python")
    clear

    echo "What is the name of the service?"
    PROJECT_NAME=$(gum input --placeholder "project_name")
    clear;

    echo "Please wait while we create the base structure of the project..."

    mkdir "$PROJECT_NAME" && cd "$PROJECT_NAME"
    git clone git@github.com:leobaiano/DEVIN.BaseStructure.git .

    if [ -d "$LANGUAGE" ]; then
        cp -r templates/${LANGUAGE}/* .

        rm -rf templates
    else
        echo "An error code '#cpbs' occurred, contact the project maintainers or open an issue"
    fi

    if ["$LANGUAGE" == "nodejs"]; then
        yarn install
    fi

    clear;

    echo "Base structure created successfully!"
    sleep 1

    echo "What architecture?"
    LANGUAGE=$(gum choose "Layer Architecture" "Clean Architecture")
    clear
}

main() {
    create_basic_structure_project
}

main

