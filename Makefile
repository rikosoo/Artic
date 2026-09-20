CAPITULOS := $(sort $(wildcard capitulos/*.md))
CAPS_REV  := $(sort $(wildcard capitulos-revisados/*.md))
BIB       := referencias/referencias.bib
META      := metadata.yaml
UNICO     := dissertacao.md
UNICO_REV := dissertacao-revisada.md
SAIDA     := build

PANDOC_FLAGS := --citeproc \
                --resource-path=.:figuras \
                --number-sections \
                --toc

.PHONY: all pdf docx tex unico pdf-unico revisada pdf-revisada limpar contagem
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

# --- Versão revisada -------------------------------------------------------
# Mesmo conteúdo técnico, reescrito sem travessão, sem meia-risca e com os
# demais maneirismos de redação automática removidos. Ver README.
revisada: $(UNICO_REV)

$(UNICO_REV): $(META) $(CAPS_REV) codigo/montar-dissertacao.sh
	./codigo/montar-dissertacao.sh $(UNICO_REV) capitulos-revisados

pdf-revisada: $(UNICO_REV) $(SAIDA)
	pandoc $(UNICO_REV) $(PANDOC_FLAGS) \
		--pdf-engine=xelatex \
		-o $(SAIDA)/dissertacao-revisada.pdf

contagem:
	@wc -w $(CAPITULOS) | sort -n

limpar:
	rm -rf $(SAIDA) $(UNICO) $(UNICO_REV)
