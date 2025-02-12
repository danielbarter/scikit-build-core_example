with import <nixpkgs> {}; 
mkShell {
  nativeBuildInputs = [ python3 cmake python3.pkgs.pybind11 ];
  shellHook = ''
  source env/bin/activate 
  '';
}
