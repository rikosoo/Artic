# Detecção de assinaturas cinemáticas compatíveis com arrasto de âncora sobre cabos submarinos árticos por fusão SAR–AIS

Projeto de mestrado. Dissertação escrita em Markdown e compilada via pandoc.

**O sistema não detecta sabotagem.** Detecta assinatura cinemática compatível
com arrasto de âncora — condição necessária e largamente insuficiente para
caracterizar ato deliberado. O enquadramento está fixado na seção 1.6 e
atravessa todo o texto.

## Argumento

A dissertação é uma cadeia de reduções sucessivas de pretensão. Cada elo retira
alcance do anterior, e é isso que sustenta o que sobra:

1. No Ártico, noite polar e nebulosidade persistente deixam SAR como o único
   imageamento disponível o ano inteiro.
2. A fusão SAR–AIS revela embarcações ausentes do rastreamento público.
3. Mas só importam as que estão onde uma âncora alcança o fundo — **corredor
   condicionado por batimetria** (contribuição 1, §4.4).
4. E o detector degrada sistematicamente no gelo — **clutter de gelo**
   (contribuição 2, cap. 5).
5. E o evento pode ocorrer inteiro entre duas passagens — **revisita vs.
   duração** (contribuição 3, cap. 6).
6. E a taxa base destrói o valor preditivo mesmo com alta especificidade
   (cap. 7).
7. E, sob a UNCLOS, detectar não confere autoridade para agir (cap. 10).

Daí a forma da saída: uma **razão de verossimilhança** com a evidência que a
compõe, não um rótulo. O sistema estima a força da evidência; não estima a
probabilidade a priori, e não finge estimar (§4.6).

## Estrutura

```
metadata.yaml            Metadados do documento (título, formatação, bibliografia)
capitulos/               Um arquivo por capítulo, na ordem de numeração
figuras/                 Figuras geradas (versionadas)
dados/bruto/             Dados baixados — NÃO versionado
dados/processado/        Produtos intermediários — NÃO versionado
codigo/                  Pipeline de processamento
referencias/             referencias.bib e estilo de citação
docs/                    Planejamento e conjunto de casos
```

Capítulos não redigidos contêm o esqueleto de seções com as decisões
metodológicas registradas em comentários HTML — invisíveis no PDF compilado.

## Compilação

```
make pdf      # build/dissertacao.pdf (requer pandoc + xelatex)
make docx     # build/dissertacao.docx (para revisão com o orientador)
make tex      # build/dissertacao.tex (ponto de partida para migrar a abnTeX2)
make contagem # contagem de palavras por capítulo
```

O Capítulo 4 usa notação matemática em LaTeX, o que torna o alvo `pdf`
dependente de xelatex. A exportação `docx` converte as equações para OMML e é
adequada para revisão.

Antes da primeira compilação é preciso baixar `referencias/abnt.csl` — ver
`referencias/LEIA-ME.md`.

## Estado

| Capítulo | Estado | Palavras |
|---|---|---|
| 1 Introdução | Redigido | ~2.000 |
| 2 Fundamentação | Redigido | ~3.700 |
| 3 Dados | Redigido | ~3.100 |
| 4 Método | Redigido | ~3.000 |
| 5 Clutter de gelo | Redigido | ~2.100 |
| 6 Revisita | Redigido | ~2.000 |
| 7 Falsos positivos | Redigido | ~2.600 |
| 8 Rótulos e validação | Redigido | ~2.100 |
| 9 Resultados | Esqueleto | — |
| 10 Discussão | Esqueleto | — |
| 11 Conclusão | Esqueleto | — |

## Decisões já tomadas

Registradas aqui porque não são óbvias a partir do texto e não devem ser
revisitadas por esquecimento.

- **Dois domínios** (§3.1). Báltico como domínio de calibração — é onde estão os
  eventos documentados; Ártico como domínio alvo. A diferença de desempenho
  entre os dois **é o resultado**, não um efeito colateral.
- **Recorte alvo** (§3.1). Mar de Barents meridional como principal;
  Svalbard–continente como estudo de caso adicional. Sujeito à verificação de
  viabilidade (§3.5).
- **AIS pelos acervos nacionais**, não pela Global Fishing Watch (§3.4). Os
  produtos públicos da GFW são agregados; o AIS bruto subjacente é comercial e
  não redistribuível. As fontes primárias são os acervos históricos abertos da
  autoridade marítima dinamarquesa e da administração costeira norueguesa.
- **Traçados de cabo por KIS-ORCA / EMODnet**, não por TeleGeography (§3.4),
  cujo mapa é esquemático e não representa a geometria real no fundo.
- **Sem filtragem de speckle antes da detecção** (§3.7). O filtro altera a
  estatística do fundo, que é exatamente o objeto de medida do Capítulo 5.
- **Cinemática fora do campo espacial de risco** (§4.4). `R(x)` é propriedade do
  lugar; cinemática é propriedade da trajetória. Separadas para permitir ablação.
- **Avaliação por precisão–revocação e custo ponderado.** Acurácia e ROC-AUC
  excluídas com justificativa (cap. 7): sob desbalanceamento extremo, a
  especificidade domina a ROC e produz curvas excelentes para sistemas inúteis.

## Pendências que travam trabalho

1. **Verificação de viabilidade** (§3.5) — contagem de cenas por modo, revisita
   efetiva, cobertura AIS, fração do corredor em profundidade operável e
   densidade de tráfego, para cada recorte candidato. Tem critérios de rejeição
   explícitos; se um recorte falhar, **muda-se a área, não o método**. É o portão
   do mês 12 do cronograma e deve ser executado antes de qualquer processamento.
2. **Extensão geográfica e profundidade de histórico** dos dois acervos de AIS,
   frente aos corredores escolhidos. Deles depende a viabilidade do casamento.
3. **Fontes primárias dos incidentes** — entradas marcadas `% SUBSTITUIR` no
   `.bib`. Prioridade para o acórdão do caso *Eagle S* e a decisão de
   arquivamento do caso *Vezhen*, que sustentam argumento e não apenas contexto.
4. **Norma de sociedade classificadora sobre amarra** (§4.4.3). A derivação da
   componente de profundidade se apoia em comprimento de amarra e relação de
   amarra, hoje referenciados a partir de fontes secundárias.

## Verificação bibliográfica

As entradas do `.bib` marcadas `% VERIFICAR` têm metadados preenchidos de
memória e precisam ser conferidas contra a fonte. As marcadas `% SUBSTITUIR`
apoiam-se em fontes secundárias e precisam da fonte primária. Nenhuma das duas
categorias deve chegar à qualificação como está.

## Documentos de apoio

- `docs/estrutura-dissertacao.md` — estrutura completa, recorte para artigo,
  cronograma de 24 meses e análise de riscos.
- `docs/casos-validacao.md` — incidentes de 2021 a 2026 com data, embarcação,
  bandeira e desfecho jurídico; avaliação de viabilidade de cada caso para
  validação *leave-one-event-out*.
