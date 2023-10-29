{ inputs, ... }: {
	modifications = final: prev: {
		obsidian-wayland = prev.obsidian.override { electron = final.electron_24; };
	};
}
