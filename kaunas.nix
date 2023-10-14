{ stdenv, fetchFromGitHub }: 
stdenv.mkDerivation (finalAttrs: {
    pname = "Kaunas";
    version = "1.0.1";

    src = fetchFromGitHub {
        owner = "Dovias";
        repo = finalAttrs.pname;
        rev = "${finalAttrs.version}";
        hash = "sha256-tWSU0XnjrAbGPcbxu+BK8Djv62yLLwqhK+sVrE52xpk=";
    };

    outputs = [ "out" ];

    installPhase = ''
        runHook preInstall
        mkdir -p $out/share/themes/${finalAttrs.pname}
        cp -r openbox-3 $out/share/themes/${finalAttrs.pname}/openbox-3
        runHook postInstall
    '';
})
