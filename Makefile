md_files := $(wildcard docs/*.md)
tex_files := $(patsubst docs/%.md,dist/%.tex,$(md_files))
pdf_files := $(patsubst docs/%.md,dist/%.pdf,$(md_files))
options := -t beamer

default:
	nix-shell --run 'make slides'
slides:
	pandoc $(options) -s $(md_files) -o $(tex_files)
	tectonic $(tex_files)
watch:
	nix-shell --run 'watchexec -e md make'
repl:
	nix repl '<nixpkgs>'