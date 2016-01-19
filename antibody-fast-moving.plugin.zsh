-antibody-fast-moving() {
  local i

  for cmd in "antibody" "peco" "tmux"; do
    if ! type "$cmd" &>/dev/null; then
      cat <<EOT 1>&2
$cmd does not found in your \$PATH.
EOT
    return 1
    fi
  done

  if [[ -z "$ANTIBODY_HOME" ]]; then
    cat <<'EOT' 1>&2
ANTIBODY_HOME is not set, antibody does not work properly on your machine?
EOT
  return 1
  fi

  cd $(find "$ANTIBODY_HOME" -type d -maxdepth 1 -print | peco)
  zle accept-line
  zle -R -c
}

autoload -Uz -- -antibody-fast-moving
zle -N -- -antibody-fast-moving

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
