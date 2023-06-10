{ lib, stdenvNoCC, fetchzip }:

stdenvNoCC.mkDerivation rec {
  pname = "segoe-fluent-icons-font";
  version = "1.0";

  src = fetchzip {
    url = "https://download.microsoft.com/download/8/f/c/8fc7cbc3-177e-4a22-af48-2a85e1c5bffb/Segoe-Fluent-Icons.zip";
    stripRoot = false;
    hash = "sha256-MgwkgbVN8vZdZAFwG+CVYu5igkzNcg4DKLInOL1ES9A=";
  };

  # only extract the variable font because everything else is a duplicate
  installPhase = ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://learn.microsoft.com/en-us/windows/apps/design/style/segoe-fluent-icons-font";
    description = "Icons font used by Microsoft on Windows 11";
    platforms = platforms.all;
  };
}