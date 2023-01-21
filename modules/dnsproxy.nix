{
  pkgs,
  config,
  ...
}: {
  systemd.services.dnsproxy = {
    description = "Simple DNS proxy";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      PermissionsStartOnly = true;
      LimitNPROC = 512;
      LimitNOFILE = 1048576;
      CapabilityBoundingSet = "cap_net_bind_service";
      AmbientCapabilities = "cap_net_bind_service";
      NoNewPrivileges = true;
      DynamicUser = true;
      ExecStart = "${pkgs.dnsproxy}/bin/dnsproxy -l 127.0.0.1 -u quic://${config.networking.hostName}-1bce38.dns.nextdns.io";
      Restart = "on-failure";
    };
  };

  networking.nameservers = ["127.0.0.1"];
}
