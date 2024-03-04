#!/bin/bash

# Função para limpar a tela
clear_screen() {
    printf "\033c"
}

# Função para criar a estrutura inicial do projeto
create_project_structure() {
    clear_screen
    echo "======================="
    echo "Criando estrutura inicial do projeto..."
    echo "======================="

    # Solicitar o nome do projeto
    read -p "1 - Qual o nome do projeto? (sem espaços ou caracteres especiais): " project_name

    # Validar o nome do projeto
    if [[ ! "$project_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo "Nome de projeto inválido. Deve conter apenas letras, números, '-' ou '_'"
        exit 1
    fi

    # Criar diretório do projeto
    mkdir "$project_name" && cd "$project_name"

    # Clonar o repositório com a estrutura base do projeto
    git clone https://github.com/seu-usuario/repo-base .

    # Remover o diretório .git
    rm -rf .git

    # Instalar as dependências do projeto base
    yarn install
}

# Função para escolher a arquitetura
choose_architecture() {
    clear_screen
    echo "======================="
    echo "Escolha a arquitetura:"
    echo "======================="
    echo "1. Clean Architecture"
    echo "2. Layer Architecture"
    read -p "Digite o número correspondente à sua escolha: " architecture_choice

    case $architecture_choice in
    1)
        # Clonar repositório da Clean Architecture
        git clone https://github.com/seu-usuario/clean-architecture .
        ;;
    2)
        # Clonar repositório da Layer Architecture
        git clone https://github.com/seu-usuario/layer-architecture .
        ;;
    *)
        echo "Opção inválida. Escolha 1 ou 2."
        exit 1
        ;;
    esac
}

# Função principal
main() {
    create_project_structure
    choose_architecture
}

# Executar a função principal
main