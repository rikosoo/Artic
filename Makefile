CAPITULOS := $(sort $(wildcard capitulos/*.md))
BIB       := referencias/referencias.bib
META      := metadata.yaml
UNICO     := dissertacao.md
SAIDA     := build

PANDOC_FLAGS := --citeproc \
                --resource-path=.:figuras \
                --number-sections \
                --toc

.PHONY: all pdf docx tex unico pdf-unico limpar contagem
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

# Concatena metadata.yaml + todos os capítulos em um único .md autocontido
unico: $(UNICO)

$(UNICO): $(META) $(CAPITULOS) codigo/montar-dissertacao.sh
	./codigo/montar-dissertacao.sh $(UNICO)

# PDF gerado a partir do arquivo único — mesmo conteúdo do alvo 'pdf'
pdf-unico: $(UNICO) $(SAIDA)
	pandoc $(UNICO) $(PANDOC_FLAGS) \
		--pdf-engine=xelatex \
		-o $(SAIDA)/dissertacao-completa.pdf

contagem:
	@wc -w $(CAPITULOS) | sort -n

limpar:
	rm -rf $(SAIDA) $(UNICO)
