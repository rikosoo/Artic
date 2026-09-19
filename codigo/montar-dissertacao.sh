#!/usr/bin/env bash
# Monta a dissertação inteira em um único arquivo Markdown autocontido,
# com o cabeçalho YAML de metadata.yaml embutido, na ordem dos capítulos.
#
# Uso: ./codigo/montar-dissertacao.sh [saida.md]
set -euo pipefail

RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SAIDA="${1:-$RAIZ/dissertacao.md}"

cd "$RAIZ"

{
  cat metadata.yaml
  echo
  echo "<!-- Arquivo gerado por codigo/montar-dissertacao.sh a partir de"
  echo "     metadata.yaml e capitulos/*.md. Não editar à mão: edite os"
  echo "     capítulos e gere novamente com 'make unico'. -->"
  for cap in $(ls capitulos/*.md | sort); do
    echo
    cat "$cap"
    echo
  done
} > "$SAIDA"

echo "Arquivo único gerado: $SAIDA ($(wc -w < "$SAIDA") palavras)"
