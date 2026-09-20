# Detecção de assinaturas cinemáticas compatíveis com arrasto de âncora sobre cabos submarinos árticos por fusão SAR–AIS

Projeto de mestrado. Dissertação escrita em Markdown e compilada via pandoc.

**O sistema não detecta sabotagem.** Detecta assinatura cinemática compatível
com arrasto de âncora — condição necessária e largamente insuficiente para
caracterizar ato deliberado. O enquadramento está fixado na seção 1.6 e
atravessa todo o texto, inclusive títulos de figuras e legendas.

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

**Conclusão do trabalho:** a fusão SAR–AIS permite produzir evidência de
atribuição com força mensurável, e não permite detecção confiável de eventos
isolados. A aplicação natural é retrospectiva e dirigida.

## Resultados analíticos já estabelecidos

Derivados no texto, independentes de processamento — e portanto já defensáveis
em qualificação:

- **Intervalos heterogêneos entre passagens reduzem a captura** (§6.3). Por
  concavidade de `min(D, g)`, `P_capt ≤ min(D/E[g], 1)`: citar revisita média
  superestima a cobertura, e o erro cresce com o agrupamento — que cresce com a
  latitude. O ganho de revisita polar é, em parte, ilusório.
- **Peso de evidência exigido** (§7.3). Com chance a priori de ~10⁻⁴, levar a
  posterior a 1 exige `Λ ≈ 10⁴`. Converte a taxa base de obstáculo em
  especificação de projeto.
- **Teto de precisão independente de sensor** (§7.4, §10.3). A falha mecânica de
  retenção da âncora produz assinatura *idêntica*, não semelhante, à do arrasto
  deliberado. Dois dos casos mais visíveis — *Vezhen* e *Eagle S* — foram
  qualificados como acidentais por defeito de equipamento, em jurisdições
  distintas.
- **Todos os incidentes documentados são do regime cooperativo** (§6.5). As
  embarcações transmitiam AIS e foram identificadas por ele. O regime não
  cooperativo, em que o SAR seria o detector primário, não tem um único caso que
  o instancie.
- **A precisão não pode ser medida** (§8.1). Com seis eventos, é calculada a
  partir de revocação e densidade de falso alarme, estimadas de fontes distintas.
- **Onde as contribuições 1 e 2 se encontram** (§7.5).
  `E[FP] ≈ λ_fa × A_ef × N_pass`. O corredor reduz `A_ef` sem remover eventos
  genuínos, elevando a prevalência na região observada — mais eficaz que
  refinar o classificador.
- **Satélite não substitui cabo** (§1.3). Cabos carregam 95–99 % do tráfego
  intercontinental; a capacidade agregada da maior constelação em órbita baixa
  é comparável à de um único par de fibras de um cabo transatlântico moderno. E
  substituir cabo por constelação transfere a dependência para um serviço único
  de operador privado estrangeiro — troca de vulnerabilidade, não redução.

## Estrutura

```
metadata.yaml            Metadados do documento (título, formatação, bibliografia)
capitulos/               Um arquivo por capítulo, na ordem de numeração
                         (00 = pré-textual, 01-11 = capítulos, 99 = referências)
capitulos-revisados/     Os mesmos capítulos, reescritos sem marcas de redação
                         automática (ver "Duas versões do texto")
dissertacao.md           Texto inteiro em um único arquivo - GERADO, não editar
dissertacao-revisada.md  Idem, a partir de capitulos-revisados/ - GERADO
figuras/                 Figuras geradas (versionadas)
dados/bruto/             Dados baixados — NÃO versionado
dados/processado/        Produtos intermediários — NÃO versionado
codigo/                  Pipeline de processamento
referencias/             referencias.bib e estilo de citação
docs/                    Planejamento, casos de validação e pré-registro
```

## Compilação

```
make pdf       # build/dissertacao.pdf (requer pandoc + xelatex)
make docx      # build/dissertacao.docx (para revisão com o orientador)
make tex       # build/dissertacao.tex (ponto de partida para migrar a abnTeX2)
make unico     # dissertacao.md, texto inteiro em um único arquivo Markdown
make pdf-unico # build/dissertacao-completa.pdf, a partir do arquivo único
make revisada     # dissertacao-revisada.md
make pdf-revisada # build/dissertacao-revisada.pdf
make contagem  # contagem de palavras por capítulo
```

Os capítulos 4 a 10 usam notação matemática em LaTeX, o que torna os alvos de
PDF dependentes de xelatex. A exportação `docx` converte as equações para OMML
e é adequada para revisão.

**Arquivo único.** `make unico` concatena `metadata.yaml` e todos os arquivos de
`capitulos/` em `dissertacao.md`, autocontido e compilável sozinho — é o formato
para enviar a terceiros, submeter a revisão ou versionar como instantâneo. O
arquivo é gerado por `codigo/montar-dissertacao.sh`: edite sempre os capítulos e
regenere, nunca o arquivo único. `make pdf-unico` produz o PDF correspondente.

A ordem de montagem segue a numeração dos arquivos, de modo que o material
pré-textual (`00-pretextual.md`: resumo, abstract, lista de siglas e lista de
símbolos) e a seção de referências (`99-referencias.md`) entram automaticamente
em todos os alvos, inclusive nos antigos.

## Duas versões do texto

O repositório carrega o mesmo texto em duas redações.

`capitulos/` é a redação original. `capitulos-revisados/` é uma reescrita
integral com o mesmo conteúdo técnico, as mesmas seções, as mesmas equações e
as mesmas citações, da qual foram retirados os traços estilísticos que denunciam
redação assistida por modelo de linguagem:

| Marcador | Original | Revisada |
|---|---|---|
| Travessão (—) | 317 | 0 |
| Meia-risca (–) | 32 | 0 |
| "precisamente / justamente / exatamente" | 41 | 1 |
| Parágrafos abrindo em negrito | 133 | 60 |

A revisão também desfez o encadeamento repetitivo de frase longa seguida de
fragmento curto, reduziu as tríades e retirou o comentário do texto sobre as
próprias virtudes. As 60 aberturas em negrito que restam são chamadas de figura
e de tabela do Capítulo 9 e os rótulos de contribuição do Capítulo 11, que são
convenção de dissertação e não maneirismo.

Duas redações do mesmo trabalho é um arranjo transitório, mantido para
comparação. Escolhida uma delas, a outra deve ser removida, para que exista uma
única fonte de verdade.

Permanecem quatro travessões na bibliografia compilada, todos dentro de títulos
de obras publicadas ("New Threats—Old Rules", "Satellite AIS — Developing
Technology or Existing Capability?", "Kingfisher Information Service — Offshore
Renewable and Cable Awareness"). Alterar o título de uma obra citada é erro de
citação, e por isso foram preservados. As meias-riscas restantes são intervalos
de página da bibliografia, convenção universal do BibTeX.

## Estado

Texto completo: **~27.600 palavras**, 55 entradas bibliográficas, todas citadas.

| Capítulo | Estado | Palavras |
|---|---|---|
| 0 Pré-textual (resumo, abstract, siglas, símbolos) | Redigido | 1.924 |
| 1 Introdução | Redigido | 2.555 |
| 2 Fundamentação | Redigido | 3.699 |
| 3 Dados | Redigido | 3.106 |
| 4 Método | Redigido | 3.004 |
| 5 Clutter de gelo | Redigido | 2.066 |
| 6 Revisita | Redigido | 2.026 |
| 7 Falsos positivos | Redigido | 2.623 |
| 8 Rótulos e validação | Redigido | 1.770 |
| 9 Resultados | **Estrutura sem valores** | 1.590 |
| 10 Discussão | Redigido | 1.898 |
| 11 Conclusão | Redigido | 1.382 |

O Capítulo 9 especifica 21 figuras e 10 tabelas com eixos, unidades e
expectativas registradas, mas **não contém valores medidos** — o processamento
não foi executado. Quando os dados existirem, é preenchimento, não redação.

## Decisões já tomadas

Registradas aqui porque não são óbvias a partir do texto e não devem ser
revisitadas por esquecimento.

**Dados e recorte**

- **Dois domínios** (§3.1). Báltico como domínio de calibração — é onde estão os
  eventos documentados; Ártico como domínio alvo. A diferença de desempenho
  entre os dois **é o resultado**, não um efeito colateral.
- **Recorte alvo** (§3.1). Mar de Barents meridional como principal;
  Svalbard–continente como estudo de caso adicional. Sujeito à verificação de
  viabilidade (§3.5).
- **AIS pelos acervos nacionais**, não pela Global Fishing Watch (§3.4). Os
  produtos públicos da GFW são agregados; o AIS bruto subjacente é comercial e
  não redistribuível. As fontes primárias são os acervos históricos abertos da
  autoridade marítima dinamarquesa e da administração costeira norueguesa —
  com seleção prévia por recorte, dado o volume (centenas de GB/ano).
- **Traçados de cabo por KIS-ORCA / EMODnet**, não por TeleGeography (§3.4),
  cujo mapa é esquemático e não representa a geometria real no fundo.
- **Sem filtragem de speckle antes da detecção** (§3.7). O filtro altera a
  estatística do fundo, que é exatamente o objeto de medida do Capítulo 5.

**Método**

- **Cinemática fora do campo espacial de risco** (§4.4). `R(x)` é propriedade do
  lugar; cinemática é propriedade da trajetória. Separadas para permitir ablação.
- **Profundidade derivada, não postulada** (§4.4.3). Função de sobrevivência de
  `L/s` sobre a frota que transita no corredor. Os números conhecidos situam a
  profundidade de fundeio de projeto em 80–100 m, bem abaixo dos 200 m usuais.
- **Correção de azimute por modelo direto** (§4.3). Desloca-se a posição prevista
  do candidato AIS, não a detecção SAR. Ignorar isso fabrica embarcações escuras.
- **Saída em razão de verossimilhança, não rótulo** (§4.6).

**Avaliação**

- **Unidade de análise: o trânsito** pelo suporte de `R(x)` (§7.1). Cena e
  detecção foram rejeitadas, com motivo.
- **Precisão–revocação e custo ponderado.** Acurácia e ROC-AUC excluídas com
  justificativa (§7.7) — e a exclusão faz parte do pré-registro.
- **Vento como eixo de estratificação** (§5.2). Sem ele, a degradação atribuída
  ao gelo fica confundida com estado de mar.
- **Células de controle** para o rótulo negativo (§5.2). Sem elas, falso alarme
  por gelo e embarcação escura são indistinguíveis.
- **Custo de falso negativo = perda de evidência de atribuição**, não custo do
  dano (§7.6). O sistema não previne.
- **Pré-registro do plano de análise** antes do contato com os eventos reais
  (§8.5).

## Pendências que travam trabalho

1. **Verificação de viabilidade** (§3.5) — contagem de cenas por modo, revisita
   efetiva, cobertura AIS, fração do corredor em profundidade operável e
   densidade de tráfego, para cada recorte candidato. Tem critérios de rejeição
   explícitos; se um recorte falhar, **muda-se a área, não o método**. Deve ser
   executada antes de qualquer processamento, e seu resultado é a Tabela 9.1.
2. **Congelar o pré-registro.** Marcar `docs/pre-registro.md` com uma tag git
   (p. ex. `pre-registro-v1`) para que a data seja verificável e independa de
   memória. Depois disso, só emendas datadas.
3. **Extensão geográfica e profundidade de histórico** dos dois acervos de AIS,
   frente aos corredores escolhidos. Deles depende a viabilidade do casamento.
4. **Fontes primárias dos incidentes** — 6 entradas `% SUBSTITUIR` no `.bib`.
   Prioridade para o acórdão do caso *Eagle S* e a decisão de arquivamento do
   caso *Vezhen*: sustentam argumento, não apenas contexto.
5. **Norma de sociedade classificadora sobre amarra** (§4.4.3). A derivação da
   componente de profundidade se apoia em comprimento de amarra e relação de
   amarra, hoje referenciados a partir de fontes secundárias. Atenção à
   distinção entre a relação para *fundeio seguro* (5:1 a 7:1, documentada) e a
   suficiente para *arrasto capaz de causar dano* (menor e não estabelecida).

## Acompanhar

- **Recurso no caso *Eagle S*.** O Ministério Público finlandês recorreu da
  decisão de outubro de 2025; pendente no Tribunal de Apelação de Helsinque, sem
  desfecho conhecido em agosto de 2026. **A §10.2 depende do resultado** e pode
  precisar de atualização antes do depósito.
- **Novos incidentes.** `docs/casos-validacao.md` cobre até janeiro de 2026;
  cada novo caso amplia o conjunto de validação e o denominador da taxa base.

## Verificação bibliográfica

Convenção de marcação no `.bib`:

- `% VERIFICAR` (20 entradas) — metadados preenchidos de memória; conferir
  contra a fonte.
- `% SUBSTITUIR` (6 entradas) — apoiadas em fontes secundárias; obter a fonte
  primária.

Nenhuma das duas categorias deve chegar à qualificação como está.

## Documentos de apoio

- `docs/estrutura-dissertacao.md` — estrutura completa, títulos candidatos,
  recorte para artigo, cronograma de 24 meses e análise de riscos.
- `docs/casos-validacao.md` — incidentes de 2021 a 2026 com data, embarcação,
  bandeira e desfecho jurídico; avaliação de viabilidade de cada caso para
  validação *leave-one-event-out*; e as fontes primárias a obter.
- `docs/pre-registro.md` — plano de análise a congelar **antes** do primeiro
  contato com os eventos reais: unidade, desfechos, estratos, critérios de
  exclusão, sete expectativas registradas com o que sua refutação implicaria, e
  o que não será afirmado.
