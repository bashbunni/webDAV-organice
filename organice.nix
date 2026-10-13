{
  services.nginx = {
    enable = true;

    virtualHosts."localhost" = {
      # Local-only access; no firewall opening needed.
      listen = [
        { addr = "127.0.0.1"; port = 8081; }
      ];

      root = "/srv/organice";

      locations."/" = {
        # Support Organice's client-side routes.
        tryFiles = "$uri $uri/ /index.html";
      };

      # Keep this prefix aligned with the WebDAV server's public path.
      locations."^~ /webdav/" = {
        proxyPass = "http://127.0.0.1:80/webdav/";
        extraConfig = ''
          client_max_body_size 20m;
        '';
      };
    };
  };
}
