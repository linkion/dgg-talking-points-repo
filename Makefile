process-markdown:
	@echo "Processing markdown files..."
	@rm -rf content/*
	@nix run nixpkgs#obsidian-export -- vault/ content/ --frontmatter always
	@scripts/make-index-files content/

serve:
	nix run nixpkgs#hugo -- server -D

.PHONY: watch serve