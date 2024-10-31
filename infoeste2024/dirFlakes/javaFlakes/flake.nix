{
  description = "Java Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          name = "java-dev-env";
          buildInputs = with pkgs; [
            openjdk17       # JDK 17
            maven           # Sistema de build Maven
            gradle          # Sistema de build Gradle
            emacsPackages.lsp-java          # Servidor LSP para Java (Java Development Tools)
            direnv          # Automatizar a ativação do ambiente
          ];
          shellHook = ''
            echo "Welcome to the Java Development Environment!"
          '';
        };
      }
    );
}
