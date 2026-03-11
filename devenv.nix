{ lib, ... }:

{
  imports = [
    ./modules/committer
    ./modules/devenv-run
  ];

  options.instructions.instructions = lib.mkOption {
    type = with lib.types; listOf str;
    default = [];
    description = "Shared instruction text that modules can add.";
  };

  config.instructions.instructions = lib.mkOrder 100 [
    (builtins.readFile ./AGENTS.md)
  ];
}
