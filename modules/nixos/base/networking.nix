{	

  # Network discovery, mDNS
  # With this enabled, you can access your machine at <hostname>.local
  # it's more convenient than using the IP address.
  # https://avahi.org/
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      domain = true;
      userServices = true;
    };
  };
  networking = {
    networkmanager.enable = true;


    # Use an NTP server located in Ukraine to synchronize the system time
    timeServers = [
      "0.ua.pool.ntp.org"
      "1.ua.pool.ntp.org"
      "2.ua.pool.ntp.org"
      "3.ua.pool.ntp.org"
    ];
  };
}
