with import <nixpkgs> {}; 
mkShell {
  nativeBuildInputs = [ python3 cmake ];
  shellHook = ''
  source env/bin/activate 
  '';
}
