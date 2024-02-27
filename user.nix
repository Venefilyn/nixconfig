{ pkgs, misc, ... }: {
	programs.atuin = {
		flags = [  "--disable-up-arrow"  ];
	};
}
