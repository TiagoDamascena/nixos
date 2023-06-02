{
  lib,
  stdenv,
  fetchFromGitHub,
  wrapQtAppsHook,
  qtquickcontrols2,
  qtgraphicaleffects,
  qtsvg
}:

stdenv.mkDerivation rec {
  pname = "sddm-sugar-catppuccin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "TiagoDamascena";
    repo = "sddm-sugar-catppuccin";
    rev = "1.0.0";
    sha256 = "244ade93d2c8954bcbc5f2adad71d60272b339670615613b454fbf2c00b5c8ed";
  };

  propagatedUserEnvPkgs = [
    qtgraphicaleffects
    qtsvg
  ];

  nativeBuildInputs = [ wrapQtAppsHook ];

  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/sddm/themes/sugar-catppuccin
    cp -r * $out/share/sddm/themes/sugar-catppuccin/
  '';

  meta = with lib; {
    description = "Catppuccin SDDM theme";
    homepage = "https://github.com/TiagoDamascena/sddm-sugar-catppuccin";
    license = licenses.gpl3Only;
    platforms = platforms.all;
  }; 
}
