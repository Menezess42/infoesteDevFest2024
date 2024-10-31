{
  description = "C/C++ Development Environment";

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
          name = "cpp-dev-env";
          buildInputs = with pkgs; [
            gcc              # Compilador GCC
            clang            # Compilador Clang
            cmake            # Sistema de build CMake
            ninja            # Sistema de build Ninja
            gdb              # Depurador GDB
            valgrind         # Ferramenta de análise de memória
            ccls             # Servidor LSP para C/C++
            direnv           # Automatizar a ativação do ambiente
          ];
          shellHook = ''
            echo "Welcome to the C/C++ Development Environment!"
          '';
        };
      }
    );
}

