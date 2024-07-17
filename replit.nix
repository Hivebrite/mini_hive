{ pkgs }: {
	deps = [
        pkgs.nano
        pkgs.ruby_3_2
        pkgs.rubyPackages_3_2.solargraph
        pkgs.rufo
        pkgs.sqlite
	];
}
