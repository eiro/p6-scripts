#

	apk add luarocks5.1 ca-certificates unzip curl alpine-sdk lua5.1-dev
	for it in lua-toml moonscript argparse luafilesystem ; do
		luarocks-5.1 install $it
	done

	apk add git

	# make help to get help on build things

	( git clone https://github.com/Lukc/build.zsh.git &&
	  cd build.zsh && make PREFIX=/usr/local install ) &
	git clone https://github.com/Lukc/pkgxx &
	wait
	(cd pkgxx     && build.zsh && make PREFIX=/usr/local install)
	# generation de clefs pour la signature de paquets
	abuild-keygen -nian


edit /etc/pkgxx.conf
edit package.toml
echo /src/pkg >> /etc/apk/repositories 


