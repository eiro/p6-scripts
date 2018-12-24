breadcrumb/colored () {
	while (( $# )) {
		it+="%F{$1:h}%K{$1:t}$2%F{$1:t}" 
		if (( $# > 3 )) {
			it+="%K{$3:t}$icons[LEFT_SEGMENT_SEPARATOR]"
		} else {
			it+="%k%F{$1:t}$icons[LEFT_SEGMENT_SEPARATOR]%f" 
		}
		shift 2
	}
}

