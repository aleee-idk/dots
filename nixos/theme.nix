{ stdenv, fetchFromGitHub }:
{
  sddm-catppucin-theme = stdenv.mkDerivation rec {
    pname = "sddm-catppucin-theme";
    version = "1";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src/src/* $out/share/sddm/themes/
    '';
    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "sddm";
      rev = "bde6932e1ae0f8fdda76eff5c81ea8d3b7d653c0";
      sha256 = "1lg10dyxgz080qfcp6k3zk6374jlj067s6p5fgx5r135ivy8mrki";
    };
  };
}
