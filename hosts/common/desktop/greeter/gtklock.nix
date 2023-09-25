{ config, pkgs, lib, ... }: {
  security = {
    pam = {
      services = {
        gtklock = {
	  fprintAuth = true;
	  text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
	};
      };
    };
  };
};
