{
  pkgs,
  lib,
  stdenvNoCC,
  themeConfig ? null,
}:
stdenvNoCC.mkDerivation rec {
  pname = "tokyo-night-sddm-qt6";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "xaknick";
    repo = "tokyo-night-sddm-qt6";
    rev = "2054f60e88fe8ac78c3e6f2e5beb33c51cea6a45";
    hash = "sha256-wm2hSX/8SsUEnle3euqtSg6y0oQnJoe38DX7HmNozfU=";
  };

  dontWrapQtApps = true;
  propagatedBuildInputs = with pkgs.kdePackages; [
    qt5compat
    qtsvg
    qtvirtualkeyboard
  ];

  installPhase =
    let
      iniFormat = pkgs.formats.ini { };
      configFile = iniFormat.generate "" { General = themeConfig; };

      basePath = "$out/share/sddm/themes/tokyo-night-sddm-qt6";
    in
    ''
      mkdir -p ${basePath}
      cp -r $src/* ${basePath}
    ''
    + lib.optionalString (themeConfig != null) ''
      ln -sf ${configFile} ${basePath}/theme.conf.user
    '';

  meta = {
    description = "Modern looking qt6 sddm theme";
    homepage = "https://github.com/${src.owner}/${src.repo}";
    license = lib.licenses.gpl3;

    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ xaknick ];
  };
}
