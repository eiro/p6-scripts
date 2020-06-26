# vim: noet ts=4 sts=4 sw=4 ft=zsh

netdrive/ftp () curlftpfs $1:t:r "$@"
netdrive/ssh () sshfs $1:t:r\: "$@"

netdrive/umount () {
	[[ $1 = - ]] && 1=${OLDPWD?no previous path}
	fusermount -uz ${1}(:A)
}

netdrive/status () {
	[[ $1 = - ]] && 1=${OLDPWD?no previous path}
	lsof +f -- "$@"
}

netdrive/fstab () eval "$( sed -n "s;^$1:t ;;p" $fstab )"

netdrive/mount () {
	1=($1(:A))
	[[ $1 == *.(ssh|ftp) ]] && {
		netdrive/$1:e "$@"
		return
	}
	local fstab
	for fstab ( $1:h/fstab(N) ) {
		netdrive/fstab $1 ||
			warn "can't mount $1"
	}
}
