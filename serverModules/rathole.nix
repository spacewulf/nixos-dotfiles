{ config, lib, pkgs, ... }: 

{
  services.rathole = {
      enable = true;
      role = "client";
      settings = {
        client = {
            remote_addr = "100.64.0.1:2333";
            default_token = "WX7$XuY@vjAa#7jn&yU7ivXq4B35zd$Y";
            services = {
              giteaSSH = {
                type = "tcp";
                local_addr = "10.1.0.25:222";
                };
              pterodactylSftp = {
                type = "tcp";
                local_addr = "10.1.0.27:2022";
                };
              mailSMTP = {
                type = "tcp";
                local_addr = "10.1.0.9:25";
                };
              mailSMTPS = {
                type = "tcp";
                local_addr = "10.1.0.9:465";
                };
              mailSubmission = {
                type = "tcp";
                local_addr = "10.1.0.9:587";
                };
              mailIMAP = {
                type = "tcp";
                local_addr = "10.1.0.9:143";
                };
              mailIMAPS = {
                type = "tcp";
                local_addr = "10.1.0.9:993";
                };
              mailPOP = {
                type = "tcp";
                local_addr = "10.1.0.9:110";
                };
              mailPOPS = {
                type = "tcp";
                local_addr = "10.1.0.9:995";
                };
              mailSIEVE = {
                type = "tcp";
                local_addr = "10.1.0.9:4190";
                };
              minecraftTCP25565 = {
                type = "tcp";
                local_addr = "10.1.0.27:25565";
                };
              minecraftUDP25565 = {
                type = "udp";
                local_addr = "10.1.0.27:25565";
                };
              minecraftTCP25566 = {
                type = "tcp";
                local_addr = "10.1.0.27:25566";
                };
              minecraftUDP25566 = {
                type = "udp";
                local_addr = "10.1.0.27:25566";
                };
              minecraftTCP25567 = {
                type = "tcp";
                local_addr = "10.1.0.27:25567";
                };
              minecraftUDP25567 = {
                type = "udp";
                local_addr = "10.1.0.27:25567";
                };
              minecraftTCP25568 = {
                type = "tcp";
                local_addr = "10.1.0.27:25568";
                };
              minecraftUDP25568 = {
                type = "udp";
                local_addr = "10.1.0.27:25568";
                };
              minecraftTCP25569 = {
                type = "tcp";
                local_addr = "10.1.0.27:25569";
                };
              minecraftUDP25569 = {
                type = "udp";
                local_addr = "10.1.0.27:25569";
                };
              minecraftTCP25570 = {
                type = "tcp";
                local_addr = "10.1.0.27:25570";
                };
              minecraftUDP25570 = {
                type = "udp";
                local_addr = "10.1.0.27:25570";
                };
              minecraftTCP25571 = {
                type = "tcp";
                local_addr = "10.1.0.27:25571";
                };
              minecraftUDP25571 = {
                type = "udp";
                local_addr = "10.1.0.27:25571";
                };
              minecraftTCP25572 = {
                type = "tcp";
                local_addr = "10.1.0.27:25572";
                };
              minecraftUDP25572 = {
                type = "udp";
                local_addr = "10.1.0.27:25572";
                };
              minecraftTCP25573 = {
                type = "tcp";
                local_addr = "10.1.0.27:25573";
                };
              minecraftUDP25573 = {
                type = "udp";
                local_addr = "10.1.0.27:25573";
                };
              minecraftTCP25574 = {
                type = "tcp";
                local_addr = "10.1.0.27:25574";
                };
              minecraftUDP25574 = {
                type = "udp";
                local_addr = "10.1.0.27:25574";
                };
              minecraftTCP25575 = {
                type = "tcp";
                local_addr = "10.1.0.27:25575";
                };
              minecraftUDP25575 = {
                type = "udp";
                local_addr = "10.1.0.27:25575";
                };
              minecraftTCP25576 = {
                type = "tcp";
                local_addr = "10.1.0.27:25576";
                };
              minecraftUDP25576 = {
                type = "udp";
                local_addr = "10.1.0.27:25576";
                };
              minecraftTCP25577 = {
                type = "tcp";
                local_addr = "10.1.0.27:25577";
                };
              minecraftUDP25577 = {
                type = "udp";
                local_addr = "10.1.0.27:25577";
                };
              minecraftTCP25578 = {
                type = "tcp";
                local_addr = "10.1.0.27:25578";
                };
              minecraftUDP25578 = {
                type = "udp";
                local_addr = "10.1.0.27:25578";
                };
              minecraftTCP25579 = {
                type = "tcp";
                local_addr = "10.1.0.27:25579";
                };
              minecraftUDP25579 = {
                type = "udp";
                local_addr = "10.1.0.27:25579";
                };
              minecraftTCP25587 = {
                type = "tcp";
                local_addr = "10.1.0.27:25587";
                };
              minecraftUDP25587 = {
                type = "udp";
                local_addr = "10.1.0.27:25587";
                };
              minecraftTCP25590 = {
                type = "tcp";
                local_addr = "10.1.0.27:25590";
                };
              minecraftUDP25590 = {
                type = "udp";
                local_addr = "10.1.0.27:25590";
                };
              minecraftTCP25592 = {
                type = "tcp";
                local_addr = "10.1.0.27:25592";
                };
              minecraftUDP25592 = {
                type = "udp";
                local_addr = "10.1.0.27:25592";
                };
              minecraftTCP25594 = {
                type = "tcp";
                local_addr = "10.1.0.27:25594";
                };
              minecraftUDP25594 = {
                type = "udp";
                local_addr = "10.1.0.27:25594";
                };
            };
          };
      };
    };
}
