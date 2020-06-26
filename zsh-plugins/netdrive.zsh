netdrive/ftp () curlftpfs $1:t:r "$@"
netdrive/ssh () sshfs $1:t:r\: "$@"

netdrive/umount () {
	[[ $1 = - ]] && 1=${OLDPWD?no previous path}
    # lazy unmount
	fusermount -uz ${1}(:A)
}

netdrive/status () {
	[[ $1 = - ]] && 1=${OLDPWD?no previous path}
    lsof +f -- "$@"
}

netdrive/fstab () {
	local fstab=$1 name=$2
	local dir=$fstab:h/$name
	local cmd="$( sed -n s/^$name //p )"
	test -n "$cmd" && eval $cmd
}

netdrive/mount () {
	1=($1(:A))
	[[ $1 == *.(ssh|ftp) ]] && {
		netdrive/$1:e "$@"
		return
	}
	@ ( $1:h/fstab(N) ) {
		netdrive/fstab $it $1 ||
			warn "can't mount $1"
	}
}