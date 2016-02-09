# We only want to run gpg-agent on our local workstation. We accomplish that by trying to
# detect if this shell was spawned from ssh or not. If the SSH_CLIENT env var is set, then
# this is probably a remote login and we don't want to run gpg-agent.

if [ ! -n "$SSH_CLIENT" ]; then
  # gpg < 2.1, use gpg-connect-agent
  #[ -e "${HOME}/.gpg-agent-info" ] && source "${HOME}/.gpg-agent-info"
  #gpg-connect-agent /bye &>/dev/null || gpg-agent --daemon &>/dev/null
	#source "${HOME}/.gpg-agent-info"

  # gpg >= 2.1, use gpgconf
  gpgconf --launch gpg-agent
  export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"

	GPG_TTY=$(tty)
	export GPG_TTY
fi
