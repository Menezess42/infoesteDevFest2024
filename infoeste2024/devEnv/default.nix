{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "python-data-science-env";

  # Lista de pacotes Python para Data Science
  buildInputs = with pkgs; [
ruby
];

  # Opcional: variáveis de ambiente adicionais
  shellHook = ''
    echo "Bem-vindo ao ambiente Python para Data Science!"
  '';
}

