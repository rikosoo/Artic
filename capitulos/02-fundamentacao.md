# Fundamentação teórica e trabalhos relacionados

Este capítulo reúne os fundamentos necessários para sustentar o método do
Capítulo 4 e, sobretudo, para justificar os limites investigados nos Capítulos 5
a 7. A ordem de exposição segue a cadeia física do problema: como o radar
enxerga o mar, como um alvo é extraído dessa observação, o que o rastreamento
cooperativo acrescenta e onde ele falha, como a fusão entre os dois foi
explorada até aqui, o que se sabe sobre danos a cabos e, por fim, o que o gelo
marinho faz com todas essas premissas. A seção final identifica a lacuna que o
trabalho ocupa.

## SAR marítimo

### Formação da imagem

O radar de abertura sintética obtém resolução em azimute muito superior à
permitida pela abertura física da antena sintetizando, por processamento
coerente, uma antena de comprimento equivalente ao trecho de órbita percorrido
enquanto o alvo permanece iluminado. A resolução em alcance decorre da largura
de banda do pulso transmitido, e a resolução em azimute torna-se, no limite
teórico, independente da distância — propriedade que viabiliza o imageamento de
alta resolução a partir de órbita [@oliver2004].

Duas consequências desse princípio importam diretamente a este trabalho e serão
retomadas adiante: a imagem é uma medida coerente, e portanto afetada por
*speckle*, o que condiciona toda a estatística de detecção discutida na seção
seguinte; e a compressão em azimute pressupõe que o alvo esteja estacionário
durante o intervalo de síntese, premissa que embarcações em movimento violam.

### Retroespalhamento da superfície do mar

Em ângulos de incidência moderados — a faixa usual dos sensores orbitais — o
retroespalhamento da superfície do mar é dominado por ressonância de Bragg com
ondas capilares e de gravidade curtas, de comprimento comparável ao do
comprimento de onda do radar projetado na superfície. Para a banda C, com
comprimento de onda em torno de 5,5 cm, isso corresponde a ondulações de escala
centimétrica, geradas e mantidas pelo vento local.

A implicação prática é que **o mar só é visível ao radar porque há vento**. Em
condições de calmaria, a superfície aproxima-se de um refletor especular, o
retroespalhamento cai e a cena escurece; com vento forte, a rugosidade aumenta
e o sinal de fundo sobe. Nenhum dos dois extremos é benigno para detecção de
embarcações: no primeiro, a superfície escura eleva o contraste com o alvo, mas
áreas de baixo retroespalhamento por outras causas — manchas de óleo,
estabilização por gelo novo, sombras de vento a sotavento de costa — passam a
mimetizar a assinatura de água calma e complicam a segmentação; no segundo, o
clutter sobe e alvos pequenos desaparecem sob ele. A dependência do desempenho
em relação ao estado de mar é, portanto, não monotônica, e é uma das razões
pelas quais a avaliação do Capítulo 5 precisa ser estratificada também por
vento, e não apenas por concentração de gelo.

### A assinatura de uma embarcação

Uma embarcação metálica produz retroespalhamento intenso por dois mecanismos
principais: reflexão em estruturas de canto formadas entre superestrutura,
convés e casco, e o diedro casco–superfície, que devolve energia na direção do
sensor com alta eficiência. O resultado é um alvo tipicamente muito mais
brilhante que o fundo, o que torna a detecção conceitualmente simples — e é
justamente essa simplicidade aparente que torna o problema de falsos positivos
tão severo quando o fundo deixa de se comportar como mar aberto.

Três fenômenos secundários merecem registro porque são explorados no método:

**Deslocamento em azimute de alvos móveis.** A componente radial da velocidade
do alvo introduz uma rampa de fase adicional durante a síntese de abertura, e o
processador a interpreta como deslocamento em azimute. O deslocamento é
proporcional à razão entre o alcance oblíquo e a velocidade da plataforma,
multiplicada pela velocidade radial do alvo. Para um sensor orbital típico, essa
razão é da ordem de uma centena de segundos, de modo que velocidades radiais de
poucos metros por segundo produzem deslocamentos de centenas de metros
[@raney1971]. Isso tem duas consequências opostas e igualmente relevantes: é
uma fonte sistemática de erro no casamento com AIS, capaz de deslocar um alvo
para fora da janela de associação; e é, ao mesmo tempo, uma **medida de
velocidade radial obtida de uma única aquisição**.

**Esteiras.** A esteira de uma embarcação — os braços do padrão de Kelvin, a
esteira turbulenta central e, quando presente, a esteira estreita em V —
frequentemente aparece na imagem SAR e permite estimar rumo e, sob hipóteses,
módulo de velocidade a partir de uma única cena [@eldhuset1996].

**Ambiguidades e artefatos.** A amostragem finita em azimute produz réplicas
deslocadas de alvos brilhantes, e lóbulos laterais de alvos intensos podem
ultrapassar o limiar de detecção. São fontes conhecidas de falso alarme e
precisam de tratamento explícito no pipeline.

O ponto que se retira desta subseção, e que reaparece no Capítulo 6, é que uma
única aquisição SAR não fornece apenas presença: fornece presença mais uma
estimativa parcial de cinemática instantânea. Isso mitiga — sem eliminar — a
limitação imposta pela revisita esparsa, porque não é estritamente necessário
observar duas passagens para afirmar algo sobre movimento.

### O Sentinel-1

A missão Sentinel-1, do programa Copernicus, opera em banda C com política de
dados aberta, o que a torna a base natural de qualquer trabalho que se proponha
reprodutível [@torres2012]. Três características condicionam seu uso no Ártico.

A primeira é o **modo de aquisição**. Sobre a maior parte das áreas costeiras e
continentais, o modo predominante é o *Interferometric Wide swath* (IW), com
faixa de aproximadamente 250 km e resolução da ordem de poucas dezenas de metros
no produto GRD. Sobre regiões polares e áreas cobertas por gelo, no entanto, o
modo usual é o *Extra Wide swath* (EW), que amplia a faixa para cerca de 400 km
ao custo de uma resolução substancialmente mais grosseira. A troca é deliberada
e faz sentido para monitoramento de gelo, mas é adversa para este trabalho:
**exatamente na região de interesse, o sensor opera no modo de menor
resolução**, elevando o tamanho mínimo de embarcação detectável. Verificar qual
modo cobre efetivamente o corredor escolhido é, por isso, uma tarefa do
Capítulo 3 e não um detalhe de implementação.

A segunda é a **polarização**. Sobre oceano, a combinação usual é VV com VH;
sobre gelo, HH com HV. A razão entre co- e cross-polarização é informativa para
separar superfície metálica de gelo deformado, e essa possibilidade é avaliada
como mitigação no Capítulo 5 — mas depende de qual par polarimétrico foi
efetivamente adquirido, o que novamente remete à política de aquisição.

A terceira é a **revisita**. O ciclo de repetição orbital nominal de cada
satélite é de doze dias, e a constelação reduz esse valor por um fator igual ao
número de satélites operacionais. Esse número, porém, descreve mal a situação
em alta latitude: a convergência das órbitas quase polares faz com que faixas
adjacentes se sobreponham cada vez mais à medida que a latitude cresce, de modo
que a frequência efetiva de observação em regiões árticas é substancialmente
maior que a nominal. Duas ressalvas se impõem. Primeiro, o ganho é geográfico e
precisa ser calculado para o corredor específico, não assumido. Segundo, a
composição da constelação variou ao longo do período de interesse — a perda de
um satélite ao final de 2021 e a incorporação de um substituto ao final de 2024
alteraram a revisita disponível justamente durante os anos em que ocorreram os
incidentes usados como casos de validação no Capítulo 8. Reconstruir a revisita
*efetivamente disponível em cada data*, e não a nominal da missão, é requisito
do modelo do Capítulo 6.

## Detecção de embarcações em imagens SAR

### O detector CFAR

A família de detectores CFAR (*Constant False Alarm Rate*) domina a detecção de
alvos pontuais em SAR. O princípio é local e adaptativo: para cada pixel sob
teste, estima-se a estatística do clutter a partir de uma janela de referência
que o circunda, separada por células de guarda destinadas a impedir que energia
do próprio alvo contamine a estimativa; o limiar de decisão é então calculado de
modo a manter constante a probabilidade de falso alarme sob a distribuição
assumida para o fundo.

As variantes diferem na forma de estimar o fundo. O CA-CFAR usa a média das
células de referência e é ótimo sob clutter homogêneo, mas degrada
acentuadamente quando a janela contém alvos interferentes ou uma transição de
textura. O OS-CFAR substitui a média por uma estatística de ordem, ganhando
robustez a alvos múltiplos e a bordas ao custo de alguma perda de detecção em
fundo homogêneo [@rohling1983]. Variantes com censura automática buscam
identificar e descartar amostras contaminadas antes de estimar o limiar
[@gao2009].

### As premissas — e onde elas quebram

A escolha da distribuição de clutter é o ponto sensível. Para SAR de intensidade
sobre fundo homogêneo e muitas visadas, aproximações exponenciais ou gama são
razoáveis; para clutter de mar com textura de larga escala, a distribuição K é a
referência clássica [@ward1981], e alternativas como Weibull, log-normal e a
família G0 são usadas conforme a resolução e o estado de mar. Todas essas
famílias foram desenvolvidas e validadas sobre **mar aberto**.

Duas premissas sustentam o desempenho anunciado de qualquer CFAR:
**homogeneidade** da janela de referência e **aderência** do fundo à
distribuição assumida. O ambiente deste trabalho viola ambas de maneira
sistemática, e não ocasional:

- junto à borda de gelo, a janela de referência atravessa uma descontinuidade
  de textura, e a estimativa de fundo torna-se um híbrido de dois regimes;
- gelo deformado e cristas de compressão produzem retroespalhamento intenso e
  espacialmente concentrado, que é precisamente a assinatura que o detector foi
  construído para encontrar;
- em zonas de tráfego denso, alvos interferentes na janela elevam o limiar e
  produzem mascaramento mútuo.

Há ainda um ponto aritmético que costuma ser subestimado e que conecta este
capítulo diretamente ao Capítulo 7: a probabilidade de falso alarme do CFAR é
definida **por pixel**. Uma cena de faixa larga contém tipicamente centenas de
milhões de pixels, de modo que mesmo uma taxa nominal da ordem de 10⁻⁶ produz
centenas de falsos alarmes por cena antes de qualquer filtragem. O número de
detecções brutas nunca é o número de embarcações, e a distância entre os dois é
onde reside a maior parte do trabalho de engenharia — e do risco metodológico.

### Abordagens por aprendizado profundo

Detectores baseados em redes convolucionais e arquiteturas de detecção de
objetos superam consistentemente o CFAR em conjuntos de referência, e o próprio
trabalho de @paolo2024 apoia-se em segmentação por rede profunda. A adoção
dessa linha aqui esbarra, contudo, em uma restrição que atravessa toda a
dissertação: conjuntos de treinamento anotados para SAR marítimo são
predominantemente de mar aberto e de latitudes médias, e o desempenho anunciado
não transfere automaticamente para cenas dominadas por gelo. Como o Capítulo 8
detalha, o problema deste trabalho é precisamente a escassez de rótulos no
domínio de interesse. Um detector clássico, cujo comportamento sob violação de
premissa pode ser caracterizado analiticamente, é preferível a um detector
estatisticamente superior cuja degradação fora do domínio de treinamento não é
inspecionável — sobretudo porque **caracterizar a degradação é o objetivo do
Capítulo 5**, e não um obstáculo a contornar.

## Sistema de identificação automática (AIS)

### Natureza e obrigatoriedade

O AIS é um sistema de radiodifusão cooperativa em VHF, concebido para segurança
da navegação e prevenção de abalroamento, não para vigilância. A distinção não é
retórica: o sistema pressupõe boa-fé do emissor, e toda a sua utilidade para
fins de fiscalização é um subproduto. A obrigatoriedade decorre da Convenção
SOLAS e alcança, em linhas gerais, embarcações acima de determinada arqueação em
viagem internacional e navios de passageiros, com regimes complementares
adotados regionalmente — notadamente para embarcações de pesca acima de certo
comprimento na União Europeia [@solas_v19]. Embarcações abaixo desses limiares
podem operar legalmente sem transmitir, o que estabelece um piso irredutível de
"embarcações escuras" perfeitamente lícitas.

Os transponders dividem-se em Classe A, de maior potência e maior taxa de
reporte, com intervalos que variam de poucos segundos em navegação a alguns
minutos em fundeio, e Classe B, de menor potência e cadência mais esparsa. A
variação da taxa de reporte com velocidade e manobra é relevante para o
casamento: uma embarcação em movimento lento reporta com menos frequência, o que
é exatamente a condição cinemática de interesse deste trabalho.

### Recepção terrestre e satelital

Estações costeiras oferecem recepção confiável dentro do alcance VHF, mas a
densidade dessa infraestrutura no Ártico é baixa, e em grande parte da área de
interesse ela é simplesmente inexistente. A cobertura depende, portanto, de AIS
satelital.

A recepção por satélite tem duas limitações estruturais. A primeira é de
**colisão de mensagens**: o protocolo de acesso ao meio foi dimensionado para a
célula de alcance de uma estação costeira, e a pegada de um satélite abrange
muitas dessas células simultaneamente, de modo que em áreas de tráfego denso
mensagens de embarcações distintas se sobrepõem e a probabilidade de detecção
cai [@carsonjackson2012]. O Báltico — origem de praticamente todo o conjunto de
validação do Capítulo 8 — está entre as regiões de maior densidade de tráfego do
mundo, e é exatamente onde essa degradação é maior. A segunda é de **latência**,
já que a mensagem só chega ao usuário após o *downlink*.

Convém corrigir aqui uma imprecisão comum: em termos de *passagens*, a cobertura
satelital em alta latitude é boa, pelo mesmo argumento de convergência orbital
que favorece o SAR. O problema ártico do AIS não é a frequência de passagem, mas
a ausência de recepção terrestre complementar, a latência e a probabilidade de
detecção por mensagem. Formular a limitação corretamente importa, porque as
mitigações são distintas.

### As três formas de ausência

Um alvo detectado no SAR sem correspondência no AIS admite três explicações
qualitativamente diferentes, e a literatura frequentemente as trata como uma só:

1. **Falha de recepção** — a embarcação transmitiu, mas a mensagem não foi
   recebida, por colisão, geometria ou lacuna de cobertura;
2. **Ausência lícita ou desligamento** — a embarcação não é obrigada a
   transmitir, ou desligou o equipamento, conduta que pode ser irregular sem ser
   indício de qualquer outra coisa;
3. **Falsificação** — a embarcação transmite identidade ou posição incorretas,
   por manipulação do equipamento ou por interferência no sinal de
   posicionamento por satélite, prática documentada em várias regiões
   [@gfw_aisgaps].

A terceira é a mais problemática para este trabalho, porque produz
correspondência aparente: existe uma posição AIS onde o alvo SAR está, o alvo é
classificado como cooperativo e sai do conjunto de candidatos. É um mecanismo de
**falso negativo**, não de falso positivo, e por isso não aparece nas métricas
usuais de detecção de embarcação escura. Registrá-lo explicitamente é parte da
honestidade metodológica que o Capítulo 7 exige.

## Fusão SAR–AIS e detecção de anomalias

### O casamento e seu precedente

A ideia de associar detecções SAR a posições AIS para isolar embarcações não
cooperativas é anterior aos trabalhos recentes, mas foi @paolo2024 quem a
executou em escala verdadeiramente global, sobre vários anos de acervo
Sentinel-1, estabelecendo que uma fração majoritária da atividade de pesca
industrial detectável não aparece nos sistemas públicos de rastreamento, e que
uma parcela significativa da atividade de transporte e energia tampouco aparece.
O trabalho fornece a este a arquitetura de referência do casamento e a definição
operacional de embarcação escura.

O que não se transfere merece registro explícito, porque define o espaço da
contribuição. O domínio daquele trabalho é global e majoritariamente de mar
aberto e latitudes baixas e médias, onde a estatística de clutter é
bem-comportada e a cobertura AIS é densa; a saída de interesse é a *presença* de
embarcações não rastreadas, agregada estatisticamente. Aqui, o domínio é um
corredor estreito em ambiente com gelo, a cobertura AIS é estruturalmente
limitada, e a saída de interesse não é presença mas **comportamento**: o alvo
relevante pode estar perfeitamente visível no AIS e ainda assim ser o alvo. O
casamento SAR–AIS deixa de ser o produto final e passa a ser uma etapa
intermediária.

Do ponto de vista técnico, o casamento envolve interpolar a trajetória AIS para
o instante exato da aquisição, definir uma janela de associação espaço-temporal
e resolver a atribuição entre conjuntos por minimização de custo. As fontes de
erro são conhecidas: intervalo entre reportes, incerteza de interpolação sob
manobra e — recorrendo à seção 2.1 — o deslocamento em azimute de alvos com
velocidade radial, que pode ser de centenas de metros e é frequentemente
omitido.

### Detecção de anomalias em tráfego marítimo

Há uma literatura extensa e madura sobre detecção de comportamento anômalo a
partir de AIS, apoiada em agrupamento de trajetórias, extração de rotas usuais e
modelagem probabilística do desvio em relação a elas [@pallotta2013]. Ela
fornece as ferramentas para caracterizar o que é cinematicamente atípico em um
corredor.

Sua limitação para o problema aqui é conceitual, e antecipa o argumento do
Capítulo 7: esses métodos detectam **desvio em relação ao padrão**, e desvio não
é intenção. Em um corredor onde operam arrasteiros, embarcações desviando de
gelo, navios reduzindo velocidade por mau tempo e navios de manutenção do
próprio cabo, o comportamento estatisticamente atípico é abundante e quase
sempre inocente. A literatura de anomalia costuma reportar desempenho sobre
conjuntos em que os positivos são artificialmente frequentes; sob a prevalência
real do fenômeno de interesse, as mesmas métricas descrevem um sistema muito
diferente. É essa distância entre o que se mede e o que se afirma que o Capítulo
7 se propõe a quantificar em vez de mencionar.

## Danos a cabos submarinos

Falhas em cabos submarinos são fenômeno corriqueiro e bem documentado pela
indústria: a ordem de grandeza é de mais de uma centena de eventos por ano em
escala global, com a ampla maioria atribuível a atividade humana, e com pesca de
arrasto e ancoragem dividindo a maior parte dos casos de causa determinada
[@icpc_danos; @carter2009]. Três fatos dessa literatura estruturam o método do
Capítulo 4.

**A distribuição por profundidade é fortemente concentrada.** A quase totalidade
dos danos antrópicos ocorre em plataforma continental e águas rasas, porque é
onde âncora e arte de pesca alcançam o fundo. Em águas profundas o cabo repousa
livre e praticamente inacessível. Essa é a base física do corredor de risco
condicionado por batimetria: a variável que separa risco de não-risco não é
distância ao cabo, é profundidade.

**A prática de proteção reflete esse fato.** Operadores enterram o cabo em
trechos rasos, precisamente contra interação com pesca e ancoragem, e o deixam
exposto em profundidade. A existência dessa prática é evidência de que a
indústria já opera com um modelo de risco condicionado por profundidade — o que
torna mais notável que a literatura de detecção continue a definir zonas de
interesse por *buffer* de distância fixa.

**A causa acidental dominante é também o confundidor dominante.** Se a pesca de
arrasto é historicamente a principal causa acidental de dano, então a assinatura
cinemática de interesse é, na maior parte das ocorrências, produzida por
atividade lícita. Essa não é uma limitação do sensor; é uma propriedade da
distribuição de causas. O Capítulo 7 desenvolve a consequência.

## Sensoriamento remoto de gelo marinho

### Retroespalhamento

O comportamento do gelo marinho em banda C depende de idade e de história
térmica. Gelo multiano, submetido a ciclos de derretimento que reduzem a
salinidade e deixam a estrutura porosa, apresenta espalhamento de volume
apreciável e retroespalhamento tipicamente mais alto que o gelo de primeiro ano
liso, cujo retorno é dominado pela rugosidade de superfície [@dierking2013].
Essa separação, contudo, é sistematicamente perturbada por dois fatores. O
primeiro é a **deformação**: cristas de compressão, blocos e gelo empilhado por
sobreposição produzem retorno intenso e localizado independentemente da idade —
e são a fonte direta do problema do Capítulo 5. O segundo é a **estação**: sob
condições de derretimento superficial, a água livre na superfície altera
radicalmente as propriedades dielétricas e as assinaturas de gelo de diferentes
idades tendem a convergir.

Água aberta rugosa por vento pode atingir, em co-polarização, níveis
comparáveis aos de gelo, o que torna a discriminação gelo/água ambígua em
condições de vento forte. A polarização cruzada oferece, em geral, melhor
separabilidade, porque a água aberta apresenta retorno cruzado muito baixo
enquanto o gelo mantém contribuição de volume — propriedade que fundamenta a
mitigação avaliada no Capítulo 5.

### Produtos de concentração e o problema de escala

A estratificação experimental do Capítulo 5 exige uma medida de concentração de
gelo casada temporalmente com cada aquisição. As fontes operacionais usuais
derivam de radiômetros passivos em micro-ondas [@osisaf], complementadas por
cartas de gelo produzidas por serviços nacionais.

Há aqui uma incompatibilidade de escala que precisa ser declarada em vez de
silenciada: os produtos de concentração por micro-ondas passivas têm resolução
espacial de quilômetros a dezenas de quilômetros, contra pixels de dezenas de
metros na imagem SAR — uma diferença de três ordens de grandeza. Uma célula de
concentração cobre uma área em que a imagem SAR distingue água aberta, banquisa
consolidada e fragmentos individuais. Isso implica que a variável de
estratificação é, na melhor das hipóteses, um descritor de contexto regional,
não uma caracterização local do fundo sob o alvo. A zona marginal de gelo — onde
a heterogeneidade dentro de uma célula é máxima — é justamente onde o descritor
é menos informativo e onde o problema de detecção é mais agudo. O Capítulo 5
trata essa limitação explicitamente, e ela é uma das razões para complementar a
estratificação por concentração com descritores de textura extraídos da própria
imagem.

## Lacuna identificada

Os ramos revisados são individualmente maduros. A detecção CFAR em SAR está
consolidada há décadas; a fusão SAR–AIS foi levada à escala global e validada;
a detecção de anomalias em AIS dispõe de uma literatura ampla; a estatística de
danos a cabos é documentada pela indústria; e o sensoriamento de gelo em banda C
é área estabelecida. O que não existe é o trabalho que os articula sob as
restrições simultâneas deste problema.

Concretamente, não se identificou trabalho que reúna:

1. **definição do espaço de busca por condicionamento físico** — profundidade,
   tipo de fundo e viabilidade cinemática — em vez de *buffer* geométrico em
   torno do traçado, embora a própria prática de enterramento seletivo da
   indústria de cabos evidencie que o risco é condicionado por profundidade;
2. **caracterização quantitativa da degradação do detector em função do gelo**,
   com a incompatibilidade de escala entre produto de concentração e imagem
   tratada de frente, em vez de mascaramento binário de áreas com gelo;
3. **modelagem explícita do acoplamento entre revisita e duração do evento**,
   estabelecendo um teto de desempenho anterior a qualquer escolha de
   classificador;
4. **avaliação sob a prevalência real do fenômeno**, com protocolo de métricas
   coerente com o desbalanceamento extremo [@saito2015] e com custo assimétrico
   de erro.

Os itens 1 a 3 correspondem às três contribuições enunciadas no Capítulo 1. O
item 4 não é uma contribuição isolada, mas a exigência metodológica que
atravessa os demais e que, como se argumenta no Capítulo 7, determina o que o
sistema pode legitimamente afirmar. Os capítulos seguintes desenvolvem cada um
deles, começando pelos dados que os tornam verificáveis.
