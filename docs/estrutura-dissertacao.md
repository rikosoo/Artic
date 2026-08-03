# Detecção de assinaturas cinemáticas compatíveis com arrasto de âncora sobre cabos submarinos árticos por fusão SAR–AIS

**Subtítulo alternativo:** *Corredores de risco condicionados por batimetria, degradação por clutter de gelo e os limites da inferência sob taxa base extrema*

Projeto de mestrado — estrutura de dissertação e artigo derivado.

---

## 0. Títulos candidatos

| # | Título | Ênfase |
|---|--------|--------|
| 1 | Detecção de assinaturas cinemáticas compatíveis com arrasto de âncora sobre cabos submarinos árticos por fusão SAR–AIS | Método (recomendado) |
| 2 | Vigilância de infraestrutura submarina no Ártico: o que SAR pode e não pode dizer sobre arrasto de âncora | Epistêmico / crítico |
| 3 | Corredores de risco condicionados por batimetria para detecção de embarcações escuras próximas a cabos submarinos árticos | Contribuição 1 isolada |
| 4 | Limites probabilísticos da detecção de eventos de arrasto de âncora sob revisita SAR e clutter de gelo | Contribuição 2+3 isoladas |

O título 1 é o mais defensável: nomeia o objeto real (assinatura cinemática, não sabotagem), o método (fusão SAR–AIS) e o recorte geográfico. O enquadramento honesto já está embutido no título — isso protege a banca inteira de discussão.

---

## 1. Arquitetura do argumento

A dissertação tem uma única linha lógica, e cada capítulo é um elo dela:

1. No Ártico, só SAR enxerga o ano inteiro → **justificativa do sensor**
2. Fusão SAR–AIS revela embarcações não rastreadas → **precedente metodológico (Paolo et al., 2024)**
3. Mas nem toda embarcação escura importa: só as que estão onde uma âncora alcança o fundo → **corredor batimétrico (contribuição 1)**
4. E o detector SAR degrada onde há gelo → **caracterização do clutter (contribuição 2)**
5. E o evento pode acontecer inteiro entre duas passagens → **modelo de revisita (contribuição 3)**
6. E mesmo tudo funcionando, a taxa base destrói o valor preditivo → **análise de falsos positivos (núcleo honesto)**
7. E mesmo com detecção perfeita, não há autoridade de interdição → **UNCLOS, reposicionamento como instrumento de atribuição**

Cada elo é uma redução de pretensão. É o que torna o trabalho publicável: ele termina afirmando menos do que começou prometendo, e por isso o que afirma se sustenta.

---

## 2. Estrutura da dissertação

### Capítulo 1 — Introdução

**1.1 Por que SAR** *(parágrafo de abertura, conforme definido)*
Meses de noite polar e cobertura de nuvem persistente tornam sensoriamento óptico inútil em boa parte do ano no Ártico. SAR é o único imageamento com disponibilidade contínua — independente de iluminação solar e, em larga medida, de cobertura de nuvem. Essa não é uma preferência metodológica; é a única opção operacional. Abrir por aqui fixa o escopo antes de qualquer outra coisa.

**1.2 Contexto de infraestrutura**
Cabos submarinos como infraestrutura crítica; expansão de rotas árticas (Polar Express, Far North Fiber) sob retração de gelo marinho; concentração de tráfego em corredores estreitos.

**1.3 O problema**
Eventos recentes de dano a cabo por arrasto de âncora no Báltico e no Mar do Norte; assimetria entre a facilidade do dano e a dificuldade da atribuição.

**1.4 Pergunta de pesquisa**
*Em que medida a fusão SAR–AIS permite detectar assinaturas cinemáticas compatíveis com arrasto de âncora sobre cabos submarinos árticos, e quais são os limites impostos por gelo, revisita e taxa base?*

**1.5 Objetivos**
- Geral: caracterizar a viabilidade e os limites de um sistema de detecção baseado em dados públicos.
- Específicos: (i) definir corredor de risco condicionado por batimetria; (ii) quantificar degradação do detector em função de concentração de gelo; (iii) modelar probabilidade de detecção como função de revisita e duração do evento; (iv) quantificar valor preditivo positivo sob taxa base realista.

**1.6 Delimitação explícita do que o trabalho NÃO faz**
Não detecta sabotagem. Não estabelece intenção. Não produz base para interdição. Detecta assinatura cinemática compatível com arrasto de âncora — uma condição necessária e largamente insuficiente. Colocar isso no Capítulo 1, não na conclusão.

**1.7 Contribuições e organização**

---

### Capítulo 2 — Fundamentação e trabalhos relacionados

**2.1 SAR marítimo**
Geometria de imageamento, retroespalhamento de superfície do mar, modelo de Bragg, dependência de vento e estado de mar. Sentinel-1 GRD: modos IW/EW, resolução, cobertura polar, política de aquisição.

**2.2 Detecção de embarcações em SAR**
CFAR (CA-, OS-, GO-/SO-CFAR); premissas estatísticas do clutter de mar aberto (K, Weibull, G0); limites de detecção por tamanho de alvo vs. resolução; abordagens por aprendizado profundo e sua dependência de rótulos.

**2.3 AIS**
Cobertura satelital vs. terrestre, classes A/B, taxa de mensagem em função de velocidade e manobra, colisão de mensagens em zonas densas, e as três formas de ausência: falha de recepção, desligamento e *spoofing*.

**2.4 Fusão SAR–AIS e o conceito de embarcação escura**
Paolo et al. (Nature, 2024) como precedente metodológico direto e baseline arquitetural: casamento em escala global, evidência de que parte substancial da atividade industrial marítima não aparece no rastreamento público. Discutir o que se herda (arquitetura de casamento, definição operacional de *dark vessel*) e o que não se herda (o trabalho é de mar aberto e escala global; aqui o alvo é um corredor estreito em condições de gelo).

**2.5 Dano a cabos submarinos**
Estatísticas de causa (ICPC): pesca e âncora como causas dominantes históricas; profundidades típicas de ocorrência; assinatura física do arrasto no fundo.

**2.6 Sensoriamento em condições de gelo**
Retroespalhamento de gelo de primeiro ano vs. multiano; zona marginal de gelo; produtos de concentração (OSI SAF, AMSR2, cartas nacionais de gelo).

**2.7 Lacuna identificada**
Nenhum dos ramos acima trata conjuntamente: corredor condicionado por profundidade + degradação por gelo + limite de revisita + taxa base realista. É aí que o trabalho entra.

---

### Capítulo 3 — Dados

Todos públicos — declarar isso como escolha metodológica (reprodutibilidade), não como limitação.

| Fonte | Uso | Observação crítica |
|---|---|---|
| Sentinel-1 GRD (Copernicus Data Space) | Imageamento primário | Verificar cobertura real do corredor; revisita efetiva ≠ revisita nominal |
| AIS (Global Fishing Watch / AISHub) | Casamento e rótulo negativo | Cobertura polar degradada acima de ~75°N em constelações não polares |
| GEBCO | Batimetria para o corredor | Resolução de 15 arcsec; incerteza vertical relevante perto do limiar de 200 m |
| KIS-ORCA / TeleGeography | Rotas de cabo | Rotas *aproximadas* — a incerteza posicional entra no orçamento de erro |
| OSI SAF / AMSR2 | Concentração de gelo | Casar temporalmente com a passagem SAR |
| ERA5 | Vento e estado de mar | Necessário para explicar variação do limiar CFAR |
| Registros de falha/reparo de cabo | Rótulo-proxy | Data e localização aproximada; ver Cap. 6 |

**3.1 Área de estudo**
Recomendação: recortar. Um trecho específico (ex.: Mar de Barents / aproximações de Murmansk, ou o corredor do Mar do Norte–Noruega como zona de calibração com mais dados) vale mais que "o Ártico". Justificar o recorte por disponibilidade de dados e por existência de cabos em profundidade operável.

**3.2 Recorte temporal** e **3.3 Pipeline de pré-processamento** (calibração radiométrica, correção de terreno, máscara de terra, filtragem de speckle — com justificativa de cada escolha, porque cada uma altera a estatística do clutter).

---

### Capítulo 4 — Método

**4.1 Visão geral do pipeline**
`Sentinel-1 → pré-processamento → detecção CFAR → correspondência com AIS → filtro por corredor de risco → análise cinemática → pontuação e classificação`

**4.2 Detecção de alvos**
CFAR adaptativo; parametrização; tratamento de *sidelobes* e alvos de azimute ambíguo.

**4.3 Correspondência SAR–AIS**
Interpolação de trajetória AIS para o instante de aquisição; janela espaço-temporal de associação; associação por custo (Hungarian / Global Nearest Neighbour); tratamento explícito de não-correspondência ambígua.

**4.4 Corredor de risco condicionado por batimetria — CONTRIBUIÇÃO 1**
Substituir o buffer fixo por uma função de risco:

```
R(x) = f( profundidade(x), tipo_de_fundo(x), distância_ao_cabo(x), viabilidade_cinemática(x) )
```

- **Profundidade:** peso decrescente com a profundidade, aproximadamente nulo além do alcance operacional de ancoragem (~200 m como ordem de grandeza, não como limiar rígido — justificar com comprimento de amarra típico por classe de navio).
- **Tipo de fundo:** substrato que permite ou impede penetração e engate da âncora.
- **Cinemática necessária:** faixa de velocidade e rumo capaz de produzir dano — abaixo/acima disso o arrasto não corta.
- **Incerteza:** a rota do cabo é aproximada; propagar essa incerteza para a largura do corredor em vez de fingir que ela não existe.

**Resultado a reportar:** redução do espaço de busca em ordens de magnitude vs. buffer fixo, e o ganho de precisão correspondente. Esta é a contribuição mais forte do trabalho — merece figura própria e seção de resultados própria.

**4.5 Análise cinemática de trajetória**
Velocidade sustentada na faixa de arrasto, persistência de rumo, ângulo de cruzamento do cabo, desaceleração anômala, correlação com a geometria do cabo.

**4.6 Pontuação e classificação**
Saída como *score* calibrado + evidência, não como rótulo binário. Justificar: sob taxa base extrema, um rótulo binário é ativamente enganoso.

---

### Capítulo 5 — Caracterização de desempenho sob clutter de gelo — CONTRIBUIÇÃO 2

**5.1 O problema**
CFAR pressupõe estatística de clutter de mar aberto. Blocos, cristas de compressão e gelo deformado produzem retroespalhamento forte e pontual — indistinguível de casco metálico para o detector. A zona marginal de gelo é o pior caso: heterogênea, dinâmica, e exatamente onde há tráfego.

**5.2 Desenho experimental**
Estratificar aquisições por concentração de gelo (0%, 1–30%, 30–70%, 70–100%) e por tipo (primeiro ano / multiano / MIZ). Para cada estrato, medir taxa de falso alarme com limiar CFAR fixo e taxa de detecção sobre alvos com AIS confirmado (que servem de verdade positiva parcial).

**5.3 Resultado esperado**
Curva de degradação: taxa de falso alarme em função da concentração de gelo. Mais uma família de curvas P–R por estrato.

**5.4 Mitigações avaliadas**
Limiar adaptativo por estrato; máscara por produto de concentração de gelo; textura/polarimetria (VV vs. VH — razão de co/cross-pol separa gelo de metal razoavelmente bem); e o custo em recall de cada mitigação.

**5.5 Declaração operacional**
Acima de qual concentração de gelo o sistema deixa de ser útil. Uma resposta numérica honesta aqui vale mais que qualquer melhoria marginal de F1.

---

### Capítulo 6 — Revisita vs. duração do evento — CONTRIBUIÇÃO 3

**6.1 Formulação**
Um navio arrastando âncora a 5–7 nós percorre dezenas de quilômetros em poucas horas. Se a revisita SAR é da mesma ordem de grandeza que a duração do evento, a detecção é intrinsecamente probabilística — não é uma falha de implementação, é uma propriedade do sistema de observação.

**6.2 Modelo**
```
P_det = P(existir passagem sobre o corredor durante a janela do evento)
      × P(detectar o alvo | passagem)      ← função de gelo, vento, tamanho do alvo (Cap. 5)
      × P(classificar corretamente | detecção)
```
Tratar a chegada de passagens como processo determinístico por órbita (não Poisson — o Sentinel-1 tem ciclo fixo) e integrar sobre a distribuição de duração e horário de início do evento.

**6.3 Estudo de sensibilidade**
`P_det` em função de: revisita efetiva no corredor (o valor real, não os "6 dias" nominais); duração do evento (1–12 h); latitude (a revisita melhora com a latitude por convergência de órbitas — quantificar esse ganho).

**6.4 Implicação**
Limite superior de desempenho independente do algoritmo. Qualquer trabalho futuro que reporte recall acima desse teto está medindo outra coisa. Este capítulo é um resultado publicável isoladamente.

---

### Capítulo 7 — Falsos positivos: o núcleo honesto

O capítulo mais importante da dissertação. Deve vir antes dos resultados finais, não depois.

**7.1 Análise de taxa base**
Cálculo explícito, com números: N trânsitos/ano no corredor × fração que satisfaz o filtro cinemático, contra o número de eventos confirmados na história registrada. Demonstrar formalmente que, mesmo com especificidade de 99%, o valor preditivo positivo permanece muito baixo:

```
VPP = (Sens × Prev) / (Sens × Prev + (1 − Espec) × (1 − Prev))
```

Apresentar como tabela de VPP em função de prevalência e especificidade. Isto não é uma ressalva — é um achado.

**7.2 Confusão pesca/arrasto**
Um arrasteiro operando a 3–5 nós tem assinatura cinemática quase idêntica à de arrasto de âncora. E a ironia central: pesca de arrasto é historicamente a principal causa acidental de dano a cabos. O comportamento "anômalo" é também a explicação inocente mais comum — e é uma explicação que também produz dano. Discutir se a distinção é sequer necessária para o propósito de proteção da infraestrutura (argumento: para prevenção não é; para atribuição é).

**7.3 Demais confundidores legítimos**
Desvio de rota por gelo; capeamento e redução de velocidade por mau tempo; espera de praticagem; operação científica (reboque de sensor, perfilagem); manutenção do próprio cabo — que por construção ocorre exatamente sobre a rota, em velocidade baixa, com manobra anômala. Para cada um: assinatura esperada e possibilidade de desambiguação com dados públicos.

**7.4 Custo assimétrico**
No Ártico, um falso positivo significa deslocar ativo por distâncias enormes ou abordar/questionar embarcação de outra bandeira — com custo diplomático real. Formalizar em matriz de custo e otimizar limiar por custo esperado, não por F1.

**7.5 Consequência metodológica**
Avaliação por **precision–recall** e **custo ponderado**. Acurácia e ROC-AUC são descartadas explicitamente, com justificativa: sob desbalanceamento extremo, a especificidade domina a ROC e produz curvas excelentes para sistemas inúteis. Declarar isso como norma do trabalho no Cap. 1 e executá-la aqui.

---

### Capítulo 8 — O problema dos rótulos e a estratégia de validação

**8.1 A ausência de ground truth**
Não existe conjunto rotulado de sabotagem. Reconhecer isso de frente.

**8.2 Três caminhos, combinados**
1. **Injeção sintética:** trajetórias simuladas de arrasto sobre condições reais de imagem e gelo — dá controle sobre recall e permite as curvas do Cap. 6.
2. **Rótulos-proxy:** registros de falha e reparo de cabo (data e localização aproximada) como positivos fracos, com a incerteza espaço-temporal explicitada.
3. **Leave-one-event-out:** sobre o conjunto de casos bálticos e do Mar do Norte conhecidos — cada caso conhecido testado por um modelo que não o viu.

**8.3 Enquadramento honesto**
O sistema não detecta sabotagem; detecta assinatura cinemática compatível com arrasto de âncora. Dizer isso explicitamente, repetidamente, e nos títulos das figuras. O trabalho ganha credibilidade com essa restrição em vez de perdê-la.

**8.4 Conjunto de casos de validação**
*Pendência aberta:* levantamento dos incidentes bálticos e árticos de 2025 e do que já ocorreu em 2026, com data, local, cabo afetado, embarcação implicada e desfecho jurídico. Ver seção "Próximo passo" ao final.

---

### Capítulo 9 — Resultados

9.1 Caracterização do corredor de risco (redução do espaço de busca vs. buffer fixo)
9.2 Desempenho do detector por estrato de gelo (curvas do Cap. 5)
9.3 `P_det` em função de revisita e duração (curvas do Cap. 6)
9.4 Precision–recall e custo esperado, com o VPP do Cap. 7 aplicado
9.5 Estudos de caso: aplicação a incidentes conhecidos (LOEO)
9.6 Ablação: contribuição isolada de cada componente (corredor, filtro de gelo, cinemática)

---

### Capítulo 10 — Discussão

**10.1 Detecção não é autoridade**
Sob a UNCLOS, o dano a cabo submarino em ZEE por navio de bandeira estrangeira depende em larga medida do Estado de bandeira para persecução. O Estado costeiro não adquire jurisdição de execução por ter detectado o evento. Consequência direta: o sistema produz **evidência para atribuição e ação diplomática**, não base para interdição.

**10.2 Reposicionamento da contribuição**
De "sistema de defesa" para "instrumento de atribuição". Mais defensável tecnicamente, mais interessante analiticamente, e alinhado com o que o método de fato entrega.

**10.3 Implicações operacionais**
Onde o sistema é útil (triagem retrospectiva, priorização de investigação, dossiê de atribuição) e onde não é (alerta em tempo real, decisão de interceptação).

**10.4 Limitações**
Cobertura AIS polar; *spoofing* de AIS; rotas de cabo aproximadas; resolução do GEBCO perto do limiar de profundidade; ausência de validação com dados de campo.

**10.5 Considerações éticas e de uso duplo**
O sistema usa dados públicos e produz evidência de atribuição, não capacidade ofensiva. Ainda assim: discutir risco de uso para assédio a embarcações pesqueiras legítimas, e por que a insistência em precision e custo assimétrico é também uma salvaguarda.

---

### Capítulo 11 — Conclusão e trabalhos futuros

Retomar a pergunta; enumerar as três contribuições; declarar o que ficou fora. Futuro: SAR comercial de alta revisita (Umbra, ICEYE, Capella) contra o teto do Cap. 6; polarimetria completa para separação gelo/metal; fusão com dados de sensoriamento acústico do próprio cabo (DAS — *distributed acoustic sensing*), que é a única fonte com verdade real e mudaria o problema de rótulos por completo.

---

## 3. Artigo derivado (recorte para submissão)

A dissertação inteira não cabe em um paper. Recomendação de recorte:

> **Título:** *Bathymetry-conditioned risk corridors and the base-rate limit of SAR–AIS anchor-drag detection in the Arctic*
>
> Capítulos 4.4 + 6 + 7, com o Cap. 5 reduzido a uma figura. Ou seja: corredor batimétrico como método, limite de revisita como resultado teórico, taxa base como achado. O clutter de gelo vira um segundo paper, mais técnico, para venue de sensoriamento remoto.

**Venues plausíveis:** *Remote Sensing of Environment*, *IEEE JSTARS*, *Marine Policy* (para o recorte de atribuição/UNCLOS), *ISPRS Journal*.

---

## 4. Cronograma sugerido (24 meses)

| Meses | Foco | Entregável |
|---|---|---|
| 1–4 | Revisão de literatura; consolidação de dados; recorte da área de estudo | Cap. 2 e 3 |
| 5–8 | Pipeline SAR + casamento AIS; reprodução do baseline | Pipeline funcional |
| 9–12 | Corredor batimétrico | Cap. 4 + primeiros resultados |
| 13–15 | Caracterização de gelo | Cap. 5 |
| 16–18 | Modelo de revisita + análise de taxa base | Cap. 6 e 7 — **submissão do artigo** |
| 19–21 | Validação sobre casos conhecidos | Cap. 8 e 9 |
| 22–24 | Discussão, redação, defesa | Dissertação completa |

**Ponto de decisão no mês 12:** se a cobertura Sentinel-1 sobre o corredor escolhido for insuficiente, mudar a área de estudo — não o método. Melhor descobrir isso no mês 12 que no 20.

---

## 5. Riscos do projeto

| Risco | Probabilidade | Mitigação |
|---|---|---|
| Cobertura AIS insuficiente em alta latitude | Alta | Recortar para latitudes com cobertura verificada; tratar a lacuna como resultado, não como falha |
| Revisita S1 muito baixa no corredor | Média | Verificar antes de fixar a área (mês 1–4); considerar S1 + RCM/RADARSAT |
| Poucos casos de validação | Alta | Peso maior em injeção sintética; incluir casos bálticos/Mar do Norte como calibração |
| Escopo excessivo | Alta | As três contribuições são separáveis; qualquer duas já sustentam um mestrado |

---

## 6. Próximo passo em aberto

Levantamento dos incidentes bálticos e árticos de 2025 e do decorrido de 2026 — data, local, cabo, embarcação implicada, desfecho jurídico — para montar o conjunto de casos de validação do Cap. 8.4.
