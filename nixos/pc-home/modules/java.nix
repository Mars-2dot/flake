{ pkgs ? import <nixpkgs> {} }:
let
  javaDevEnv = pkgs.buildFHSUserEnv {
    name = "java-dev-env";
    targetPkgs = pkgs: with pkgs; [
      jdk17
      gradle
      protobuf
      git
      bashInteractive
      coreutils
      protoc-gen-grpc-web
    ];
    multiPkgs = pkgs: with pkgs; [
      bashInteractive
      git
    ];
    runScript = "bash";
  };
in pkgs.stdenv.mkDerivation {
  name = "java-dev-env-shell";
  nativeBuildInputs = [ javaDevEnv ];
  shellHook = "exec ${javaDevEnv}/bin/bash";
}