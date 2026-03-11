{ pkgs, lib, ... }:

let
  devenvRun = pkgs.writeShellApplication {
    name = "devenv-run";
    runtimeInputs = [
      pkgs.coreutils
      pkgs.devenv
      pkgs.findutils
      pkgs.gawk
    ];
    text = builtins.readFile ./devenv-run.sh;
  };
in
{
  config = {
    instructions.instructions = lib.mkOrder 300 [ (builtins.readFile ./AGENTS.md) ];

    packages = [ devenvRun ];

    outputs.devenv-run = devenvRun;
  };
}
