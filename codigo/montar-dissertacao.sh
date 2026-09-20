#!/usr/bin/env bash
# Monta a dissertação inteira em um único arquivo Markdown autocontido, com o
# cabeçalho YAML de metadata.yaml embutido, na ordem dos capítulos.
#
# Uso: ./codigo/montar-dissertacao.sh [saida.md] [diretorio-de-capitulos]
#
#   ./codigo/montar-dissertacao.sh
#       -> dissertacao.md, a partir de capitulos/
#   ./codigo/montar-dissertacao.sh dissertacao-revisada.md capitulos-revisados
#       -> versão revisada, com travessões e meias-riscas também normalizados
#          no título (o corpo dos capítulos revisados já não os contém)
set -euo pipefail

RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SAIDA="${1:-$RAIZ/dissertacao.md}"
CAPS="${2:-capitulos}"

cd "$RAIZ"

# A versão revisada não usa travessão (—) nem meia-risca (–) em lugar nenhum,
# inclusive no título vindo de metadata.yaml.
if [ "$CAPS" = "capitulos-revisados" ]; then
  META_CMD="sed -e s/–/-/g -e s/—/-/g metadata.yaml"
else
  META_CMD="cat metadata.yaml"
fi

{
  $META_CMD
  echo
  echo "<!-- Arquivo gerado por codigo/montar-dissertacao.sh a partir de"
  echo "     metadata.yaml e $CAPS/*.md. Não editar à mão: edite os"
  echo "     capítulos e gere novamente com 'make'. -->"
  for cap in $(ls "$CAPS"/*.md | sort); do
    echo
    cat "$cap"
    echo
  done
} > "$SAIDA"

echo "Arquivo único gerado: $SAIDA ($(wc -w < "$SAIDA") palavras)"
