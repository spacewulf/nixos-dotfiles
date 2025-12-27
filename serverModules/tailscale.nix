{ config, lib, pkgs, ... }:
{
  services.tailscale = {
    enable = true;
    authKeyFile = "/run/secrets/tailscale-preauthkey";
    extraUpFlags = [
      "--login-server=https://headscale.keesnas.com"
    ];
  };
}
