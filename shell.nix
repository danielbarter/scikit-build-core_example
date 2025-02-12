with import <nixpkgs> {}; 
mkShell {
  nativeBuildInputs = [ python3 ];
  shellHook = ''
  source env/bin/activate 
  '';
}
