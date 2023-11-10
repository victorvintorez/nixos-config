# Credit goes to Misterio77 (https://github.com/Misterio77)
{ config, lib, ... }:
let 
  inherit (lib) mkOption types;
  cfg = config.monitors;
in 
{
  options.monitors = mkOption {
    type = types.listOf (types.submodule {
      options = {
        # Monitor Name
        name = mkOption {
          type = types.str;
          example = "DP-1";
        };
        # Is monitor primary
        primary = mkOption {
          type = types.bool;
          default = false;
        };
        # Monitor Width (px)
        width = mkOption {
          type = types.int;
          example = 1920;
        };
        # Monitor Height (px)
        height = mkOption {
          type = types.int;
          example = 1080;
        };
        # Refresh rate of the monitor (hz)
        refreshRate = mkOption {
          type = types.int;
          default = 60;
        };
        # Location of monitor on x axis (px)
        x = mkOption {
          type = types.int;
          default = 0;
        };
        # Location of monitor on y axis (px)
        y = mkOption {
          type = types.int;
          default = 0;
        };
	# Scale of monitor
	scale = mkOption {
		type = types.int;
		default = 1;
	};
        # Is monitor enabled
        enabled = mkOption {
          type = types.bool;
          default = true;
        };
        workspace = mkOption {
          type = types.nullOr types.str;
          default = null;
        };
      };
    });
  };
  config = {
    assertions = [{
      assertion = ((lib.length config.monitors) != 0) ->
        ((lib.length (lib.filter (m: m.primary) config.monitors)) == 1);
      message = "Exactly one monitor must be set as primary";
    }];
  };
}
