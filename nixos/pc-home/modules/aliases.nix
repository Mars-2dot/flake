{
  environment.interactiveShellInit = ''
  alias gs='git status'
  alias gp='git push'
  alias hs='home-manager switch --flake $HOME/flake'
  alias ns='sudo nixos-rebuild switch --flake /home/ilya/flake'
  alias l='ls -lah'
  alias kdf='kubectl delete -f '
  alias kaf='kubectl apply -f '
  alias vpnon='sudo wg-quick up /home/ilya/.vpn/wg0.conf'
  alias vpnoff='sudo wg-quick down /home/ilya/.vpn/wg0.conf'
  alias v='nvim'
'';
}
