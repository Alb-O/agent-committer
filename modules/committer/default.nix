{ pkgs, lib, ... }:

let
  committer = pkgs.writeShellApplication {
    name = "committer";
    runtimeInputs = [
      pkgs.git
      pkgs.gnugrep
      pkgs.prek
    ];
    text = builtins.readFile ./committer.sh;
  };
in
{
  config = {
    instructions.instructions = lib.mkOrder 200 [ (builtins.readFile ./AGENTS.md) ];

    packages = [ committer ];

    outputs.committer = committer;
  };
}
