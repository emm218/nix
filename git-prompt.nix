{ stdenv, fetchurl, git }:
let
  version = git.version;
in
stdenv.mkDerivation (finalAttrs: {
  name = "git-prompt";
  inherit version;

  src = fetchurl {
    url = "https://raw.githubusercontent.com/git/git/v${version}/contrib/completion/git-prompt.sh";
    hash = "sha256-8b1O1Oe4iMrV+0SWDqH/qIyzXV4wN6MtltZPt4PrXGY=";
  };

  patches = [ ./git-prompt.patch ];

  unpackPhase = "cp $src git-prompt.sh";

  installPhase = ''
    mkdir $out
    mv git-prompt.sh $out
  '';

  outputs = [ "out" ];
}) 
