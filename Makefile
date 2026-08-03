CAPITULOS := $(sort $(wildcard capitulos/*.md))
BIB       := referencias/referencias.bib
META      := metadata.yaml
SAIDA     := build

PANDOC_FLAGS := --citeproc \
                --resource-path=.:figuras \
                --number-sections \
                --toc

.PHONY: all pdf docx tex limpar contagem
all: pdf

$(SAIDA):
	mkdir -p $(SAIDA)

pdf: $(SAIDA)
	pandoc $(META) $(CAPITULOS) $(PANDOC_FLAGS) \
		--pdf-engine=xelatex \
		-o $(SAIDA)/dissertacao.pdf

docx: $(SAIDA)
	pandoc $(META) $(CAPITULOS) $(PANDOC_FLAGS) \
		-o $(SAIDA)/dissertacao.docx

# Gera LaTeX editável — ponto de partida caso se opte por migrar para abnTeX2
tex: $(SAIDA)
	pandoc $(META) $(CAPITULOS) $(PANDOC_FLAGS) \
		--standalone \
		-o $(SAIDA)/dissertacao.tex

contagem:
	@wc -w $(CAPITULOS) | sort -n

limpar:
	rm -rf $(SAIDA)
