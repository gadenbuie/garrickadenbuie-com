QUARTO_VERSION = v1.5.57
QUARTO_BINARY = $(HOME)/.local/share/qvm/versions/$(QUARTO_VERSION)/bin/quarto

$(QUARTO_BINARY):
	qvm install $(QUARTO_VERSION)
	touch $@

render: $(QUARTO_BINARY)
	$(QUARTO_BINARY) render

preview: $(QUARTO_BINARY)
	$(QUARTO_BINARY) preview
