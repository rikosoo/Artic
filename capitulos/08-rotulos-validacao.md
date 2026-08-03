# O problema dos rótulos e a estratégia de validação

O Capítulo 7 estabeleceu o que é preciso medir. Este capítulo trata de um
obstáculo anterior: não existe conjunto de dados rotulado contra o qual medir.
A estratégia adotada não contorna essa ausência, mas a decompõe — cada
quantidade do protocolo de avaliação é estimada a partir da fonte de rótulo que
a comporta, e nenhuma é estimada a partir de uma fonte que não a sustenta.

## A ausência de *ground truth*

Não há registro sistemático de eventos de arrasto de âncora sobre cabos, muito
menos de eventos deliberados. As razões são estruturais: o fenômeno é raro; a
determinação de causa depende de investigação a bordo, não de observação
remota; os registros de falha de cabo pertencem a operadoras e não são públicos
de forma consolidada; e a qualificação jurídica, quando ocorre, chega anos
depois e frequentemente não conclui — como o Capítulo 10 discute a propósito do
caso *Eagle S*, extinto sem exame de mérito.

O trabalho reconhece isso de frente em vez de fabricar um conjunto de
conveniência. A consequência mais importante é enunciada já aqui, porque governa
todo o capítulo:

> **A precisão do sistema não pode ser medida empiricamente.** Com um punhado de
> eventos positivos conhecidos, nenhuma estimativa direta de precisão tem poder
> estatístico. O que pode ser medido separadamente é a revocação, sobre eventos
> simulados e sobre os poucos reais, e a densidade de falso alarme, sobre uma
> população de negativos que é abundante. A precisão é então **calculada** a
> partir dessas duas grandezas e da prevalência do Capítulo 7 — não observada.

Confundir cálculo com medida seria o erro metodológico mais grave possível neste
trabalho, e é exatamente o que um conjunto de avaliação artificialmente
balanceado produziria.

## Quatro fontes de rótulo

### Negativos abundantes

A população de trânsitos rotineiros pelo corredor é grande, mensurável e, na
prática, integralmente negativa: dada a prevalência estabelecida, tratar todos os
trânsitos como negativos introduz um erro de contaminação da ordem de $10^{-4}$,
desprezável para a estimação da densidade de falso alarme.

Esta é a fonte de rótulo mais confiável do trabalho, e é o que torna possível
estimar bem o único termo que a aritmética do Capítulo 7 realmente exige com
precisão. A ela soma-se o conjunto de **células de controle** definido no
Capítulo 5, que fornece negativos rotulados especificamente para a medida de
falso alarme por gelo, em regiões sem tráfego.

### Positivos sintéticos

A injeção sintética é a única fonte capaz de produzir positivos em quantidade
suficiente para estimar revocação com poder estatístico, e é o que sustenta as
curvas do Capítulo 6.

A injeção opera em dois níveis, com pesos distintos:

**Nível de trajetória (primário).** Geram-se trajetórias com cinemática de
arrasto — velocidade na faixa característica, persistência de rumo, geometria de
cruzamento — sobre condições ambientais reais: batimetria, gelo e vento
efetivamente observados nas datas simuladas, e sequência de passagens
reconstruída do catálogo conforme o Capítulo 6. Isso exercita o campo de risco,
os descritores cinemáticos e o modelo de captura, que é onde estão as três
contribuições.

**Nível de imagem (secundário e limitado).** Inserir alvos sintéticos em cenas
SAR reais exercitaria o detector, mas reproduzir fielmente assinatura de casco,
esteira, lóbulos laterais e interação com *speckle* é difícil, e um alvo
sintético mal formado produz estimativas de detecção otimistas de forma
não quantificável. Usa-se de forma restrita e com a limitação declarada; a
caracterização do detector apoia-se preferencialmente na verdade positiva
parcial do Capítulo 5, isto é, embarcações reais com AIS confirmado.

A ameaça óbvia à validade é a circularidade: trajetórias sintéticas geradas a
partir do mesmo modelo cinemático que o classificador procura produziriam
revocação artificialmente alta. Mitiga-se gerando as trajetórias a partir de
**parâmetros físicos** — comprimento de amarra, velocidade, resistência de
arrasto, rumo — e não a partir dos descritores usados na pontuação, e
verificando a plausibilidade das trajetórias geradas contra as poucas
trajetórias reais disponíveis.

### Rótulos-proxy

Registros de falha e reparo de cabo fornecem positivos fracos: a data é
confiável, a posição é aproximada, e a causa é frequentemente indeterminada. São
tratados como rótulos com incerteza espaço-temporal explícita, propagada para a
avaliação — um evento cuja posição é conhecida com incerteza de dezenas de
quilômetros não pode confirmar nem refutar uma associação a uma trajetória
específica com a mesma força de um evento bem localizado.

Sua utilidade principal não é validar detecções individuais, mas **estimar o
numerador da prevalência** do Capítulo 7 com menos viés do que a contagem de
casos que chegaram à imprensa.

### Os eventos reais

O conjunto documentado está consolidado em `docs/casos-validacao.md`, com
fontes e ressalvas. Em resumo: episódios árticos em 2021, 2022 e 2025, todos com
documentação insuficiente ou cobertura de dados inadequada; e a sequência
báltica de 2023 a 2026 — Balticconnector, os cabos associados ao *Yi Peng 3*,
Estlink 2 e cabos vizinhos no caso *Eagle S*, o enlace Gotland–Ventspils no caso
*Vezhen*, o cabo Elisa no caso *Fitburg*, e o enlace Letônia–Gotland de janeiro
de 2026, ainda sem embarcação identificada. Some-se o caso de Taiwan, fora do
recorte geográfico, mantido como contraste jurisdicional.

Aplicados os critérios de viabilidade — data e posição conhecidas, cobertura
Sentinel-1 provável, AIS disponível, profundidade compatível —, restam
aproximadamente **seis eventos utilizáveis, todos bálticos**.

Três consequências, todas já incorporadas aos capítulos anteriores. Primeira: é
pouco para treinar e apertado para validar, o que confirma a divisão de tarefas
entre injeção sintética e casos reais. Segunda: praticamente todo o *ground
truth* está fora do domínio de interesse, o que fundamenta o desenho de dois
domínios do Capítulo 3. Terceira, e a mais consequente: **todos pertencem ao
regime cooperativo** do Capítulo 6 — foram identificados pelo AIS, não por
detecção SAR de alvo não cooperativo. O regime não cooperativo permanece sem um
único caso que o instancie.

## O caso *Vezhen* como negativo rotulado

Um dos seis eventos utilizáveis tem estatuto especial e merece tratamento
separado.

No caso *Vezhen*, a investigação sueca estabeleceu causa mecânica — falha de
dois dos três dispositivos de retenção, com o terceiro cedendo ao impacto de
uma onda em horário determinado — e arquivou o caso como acidental. Trata-se,
portanto, de um evento de arrasto real, com hora conhecida, **rotulado como
negativo** quanto à hipótese deliberada.

Seu valor é duplo e vai além de aumentar o tamanho da amostra. Ele é o negativo
mais informativo do conjunto, porque é o único que se situa exatamente onde o
classificador tem de decidir. E ele fornece a verificação empírica da tese do
Capítulo 7: se o sistema atribuir a esse caso um $\Lambda$ elevado — e é o que
se espera, já que a assinatura é a de um arrasto genuíno —, isso não é uma falha
do sistema, é a **confirmação de que a assinatura cinemática não distingue
mecanismo**. O resultado deve ser reportado nesses termos, e não como erro a
corrigir.

## Protocolo de validação

### Divisão de tarefas

| Quantidade | Fonte de rótulo | Poder estatístico |
|---|---|---|
| Densidade de falso alarme | Trânsitos rotineiros; células de controle | Alto |
| Revocação, por estrato | Trajetórias sintéticas | Alto, condicionado à fidelidade da simulação |
| Detecção de embarcação | Alvos com AIS confirmado | Alto, com viés para embarcações grandes |
| Calibração de $\Lambda$ | Sintético, verificado nos reais | Moderado |
| Prevalência | Rótulos-proxy e registros de falha | Baixo, com incerteza declarada |
| Precisão e VPP | **Calculados**, não medidos | — |
| Verificação externa | Seis eventos reais, *leave-one-event-out* | Muito baixo; qualitativo |

A última linha merece ênfase. Com seis eventos, a validação *leave-one-event-out*
não produz uma estimativa de desempenho — produz seis estudos de caso conduzidos
sob disciplina. Seu valor é qualitativo e diagnóstico: verificar que o sistema
não falha de modo grosseiro em casos conhecidos, e examinar em detalhe aqueles
em que falha. Apresentá-la como medida de acurácia seria precisamente o tipo de
excesso que esta dissertação se propõe a evitar.

### *Leave-one-event-out*

Para cada evento, todos os componentes ajustáveis — limiares por estrato,
parâmetros do campo de risco, calibração de $\Lambda$ — são reestimados sem
qualquer informação daquele evento, incluindo a exclusão do período e da região
correspondentes dos conjuntos de ajuste. O evento é então avaliado pelo sistema
resultante.

Reporta-se, para cada caso: o $\Lambda$ atribuído, sua decomposição por
descritor, se e quando a trajetória entrou no suporte do campo de risco, quais
passagens ocorreram na janela do evento e o que cada uma observou.

### Pré-registro do plano de análise

Com seis eventos e um sistema com múltiplos parâmetros ajustáveis, os graus de
liberdade do pesquisador excedem largamente a informação disponível nos dados.
Qualquer escolha feita depois de observar o desempenho nos casos reais — um
limiar, uma faixa de velocidade, uma definição de estrato — contamina a
verificação e a transforma em ajuste.

Adota-se, por isso, o **pré-registro**: o plano de análise — unidade, estratos,
métricas, limiares, critérios de exclusão de cenas e forma de reportar — é
fixado e versionado no repositório antes do primeiro contato com os eventos
reais. Alterações posteriores são permitidas, desde que declaradas como tais e
reportadas separadamente das análises pré-registradas.

Esta é uma salvaguarda barata e incomum na literatura de sensoriamento remoto.
Em um trabalho cujo argumento central é sobre honestidade estatística, sua
ausência seria difícil de defender.

## O que não pode ser validado

Duas coisas, e ambas precisam ser ditas com todas as letras.

**Intenção.** Nenhum elemento do protocolo acima distingue arrasto deliberado de
arrasto acidental, porque nenhum dado disponível contém essa informação. O caso
*Vezhen* demonstra que a distinção depende do estado de manutenção do navio e da
conduta da tripulação — informação de bordo. O sistema não é validado para
detectar sabotagem porque **não se propõe a detectá-la**.

**Desempenho no domínio alvo.** Não há eventos árticos utilizáveis. O desempenho
no Ártico é estimado por transferência a partir do domínio de calibração, com a
degradação por gelo medida no Capítulo 5 e a diferença de revisita modelada no
Capítulo 6, mas não é verificado contra nenhum evento real. Essa é a limitação
mais séria do trabalho, e o Capítulo 10 a registra como tal.

## Enquadramento

O que o sistema detecta é **assinatura cinemática compatível com arrasto de
âncora sobre um trecho onde o dano seria fisicamente possível**. Não sabotagem,
não intenção, não sequer dano — a ocorrência do dano é estabelecida pela falha
do cabo, não pela observação remota.

Essa formulação deve aparecer não apenas nesta seção, mas nos títulos das
figuras, nas legendas das tabelas e no resumo. A razão é prática, e a
experiência dos casos documentados a sustenta: um resultado apresentado como
"detecção de sabotagem" será citado como tal, independentemente das ressalvas no
corpo do texto. A precisão terminológica é a única defesa disponível contra o
uso indevido do próprio trabalho — e, como o Capítulo 7 argumentou por outra
via, é também o que dá ao trabalho a credibilidade que uma afirmação mais
ambiciosa lhe custaria.
