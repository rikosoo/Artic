# Revisita orbital e duração do evento

Este capítulo contém a terceira contribuição do trabalho: um modelo da
probabilidade de detecção como função conjunta da cadência de observação e da
duração do evento, e o teto de desempenho que dele decorre.

O resultado é anterior a qualquer escolha de algoritmo. Ele não descreve uma
limitação da implementação proposta, mas uma propriedade do sistema de
observação — e vale igualmente para qualquer detector que opere sobre o mesmo
acervo.

## Formulação

Uma embarcação arrastando âncora a velocidade de arrasto percorre dezenas de
quilômetros em poucas horas. O evento é, portanto, **transitório**: existe
durante uma janela de duração comparável ou inferior ao intervalo típico entre
observações. Se a cadência de revisita é da mesma ordem de grandeza que a
duração do evento, então a observação do evento é um acontecimento aleatório, e
a detecção é intrinsecamente probabilística.

Essa é uma diferença qualitativa em relação ao problema que a literatura de
fusão SAR–AIS normalmente ataca. Detectar pesca não declarada, por exemplo, é
detectar uma atividade que persiste por dias ou semanas em uma região: qualquer
passagem dentro desse período a observa, e a revisita afeta apenas a resolução
temporal do resultado, não a sua existência. Aqui, uma passagem que ocorra duas
horas antes ou depois não observa nada.

Formalmente, decompõe-se

$$P_{det} = \mathbb{E}_{T_0, D}\left[ 1 - \prod_{i\,:\, t_i \in [T_0,\, T_0 + D]} \big(1 - p_i\big) \right],$$

onde $T_0$ é o instante de início do evento, $D$ sua duração, $\{t_i\}$ a
sequência de instantes de aquisição sobre o corredor, e $p_i$ a probabilidade
de que a passagem $i$ produza detecção **e** classificação corretas — quantidade
que o Capítulo 5 caracteriza em função do estrato de gelo, do vento e da
configuração de aquisição.

As seções seguintes tratam separadamente os três ingredientes: a estrutura da
sequência $\{t_i\}$, a distribuição de $D$, e a estrutura de $p_i$, que se
revela depender de um fator não previsto na formulação original.

## A sequência de passagens não é um processo de Poisson

É tentador modelar as passagens como um processo de Poisson de taxa igual ao
inverso da revisita média. Seria conveniente e está errado.

As aquisições de uma missão em órbita quase polar com ciclo de repetição fixo
formam uma sequência **determinística e conhecida**. Sobre um ponto dado, as
passagens ocorrem em instantes previsíveis, agrupados de forma irregular: faixas
adjacentes cobrem o mesmo ponto em dias próximos dentro do ciclo, produzindo
agrupamentos, separados por intervalos longos até o ciclo seguinte. A
distribuição dos intervalos é, portanto, fortemente heterogênea — e essa
heterogeneidade cresce com a latitude, justamente porque a convergência das
órbitas aumenta o número de faixas que cobrem o ponto.

A consequência prática é que a sequência não precisa ser modelada
estocasticamente: ela pode ser **reconstruída** a partir do catálogo, para o
corredor específico e para cada data, com a configuração de constelação vigente
— que, como o Capítulo 3 registrou, variou ao longo do período de interesse.
O objeto de modelagem aleatória é o instante do evento, não o da observação.

## Probabilidade de captura

Seja $\{g_k\}$ o conjunto de intervalos entre passagens consecutivas sobre o
corredor em um período de referência. Admitindo que o instante de início do
evento seja uniforme sobre esse período — hipótese discutida adiante —, o
evento inicia dentro do intervalo $g_k$ com probabilidade proporcional a $g_k$,
e, uma vez dentro dele, é capturado por ao menos uma passagem se e somente se
começar a menos de $D$ do fim do intervalo. Segue

$$P_{capt}(D) \;=\; \frac{\sum_k \min(D,\, g_k)}{\sum_k g_k}.$$

A expressão é exata e não exige hipótese distribucional sobre as passagens.

### O caso homogêneo e por que ele engana

Se todos os intervalos fossem iguais a $\bar g$, o resultado se reduziria a

$$P_{capt}(D) = \min\!\left(\frac{D}{\bar g},\, 1\right),$$

isto é, a razão entre duração do evento e revisita, saturando em um. É esta a
forma que a intuição sugere e que justificaria citar uma "revisita média" como
descritor suficiente de cobertura.

Ela é otimista. Como $\min(D, g)$ é côncava em $g$, a desigualdade de Jensen dá

$$P_{capt}(D) \;=\; \frac{\mathbb{E}[\min(D, g)]}{\mathbb{E}[g]} \;\le\; \min\!\left(\frac{D}{\mathbb{E}[g]},\, 1\right).$$

**Para uma mesma revisita média, intervalos heterogêneos produzem probabilidade
de captura estritamente menor que intervalos regulares.** O motivo é
transparente: agrupar passagens desperdiça observações — duas passagens
separadas por poucas horas quase sempre veem, ou deixam de ver, o mesmo evento —
e alonga os intervalos restantes, que é onde os eventos escapam.

Este é o primeiro resultado do capítulo, e tem consequência prática imediata:
**citar revisita média superestima a cobertura efetiva**, e o erro é tanto maior
quanto mais agrupadas as passagens. Como o agrupamento cresce com a latitude, o
ganho de revisita polar frequentemente invocado como vantagem do Ártico é, em
parte, ilusório: aumenta o número de passagens por ciclo, mas concentra-as. O
ganho real precisa ser medido pela expressão exata, e a diferença entre as duas
formas é ela própria um resultado a reportar.

## Distribuição da duração do evento

A duração é a variável menos observada do modelo. As fontes disponíveis são os
próprios incidentes documentados no Capítulo 8: extensões de arrasto relatadas —
da ordem de dezenas a uma centena de quilômetros — combinadas com as velocidades
características de arrasto produzem durações da ordem de poucas a algumas horas.

Com um conjunto dessa dimensão não se estima uma distribuição; adota-se uma
família paramétrica com suporte positivo e assimetria à direita, e **reporta-se
o resultado como função de $D$ em vez de integrar sobre uma distribuição mal
estimada**. A curva $P_{capt}(D)$, com $D$ variando de uma a doze horas, é mais
informativa e mais honesta do que um número único obtido por integração sobre
uma distribuição que os dados não sustentam.

Duas ressalvas sobre a hipótese de início uniforme. Primeira: se o evento for
deliberado, o instante de início pode não ser uniforme — um ator informado pode
consultar efemérides públicas e escolher a janela entre passagens, o que reduz
$P_{capt}$ abaixo do valor calculado. O modelo, nesse caso, é um limite
superior, e vale registrar que a publicidade dos horários de passagem é, para
esta aplicação, uma vulnerabilidade e não apenas uma conveniência. Segunda: a
atividade marítima tem estrutura diurna e sazonal que pode correlacionar-se com
a hora local das passagens de uma órbita heliossíncrona; essa correlação é
verificável nos dados de tráfego e precisa ser checada antes de assumir
uniformidade.

## Dois regimes de observação

Ao instanciar $p_i$, aparece uma distinção que a formulação original do projeto
não previa e que altera substancialmente o alcance do resultado.

### Alvo cooperativo

Se a embarcação transmite AIS, sua trajetória é conhecida com cadência de
segundos a minutos — ordens de grandeza mais fina que qualquer revisita orbital.
A assinatura cinemática de interesse — velocidade sustentada em faixa de
arrasto, persistência de rumo, geometria em relação ao cabo — é obtida
**integralmente do AIS**, sem depender de o satélite passar durante o evento.

Nesse regime, o papel do SAR não é detectar o evento. É:

- **verificar** a posição e a velocidade reportadas, expondo falsificação —
  função que, conforme o Capítulo 4, nenhum outro elemento do sistema cumpre;
- **corroborar** com observação independente e não cooperativa, o que tem valor
  probatório distinto do registro AIS, cuja integridade depende do próprio
  suspeito.

A revisita, aqui, determina a probabilidade de **corroboração**, não a de
detecção. O evento é detectado de qualquer forma; o que a passagem acrescenta é
uma evidência de natureza diferente.

### Alvo não cooperativo

Se a embarcação não transmite, ou transmite posição falsa, a trajetória só pode
ser reconstruída a partir de observações SAR. Aqui, o teto de $P_{capt}$ aplica-
se integralmente, e com um agravante: uma única passagem fornece posição e, pelo
Capítulo 2, cinemática instantânea parcial via deslocamento em azimute e
esteira — mas o Capítulo 5 estabeleceu que **ambas as vias enfraquecem em
gelo**, onde não há esteira e a velocidade reduzida torna o deslocamento em
azimute comparável à incerteza de geolocalização.

Portanto, no regime não cooperativo e em condições de gelo, a classificação
tende a exigir **duas ou mais passagens dentro da janela do evento**, cuja
probabilidade é substancialmente menor que a de uma:

$$P_{\ge 2}(D) \;=\; \frac{\sum_k \max\!\big(0,\, \min(D, g_k + g_{k+1}) - g_k\big)}{\sum_k g_k},$$

com a soma tomada sobre pares consecutivos. A queda em relação a $P_{capt}$ é
acentuada precisamente onde os intervalos são heterogêneos.

### O que isso implica para o trabalho

A observação de que os dois regimes têm tetos radicalmente diferentes tem uma
consequência empírica desconfortável e que precisa ser dita: **todos os
incidentes documentados no Capítulo 8 pertencem ao regime cooperativo**. As
embarcações envolvidas — nos casos do Golfo da Finlândia, do enlace
Gotland–Ventspils e dos demais — transmitiam AIS, e foi pelo AIS que foram
identificadas. Nenhum caso conhecido foi descoberto por detecção SAR de alvo não
cooperativo.

Disso decorrem duas leituras, e ambas entram no Capítulo 10:

1. Para o modelo de ameaça efetivamente documentado, a contribuição realista do
   sistema não é detecção primária — é **corroboração independente e detecção de
   falsificação de AIS**. O que é, note-se, exatamente a função de um instrumento
   de atribuição, e não de um sistema de alerta.
2. O regime não cooperativo permanece relevante como cenário, mas é
   **hipotético**: não há caso documentado que o instancie. Um trabalho que
   otimizasse o sistema para esse regime estaria otimizando para uma ameaça
   postulada, e a honestidade exige dizê-lo.

## Modelo completo e estudo de sensibilidade

Combinando os elementos, e condicionando ao regime $r \in \{\text{coop},
\text{n\~ao coop}\}$ e ao estrato ambiental $s$ do Capítulo 5:

$$P_{det}(D \mid r, s) \;=\; \mathbb{E}_{T_0}\!\left[ 1 - \big(1 - p(r, s)\big)^{N(T_0, D)} \right],$$

com $N(T_0, D)$ o número de passagens no intervalo $[T_0, T_0+D]$, obtido da
sequência reconstruída.

O estudo de sensibilidade percorre:

- **duração do evento**, de uma a doze horas;
- **latitude**, para exibir o ganho de passagens por ciclo e, simultaneamente, a
  perda por agrupamento — as duas curvas no mesmo eixo, já que é o balanço
  entre elas que importa;
- **configuração de constelação**, reproduzindo as condições vigentes em cada
  ano do período de interesse, o que permite responder quanto da não detecção
  dos incidentes de 2022 a 2024 é atribuível à configuração reduzida daquele
  período;
- **estrato de gelo e vento**, através de $p(r,s)$ medido no Capítulo 5;
- **regime cooperativo e não cooperativo**, separadamente e sem agregação.

## O teto e o que ele implica

O produto do capítulo é uma família de curvas de limite superior de revocação.
Nenhum classificador, por melhor que seja, pode exceder $P_{det}$: o que não foi
observado não pode ser classificado.

Isso fornece um critério de leitura para a literatura da área. Um trabalho que
reporte revocação acima do teto correspondente à sua cadência de observação está
medindo outra coisa — quase sempre por **condicionamento a eventos observados**:
constrói-se o conjunto de avaliação a partir de casos que se sabe terem sido
imageados, o que remove do denominador exatamente os eventos que o sistema
perderia. O viés é silencioso porque o conjunto resultante parece razoável;
apenas não corresponde à população sobre a qual o sistema operaria.

Declarar o teto tem ainda uma função construtiva. Ele torna comparáveis
propostas de melhoria heterogêneas: um ganho de revisita por incorporação de
outra constelação e um ganho de classificação por melhor detector passam a ser
mensuráveis na mesma escala, e é possível mostrar qual delas domina em cada
regime. A resposta esperada — e a verificar — é que no regime não cooperativo o
fator limitante seja a cadência de observação, não a qualidade do classificador,
o que implicaria que esforço adicional de modelagem tem retorno menor que acesso
a mais observações.

## Ameaças à validade

**Hipótese de início uniforme**, discutida acima: violada por evasão deliberada
e possivelmente por estrutura diurna do tráfego. Ambas verificáveis.

**Distribuição de duração mal estimada**, com base em um punhado de eventos.
Mitigada por reportar em função de $D$ em vez de integrar.

**Cobertura real ≠ cobertura catalogada.** A sequência reconstruída pressupõe
que cada aquisição catalogada seja utilizável; cenas com falha, cobertura
parcial do corredor ou modo inadequado precisam ser excluídas antes da contagem,
ou o teto sai otimista.

**Independência entre passagens.** O modelo trata $p_i$ como independentes entre
passagens dentro de uma mesma janela. A hipótese é frágil: passagens próximas no
tempo compartilham condição de gelo e de vento, de modo que a falha de uma torna
a falha da outra mais provável. O efeito reduz $P_{det}$ abaixo do valor
calculado, o que mantém o resultado como limite superior — mas a magnitude do
efeito deve ser estimada, e não apenas mencionada.
