# Detecção de arrasto de âncora sobre cabos submarinos árticos por fusão SAR–AIS

Projeto de mestrado. Dissertação escrita em Markdown e compilada via pandoc.

## Estrutura

```
metadata.yaml            Metadados do documento (título, formatação, bibliografia)
capitulos/               Um arquivo por capítulo, na ordem de numeração
figuras/                 Figuras geradas (versionadas)
dados/bruto/             Dados baixados — NÃO versionado
dados/processado/        Produtos intermediários — NÃO versionado
codigo/                  Pipeline de processamento
referencias/             referencias.bib e estilo de citação
docs/                    Estrutura da dissertação e notas de planejamento
```

## Compilação

```
make pdf      # build/dissertacao.pdf (requer pandoc + xelatex)
make docx     # build/dissertacao.docx (para revisão com o orientador)
make tex      # build/dissertacao.tex (ponto de partida para migrar a abnTeX2)
make contagem # contagem de palavras por capítulo
```

O estilo de citação (`referencias/abnt.csl`) precisa ser baixado do repositório
oficial de estilos CSL antes da primeira compilação — ver
`referencias/LEIA-ME.md`.

## Estado

| Capítulo | Estado |
|---|---|
| 1 Introdução | Redigido |
| 2 Fundamentação | Esqueleto |
| 3 Dados | Esqueleto |
| 4 Método | Esqueleto |
| 5 Clutter de gelo | Esqueleto |
| 6 Revisita | Esqueleto |
| 7 Falsos positivos | Esqueleto |
| 8 Rótulos e validação | Esqueleto |
| 9 Resultados | Esqueleto |
| 10 Discussão | Esqueleto |
| 11 Conclusão | Esqueleto |

Planejamento completo, cronograma e análise de riscos: `docs/estrutura-dissertacao.md`.
