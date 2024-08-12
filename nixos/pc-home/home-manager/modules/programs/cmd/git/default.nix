{
  pkgs,
  ...
}: {
  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-eco gh-dash];
    gitCredentialHelper.enable = false;
  };
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    lfs.enable = true;
    userName = "Mars-2dot";
    userEmail = "ilya.boldyrev36@gmail.com";
    aliases = {
      fpush = "push --force-with-lease";
      aa = "add --all";
      cm = "commit -m";
      co = "checkout";
      br = "branch";
      s = "status";
      uncommit = "reset --soft head^";
      unadd = "reset";
    };
    extraConfig = {
      init = {defaultbranch = "master";};
      branch = {sort = "-committerdate";};
      push = {default = "simple";};
    };
    ignores = [
      # c commons
      "compile_commands.json"
      "vgcore.*"
      ".cache"
      "*.gc??"
      # locked files
      "*~"
      # nix buid
      "result"
      # ide folders
      ".editorconfig"
      ".vscode"
      ".idea"
      ".vs"
    ];
  };
}
