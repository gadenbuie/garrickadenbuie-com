QUARTO_VERSION = v1.9.30
QUARTO_BINARY = $(HOME)/.local/share/qvm/versions/$(QUARTO_VERSION)/bin/quarto
RIG = rig
R_VERSION = 4.6
R_DIR = $(shell $(RIG) run --r-version $(R_VERSION) --dry-run -e 1 2>/dev/null | cut -d '"' -f2 | xargs dirname)

$(QUARTO_BINARY):
	qvm install $(QUARTO_VERSION)
	touch $@

render: $(QUARTO_BINARY)
	@test -n "$(R_DIR)" || (echo "Unable to resolve R $(R_VERSION) with rig" >&2; exit 1)
	QUARTO_R="$(R_DIR)" $(QUARTO_BINARY) render

preview: $(QUARTO_BINARY)
	@test -n "$(R_DIR)" || (echo "Unable to resolve R $(R_VERSION) with rig" >&2; exit 1)
	QUARTO_R="$(R_DIR)" $(QUARTO_BINARY) preview

new-post:
	$(QUARTO_BINARY) use template _extensions/gadenbuie/new-post
