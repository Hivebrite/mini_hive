{ pkgs }: {
	deps = [
        pkgs.nano
        pkgs.ruby_3_3
        pkgs.rubyPackages_3_3.solargraph
        pkgs.rufo
        pkgs.sqlite
	];
}
