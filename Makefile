process-markdown:
	@echo "Processing markdown files..."
	@rm -rf content/*
	@nix run nixpkgs#obsidian-export -- vault/ content/ --frontmatter always
	@scripts/make-index-files content/

#ls -d vault/** | nix run nixpkgs#entr -- make process-markdown

serve:
	nix run nixpkgs#hugo -- server -D

.PHONY: watch serve