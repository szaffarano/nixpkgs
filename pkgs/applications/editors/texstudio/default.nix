{ lib, mkDerivation, fetchFromGitHub, qmake, qtbase, qtscript, qtsvg,
  wrapQtAppsHook, poppler, zlib, pkg-config }:

mkDerivation rec {
  pname = "texstudio";
  version = "4.0.0";

  src = fetchFromGitHub {
    owner = "${pname}-org";
    repo = pname;
    rev = version;
    sha256 = "0fapgc6dvzn47gmhxkqymwi3818rdiag33ml57j2mfmsi5pjxi0f";
  };

  nativeBuildInputs = [ qmake wrapQtAppsHook pkg-config ];
  buildInputs = [ qtbase qtscript qtsvg poppler zlib ];

  qmakeFlags = [ "NO_APPDATA=True" ];

  meta = with lib; {
    description = "TeX and LaTeX editor";
    longDescription=''
      Fork of TeXMaker, this editor is a full fledged IDE for
      LaTeX editing with completion, structure viewer, preview,
      spell checking and support of any compilation chain.
    '';
    homepage = "https://texstudio.org";
    changelog = "https://github.com/texstudio-org/texstudio/blob/${version}/utilities/manual/CHANGELOG.txt";
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ ajs124 cfouche ];
  };
}
