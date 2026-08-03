# Método

Este capítulo descreve o sistema proposto. A seção 4.4 contém a primeira
contribuição original do trabalho — o corredor de risco condicionado por
batimetria — e a seção 4.6 fixa a forma da saída, que é uma razão de
verossimilhança e não um rótulo, por razões desenvolvidas no Capítulo 7.

## Visão geral

O sistema recebe uma aquisição SAR e o tráfego AIS correspondente, e produz,
para cada trajetória observada no corredor, uma medida calibrada da força da
evidência a favor da hipótese de arrasto de âncora, acompanhada dos elementos
que a sustentam. As etapas são:

1. **Pré-processamento** da cena, conforme a cadeia fixada no Capítulo 3;
2. **Detecção** de alvos pontuais por CFAR;
3. **Correspondência** entre detecções e posições AIS propagadas ao instante da
   aquisição, com correção do deslocamento em azimute;
4. **Restrição espacial** pelo campo de risco $R(\mathbf{x})$;
5. **Caracterização cinemática** das trajetórias remanescentes;
6. **Pontuação** por razão de verossimilhança calibrada.

Duas observações sobre a arquitetura. A primeira é que a etapa 4 é aplicada
*depois* da detecção e da correspondência, mas **define o espaço amostral sobre
o qual o desempenho é medido**: é a restrição do domínio, não um filtro
posterior de conveniência. A segunda é que a saída da etapa 3 não é descartada
quando há correspondência AIS. Diferentemente de um sistema de detecção de
embarcações escuras, aqui o alvo de interesse pode estar perfeitamente
identificado no AIS — o que importa é seu comportamento. A ausência de
correspondência é uma característica entre outras, não o critério de seleção.

## Detecção de alvos

A detecção opera sobre a intensidade calibrada, sem filtragem prévia de
*speckle*, pelas razões dadas no Capítulo 3.

Adota-se um detector CFAR com estatística de ordem, cuja robustez a
heterogeneidade da janela de referência e a alvos interferentes é preferível ao
ganho marginal do estimador por média em fundo homogêneo — e o fundo, neste
problema, raramente é homogêneo. A geometria do detector é definida por três
parâmetros: raio da janela de guarda, dimensionado para exceder a maior
embarcação esperada acrescida do borrão de movimento; raio da janela de
referência, dimensionado para conter amostras suficientes para a estimativa sem
atravessar estruturas de larga escala como bordas de gelo; e a ordem da
estatística empregada.

O limiar decorre da probabilidade de falso alarme por pixel especificada,
$P_{fa}$. Como observado no Capítulo 2, essa probabilidade é *por pixel*: para
uma cena com $N$ pixels válidos, o número esperado de falsos alarmes antes de
qualquer pós-processamento é

$$\mathbb{E}[N_{fa}] = N \cdot P_{fa},$$

de modo que valores nominalmente conservadores ainda produzem centenas de
detecções espúrias por cena. O Capítulo 5 estabelece $P_{fa}$ **por estrato de
gelo**, e não globalmente; esta seção fixa apenas a forma do detector.

O pós-processamento agrupa pixels detectados em objetos por conectividade,
descarta objetos de dimensão incompatível com embarcação e trata duas fontes
conhecidas de artefato: lóbulos laterais de alvos intensos, suprimidos por
critério de proximidade e razão de intensidade em relação ao alvo dominante; e
ambiguidades em azimute, cuja posição esperada é calculável a partir dos
parâmetros de aquisição e que são marcadas como candidatas a réplica quando
coincidem com essa previsão.

## Correspondência SAR–AIS

### Propagação das trajetórias

Cada trajetória AIS é propagada ao instante exato de aquisição $t_a$ a partir do
reporte imediatamente anterior, com velocidade e rumo reportados. A incerteza da
posição propagada cresce com o intervalo $\Delta t$ desde o último reporte e com
a taxa de guinada observada; trajetórias sob manobra recebem incerteza maior. O
ponto é relevante para este trabalho em particular porque, como notado no
Capítulo 2, embarcações em baixa velocidade reportam com menor frequência — e a
baixa velocidade é justamente a condição de interesse.

### Correção do deslocamento em azimute

Um alvo com velocidade radial $v_r$ aparece deslocado em azimute de

$$\Delta_{az} = \frac{R}{V}\, v_r,$$

onde $R$ é o alcance oblíquo e $V$ a velocidade da plataforma. A razão $R/V$ é
da ordem de uma centena de segundos para um sensor orbital, de modo que
velocidades radiais de poucos metros por segundo produzem deslocamentos de
centenas de metros — comparáveis ou superiores à janela de associação que se
usaria ingenuamente.

A correção é aplicada na direção do **modelo direto**, e não da inversão. Não se
tenta corrigir a posição da detecção SAR, cuja velocidade é desconhecida a
priori; projeta-se a velocidade reportada pelo AIS sobre a linha de visada do
radar, obtém-se $v_r$ e desloca-se a **posição prevista do candidato AIS** para
onde ele deveria aparecer na imagem. A associação é então feita no espaço da
imagem, entre a detecção observada e a posição prevista já deslocada. Essa
escolha elimina uma fonte sistemática de erro que, quando ignorada, produz
falsas embarcações escuras — o alvo simplesmente caiu fora da janela.

### Associação

A associação é resolvida como problema de atribuição. Define-se o custo entre a
detecção $i$ e o candidato AIS $j$ como a distância de Mahalanobis entre a
posição observada e a posição prevista, sob a covariância combinada da
propagação AIS, da geolocalização do produto e do resíduo da correção de
azimute. Pares cuja distância excede um limiar de *gating* são proibidos, e a
atribuição ótima sobre a matriz restante é obtida por algoritmo húngaro.

O tratamento dos resultados distingue três situações, e a distinção importa
porque o Capítulo 7 precisa saber de onde vêm os candidatos:

- **correspondência unívoca** — detecção associada a um único candidato dentro
  do *gate*;
- **correspondência ambígua** — mais de um candidato compatível, tipicamente em
  tráfego denso; a atribuição é registrada com marca de ambiguidade e não é
  tratada como evidência de nada;
- **sem correspondência** — nenhum candidato dentro do *gate*. Registra-se, sem
  atribuir causa, que essa condição admite as três explicações discutidas no
  Capítulo 2 — falha de recepção, ausência lícita ou desligamento, e
  falsificação — e que a última produz o efeito oposto, uma correspondência
  aparente e espúria, que este procedimento **não detecta**.

## Corredor de risco condicionado por batimetria

Esta seção contém a primeira contribuição do trabalho.

### O problema com o *buffer* fixo

A prática corrente na literatura de proteção de infraestrutura submarina define
a zona de interesse como um *buffer* de largura fixa em torno do traçado
publicado. A construção é geometricamente simples e fisicamente incorreta por
duas razões independentes: trata como equivalentes trechos em que uma âncora
alcança o fundo e trechos em que não alcança; e atribui ao traçado publicado uma
precisão que ele não possui.

A proposta é substituir o *buffer* por um campo escalar de risco
$R(\mathbf{x}) \in [0,1]$, definido sobre a superfície do mar, que expressa a
probabilidade de que uma interação de âncora naquele ponto seja fisicamente
capaz de danificar o cabo.

### Formulação

Fatoram-se três condições necessárias e aproximadamente independentes:

$$R(\mathbf{x}) = w_{prof}(\mathbf{x}) \cdot w_{fundo}(\mathbf{x}) \cdot w_{tra\varsigma}(\mathbf{x}).$$

Note-se que a viabilidade cinemática **não** aparece aqui, embora estivesse
prevista na formulação inicial do projeto. A razão é de coerência semântica:
$R$ é um campo espacial, uma propriedade do lugar, ao passo que a cinemática é
uma propriedade da trajetória. Fundi-las produziria um objeto que não é nem uma
coisa nem outra e impediria a ablação de cada componente. A cinemática é
tratada na seção 4.5 e combinada na 4.6.

### Componente de profundidade

Esta é a componente central, e a que se procura derivar de primeiros princípios
em vez de fixar por limiar arbitrário.

Uma âncora só interage com o fundo se a amarra disponível permitir que ela
alcance o leito com folga suficiente para que uma porção da amarra repouse
horizontalmente e a unha possa engatar. A razão entre o comprimento de amarra
lançado e a profundidade — a *relação de amarra* — precisa exceder um valor
mínimo $s$, tipicamente de alguns múltiplos. O comprimento total de amarra
disponível, $L$, é uma característica da embarcação: navios mercantes carregam
amarra em quantidade que escala com o porte, medida em quartéis de comprimento
padronizado.

A profundidade máxima em que uma dada embarcação pode produzir arrasto efetivo é
portanto

$$d_{max} = \frac{L}{s}.$$

Como $L$ varia com a classe e o porte da embarcação e $s$ tem alguma dispersão,
$d_{max}$ é uma variável aleatória sobre a **população de embarcações que
efetivamente transita no corredor**. A componente de profundidade é a função de
sobrevivência dessa variável:

$$w_{prof}^{0}(d) = \Pr\left( \frac{L}{s} \ge d \right) = 1 - F_{d_{max}}(d).$$

Esta é a diferença essencial em relação ao limiar fixo: a curva não é postulada,
é **estimada a partir da composição real da frota** no corredor, que o AIS
fornece por classe e porte. Um corredor por onde transitam grandes graneleiros
tem cauda mais longa que um corredor de cabotagem, e a mesma profundidade
representa risco diferente nos dois casos.

As ordens de grandeza envolvidas merecem registro, porque já indicam que o
resultado da derivação não coincide com o limiar usualmente adotado. A amarra é
medida em quartéis de 27,5 m, e navios mercantes portam algo entre dez e treze
quartéis por âncora, o que situa $L$ na casa das poucas centenas de metros. Com
as relações de amarra de 5:1 a 7:1 recomendadas para fundeio, a profundidade
máxima de fundeio projetada para a maior parte da frota mercante fica em torno
de 80 a 100 m, e o fundeio comercial efetivo raramente ultrapassa algumas
dezenas de metros. O valor de duzentos metros que circula como limiar de risco
é, portanto, **conservador por uma margem larga**: a derivação por primeiros
princípios produz um corredor consideravelmente mais restritivo que o
postulado, o que reforça a contribuição em vez de enfraquecê-la.

Uma distinção precisa ser feita com cuidado, e ela é a principal fonte de
incerteza da componente. A relação de amarra de 5:1 a 7:1 é a recomendada para
**fundeio seguro** — manter posição sob vento e corrente. A condição de
interesse aqui é diferente e menos exigente: basta que a âncora alcance o leito
e disponha de amarra suficiente para engatar e arrastar, o que ocorre com
relações menores. O valor de $s$ apropriado para *arrasto capaz de causar dano*
não está estabelecido na literatura com a mesma firmeza que o valor para
fundeio, e é sobre ele que a curva $w_{prof}^{0}$ é mais sensível. Trata-se $s$,
por isso, como variável aleatória com distribuição declaradamente incerta, e
reporta-se a sensibilidade de $\rho$ e do desempenho à sua especificação — em
vez de escolher um número e apresentá-lo como estabelecido.

Resta incorporar a incerteza batimétrica. Sendo $p(d \mid \mathbf{x})$ a
distribuição da profundidade verdadeira em $\mathbf{x}$, dada a célula da grade
e sua incerteza vertical,

$$w_{prof}(\mathbf{x}) = \int_{0}^{\infty} w_{prof}^{0}(d) \; p(d \mid \mathbf{x}) \; \mathrm{d}d .$$

A convolução resolve o problema levantado no Capítulo 3: a fronteira do corredor
deixa de ser uma isolinha da grade batimétrica — que seria em parte artefato de
compilação — e passa a ser uma transição suave cuja largura reflete a qualidade
do levantamento local. Onde a batimetria é bem conhecida, a transição é abrupta;
onde é esparsa, como em boa parte do Ártico, é larga. A incerteza aparece no
produto em vez de ser escondida por ele.

### Componente de tipo de fundo

A capacidade de engate depende do substrato: fundos moles permitem penetração,
enquanto fundo rochoso tende a fazer a âncora resvalar. A componente
$w_{fundo}$ atribui peso conforme a classe de substrato obtida de cartografia
pública de habitats de fundo.

Esta é reconhecidamente a componente mais frágil das três. A cartografia
disponível é grosseira, frequentemente interpolada a partir de amostragem
esparsa, e a relação entre classe de substrato e comportamento de âncora é
qualitativa. Além disso, o efeito é ambíguo quanto ao dano: uma âncora que
resvala sobre rocha penetra menos, mas não é por isso inofensiva a um cabo
exposto. Por essa razão, $w_{fundo}$ é implementada de forma conservadora —
sem zerar região alguma — e **é objeto de ablação explícita no Capítulo 9**. Se
sua remoção não alterar o desempenho, o resultado honesto é declarar que a
contribuição é de profundidade e traçado, não de substrato.

### Componente de traçado e a largura do corredor

Seja $r(\mathbf{x})$ a distância de $\mathbf{x}$ ao traçado publicado. A posição
verdadeira do cabo difere da publicada por um deslocamento transversal $\epsilon$
que se modela como gaussiano de desvio $\sigma_{tra\varsigma}$. Sendo $a$ a
meia-largura da faixa efetivamente varrida por uma âncora em arrasto,

$$w_{tra\varsigma}(\mathbf{x}) = \Pr\big( |r(\mathbf{x}) - \epsilon| \le a \big).$$

Como $\sigma_{tra\varsigma}$ é de ordens de grandeza superior a $a$, o resultado
aproxima-se de

$$w_{tra\varsigma}(\mathbf{x}) \approx \frac{2a}{\sigma_{tra\varsigma}} \, \phi\!\left( \frac{r(\mathbf{x})}{\sigma_{tra\varsigma}} \right),$$

com $\phi$ a densidade normal padrão. O perfil transversal do corredor é,
portanto, **a própria densidade da incerteza do traçado**, e sua largura efetiva
é determinada por $\sigma_{tra\varsigma}$ — não por uma escolha do analista.

Esse resultado formaliza a conclusão do orçamento de incerteza do Capítulo 3:
não há corredor mais estreito que a ignorância sobre onde o cabo está. Um
sistema que declarasse largura inferior estaria reportando precisão fictícia. Ao
mesmo tempo, o corredor assim definido é enormemente mais restritivo que um
*buffer* fixo generoso, porque decai suavemente em vez de terminar em uma borda
arbitrária, e porque é multiplicado pelas outras duas componentes.

A estimativa de $\sigma_{tra\varsigma}$ é ela própria um problema, já que os
operadores não publicam a incerteza de seus traçados. Adota-se a estratégia de
tratá-la como parâmetro e reportar os resultados como função dela, em vez de
fixar um valor não fundamentado — a sensibilidade do desempenho a
$\sigma_{tra\varsigma}$ é um resultado do Capítulo 9.

### Redução do espaço de busca

A grandeza que quantifica a contribuição é a razão entre a área de um *buffer*
convencional de meia-largura $W$ e a área efetiva do campo de risco:

$$\rho = \frac{|\{\mathbf{x} : r(\mathbf{x}) \le W\}|}{\int R(\mathbf{x})\, \mathrm{d}\mathbf{x}}.$$

O denominador é uma área efetiva, no sentido de que um campo de risco que
valesse um dentro de uma região e zero fora reproduziria a área dessa região.
A hipótese a testar é que $\rho$ seja de ordens de magnitude, e que o ganho de
precisão associado seja proporcional — porque a taxa de falso alarme escala com
a área observada, ao passo que os eventos de interesse, por construção física,
não ocorrem fora do suporte de $R$.

## Análise cinemática de trajetória

Restringido o domínio, caracteriza-se o comportamento de cada trajetória. Os
descritores são escolhidos por corresponderem a condições necessárias do
fenômeno físico, não por desempenho empírico:

**Velocidade sustentada em faixa compatível.** O arrasto capaz de romper um cabo
ocorre em uma faixa intermediária: abaixo dela a embarcação está essencialmente
à deriva e a energia transmitida é baixa; acima, a âncora tende a não se manter
engatada. Mede-se a fração do tempo em que a velocidade permanece na faixa e a
duração do trecho contínuo mais longo.

**Persistência de rumo.** O arrasto prolongado produz rumo estável, distinto
tanto da manobra de aproximação de porto quanto do padrão de mudanças
frequentes característico da pesca de arrasto em área.

**Geometria em relação ao cabo.** Ângulo de cruzamento e comprimento do trecho
percorrido dentro do suporte de $R$, ponderado por $R$ ao longo da trajetória.

**Desaceleração anômala.** A queda de velocidade não explicada por manobra
portuária, encontro com gelo ou estado de mar — as três explicações alternativas
são testadas contra os dados de gelo e ERA5 do Capítulo 3 antes de o descritor
ser considerado anômalo.

**Cinemática instantânea a partir de uma única cena.** Conforme o Capítulo 2, o
deslocamento em azimute e a esteira fornecem estimativas de velocidade
independentes do AIS. Elas cumprem dois papéis: permitem caracterizar
parcialmente alvos sem correspondência, para os quais não há trajetória; e
permitem **verificar** a velocidade reportada por um alvo com correspondência,
o que é o único mecanismo do sistema capaz de expor falsificação de AIS.

## Pontuação e classificação

### Por que não um rótulo

Sob a prevalência estabelecida no Capítulo 7, um classificador binário é
ativamente enganoso: a esmagadora maioria de seus positivos será falsa,
independentemente da qualidade do detector, e o rótulo "positivo" comunica uma
confiança que a evidência não sustenta. O problema não se resolve ajustando o
limiar; é estrutural.

### Razão de verossimilhança

Adota-se como saída a razão de verossimilhança entre as duas hipóteses:

$$\Lambda(\mathbf{o}) = \frac{p(\mathbf{o} \mid H_{arrasto})}{p(\mathbf{o} \mid H_{rotina})},$$

onde $\mathbf{o}$ reúne os descritores cinemáticos, o perfil de $R$ ao longo da
trajetória, o estado de correspondência AIS e as covariáveis ambientais. Sob a
regra de Bayes em forma de razão de chances,

$$\underbrace{\frac{\Pr(H_{arrasto} \mid \mathbf{o})}{\Pr(H_{rotina} \mid \mathbf{o})}}_{\text{chance posterior}} = \Lambda(\mathbf{o}) \cdot \underbrace{\frac{\Pr(H_{arrasto})}{\Pr(H_{rotina})}}_{\text{chance a priori}} .$$

A separação é o ponto. **O sistema estima $\Lambda$; ele não estima a chance a
priori, e não deve fingir que estima.** A prevalência do fenômeno é uma
propriedade do corredor, do período e do contexto — e é, como o Capítulo 7
demonstra, extremamente baixa. Ao entregar $\Lambda$ acompanhado da evidência
que o compõe, o sistema fornece exatamente aquilo que pode fundamentar, e deixa
a combinação com o *a priori* explícita e auditável em vez de embutida.

Essa escolha tem três consequências que atravessam o restante da dissertação.
Ela torna a saída **componível** com informação que o sistema não possui — o
histórico do navio, o contexto geopolítico, a existência de uma falha de cabo
registrada. Ela torna o custo assimétrico do Capítulo 7 aplicável de forma
transparente, já que o limiar de ação passa a ser uma decisão declarada sobre
chance posterior e custo, e não um artefato interno do classificador. E ela é,
como se argumenta no Capítulo 10, a forma natural de um **instrumento de
atribuição**: força de evidência é precisamente o que um sistema técnico pode
oferecer a um processo de decisão que não lhe pertence.

### Estimação e calibração

$\Lambda$ é estimada por modelo generativo simples sobre os descritores, com os
dois termos ajustados separadamente: o denominador a partir do tráfego real do
corredor, que é abundante e majoritariamente rotineiro; o numerador a partir das
trajetórias sintéticas injetadas descritas no Capítulo 8, complementadas pelos
poucos eventos reais disponíveis.

A calibração — verificar que um valor declarado de $\Lambda$ corresponde à força
de evidência efetivamente observada — é feita sobre o conjunto sintético e
verificada nos casos reais sob protocolo *leave-one-event-out*. Reporta-se a
qualidade da calibração, e não apenas a capacidade de ordenação, porque um
$\Lambda$ mal calibrado destrói toda a utilidade da separação acima: ele
reintroduz, de forma oculta, exatamente o excesso de confiança que a formulação
pretendia evitar.

### Saída

Para cada trajetória avaliada, o sistema emite: o valor de $\Lambda$ com
intervalo de incerteza; a decomposição por descritor; o perfil de $R$ ao longo
da trajetória; as covariáveis ambientais que sustentam ou enfraquecem as
explicações alternativas; e as marcas de ambiguidade de correspondência. O
conjunto — e não o número isolado — é o produto do sistema.
