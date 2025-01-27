{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    postgresql
  ];

  virtualisation.docker.enable = true;

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      postgres = {
        image = "postgres:alpine";
        hostname = "postgres";
        ports = [ "127.0.0.1:5432:5432" ];
        environment = {
          POSTGRES_PASSWORD = "mysecretpassword";
        };
      };
      redis = {
        image = "redis:alpine";
        hostname = "redis";
        ports = [ "127.0.0.1:6379:6379" ];
      };
    };
  };

  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIDPTCCAiWgAwIBAgIUECFGeGH1qygXSN9eywI+JqJ/odcwDQYJKoZIhvcNAQEL
      BQAwLjEVMBMGA1UEAwwMbG9jYWxob3N0LWNhMRUwEwYDVQQKDAxsb2NhbGhvc3Qt
      Y2EwHhcNMjQxMTAxMTcxNTUwWhcNMjkxMDMxMTcxNTUwWjAuMRUwEwYDVQQDDAxs
      b2NhbGhvc3QtY2ExFTATBgNVBAoMDGxvY2FsaG9zdC1jYTCCASIwDQYJKoZIhvcN
      AQEBBQADggEPADCCAQoCggEBAKeHs0B1s3iB01NVLTE9JvQycGDGlH/IfR2m+R2D
      Ke1OpDf1BwPhJzAY/dZ7e0aD6JzanYYKXPYDhRFvEsE9DSkdHKJ7Sas8uy93rZDv
      SG3LCFjdXusLa/FTALVqOr7lc82+cwPTLQxS1wTTgK9hqsncoF1iVaktjL3DauJX
      Z4J3GDEydX22gy5vCOMC45fLFn5WB/SNjP3zEzmoAMvaa1quPLnMbJ5gYm/yKmIY
      eYVPOZ+xNLEkH0vg2K9guYAncEBymoHLruDQN2YhTOkMuGXjqQDR1DVnh1kS9S04
      UNT6dFSHaiIKSTAuS/dbZEamqRt6Ujk+drCjNdh6Z7FuoBECAwEAAaNTMFEwHQYD
      VR0OBBYEFLc+vE7Zo03EZIr2AijrAaV9FF6YMB8GA1UdIwQYMBaAFLc+vE7Zo03E
      ZIr2AijrAaV9FF6YMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEB
      AEKYj35c+w+KYUQhYjfoDJH85CapUcXYEogLQUuK16/WvNaFJTFisWv6nujpCWc2
      cj07CK1SmRx/0A2U9L/yK3vIi7BojlFCYJFav1dCiYyFvWmbzh6MaZyMv7IX2XyF
      Hsf3SFV+6B5lt3lCXNwY/OgjgiNcI5cmDbq1HzfWygINKhqhf+xA3D0BnbVr/RwZ
      klXxX6+m5bisg4jQsguD6rCung34DESinCe4zGKUHEw2RwwYJQ9gG1R+/l8Ahjrf
      gR8FsueHiQIMO1cVB3Dt7OsvZhbAYknTJ6vaJ8GnZjE5n1IR1VpbD/o+Yx/zMTEe
      ZEhgwVTwetGCCUVlveJatjs=
      -----END CERTIFICATE-----
    ''
  ];

  environment.variables = {
    DEVCERTS = "$HOME/devtoolset/devcerts";
  };

  programs.nix-ld.enable = true; # For dynamic linked binaries
}
