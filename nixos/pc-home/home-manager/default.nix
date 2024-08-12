{
    inputs,
    pkgs,
    ...
}:
{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };

  home = {
    username = "ilya";
    homeDirectory = "/home/ilya";
    stateVersion = "24.05";
  };
   home.packages = with pkgs; [
    (jetbrains.idea-ultimate.override { vmopts = ''
    -Xms128m
    -Xmx2048m
    -XX:+HeapDumpOnOutOfMemoryError
    -XX:-OmitStackTraceInFastThrow
    -XX:+IgnoreUnrecognizedVMOptions
    -ea
    -Dsun.io.useCanonCaches=false
    -Dsun.java2d.metal=true
    -Djbr.catch.SIGABRT=true
    -Djdk.http.auth.tunneling.disabledSchemes=""
    -Djdk.attach.allowAttachSelf=true
    -Djdk.module.illegalAccess.silent=true
    -Dkotlinx.coroutines.debug=off
    -XX:CICompilerCount=2
    -XX:ReservedCodeCacheSize=512m
    -XX:CompileCommand=exclude,com/intellij/openapi/vfs/impl/FilePartNodeRoot,trieDescend
    -XX:SoftRefLRUPolicyMSPerMB=50
    -Dide.show.tips.on.startup.default.value=false
    -Dsun.tools.attach.tmp.only=true
    -Dawt.lock.fair=true
    -Dawt.toolkit.name=WLToolkit
    -Djna.library.path=/nix/store/dffl5kwymf8zp1jvd6l2l769sxfnipfi-libsecret-0.21.4/lib:/nix/store/ppfnlsswks82mhdfswzmamcq3a2mikf0-e2fsprogs-1.47.1/lib:/nix/store/qjc7b5l019p260qv9r7w39hsap656jbl-libnotify-0.8.3/lib:/nix/store/2sysjvnq7c2ql29ijg6s3i4x0md183l0-systemd-minimal-libs-255.6/lib
  '';})

  (jetbrains.goland.override { vmopts = ''
       -Xms128m
       -Xmx1024m
       -XX:ReservedCodeCacheSize=512m
       -XX:+IgnoreUnrecognizedVMOptions
       -XX:+UseG1GC
       -XX:SoftRefLRUPolicyMSPerMB=50
       -XX:CICompilerCount=2
       -XX:+HeapDumpOnOutOfMemoryError
       -XX:-OmitStackTraceInFastThrow
       -ea
       -Dsun.io.useCanonCaches=false
       -Djdk.http.auth.tunneling.disabledSchemes=""
       -Djdk.attach.allowAttachSelf=true
       -Djdk.module.illegalAccess.silent=true
       -Dkotlinx.coroutines.debug=off
       -XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log
       -XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof
       -Dawt.toolkit.name=WLToolkit
   '';})
  ];
}
