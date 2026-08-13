# Introdução

## Por que radar de abertura sintética

Acima do Círculo Polar Ártico, o Sol não nasce durante semanas ou meses a cada
inverno — em latitudes próximas a 78° N, a noite polar dura cerca de quatro
meses ininterruptos. Quando o Sol retorna, encontra uma região onde a cobertura
de nuvem baixa e a névoa marinha são persistentes durante boa parte do verão,
sobretudo sobre a zona marginal de gelo, onde o contraste térmico entre água
aberta e superfície congelada alimenta nebulosidade quase permanente. O
resultado é que qualquer sistema de observação da superfície do mar que dependa
de luz solar refletida — imageamento óptico e multiespectral, incluindo os
sensores de alta resolução hoje disponíveis comercialmente — permanece cego ao
longo de uma fração substancial do ano, e cego precisamente durante o período de
menor tráfego observado e maior dificuldade de resposta.

O radar de abertura sintética (*Synthetic Aperture Radar*, SAR) não compartilha
nenhuma dessas dependências. Por ser um sensor ativo operando em micro-ondas, ele
ilumina o alvo com energia própria e opera com igual desempenho em noite polar
plena; nos comprimentos de onda usados em sensoriamento marítimo — banda C, em
torno de 5,4 GHz, no caso do Sentinel-1 [@torres2012] — a atenuação atmosférica
por nuvem e por precipitação não convectiva é pequena o suficiente para ser
desprezável na maior parte das aquisições. SAR é, portanto, o único imageamento
com disponibilidade efetivamente contínua sobre o Ártico. Essa não é uma
preferência metodológica entre alternativas comparáveis, nem uma escolha
justificada por custo ou conveniência de acesso: é a única modalidade de
observação por imagem que funciona o ano inteiro na região de interesse. Todo o
restante deste trabalho decorre dessa restrição — inclusive suas limitações mais
severas, porque adotar SAR significa também herdar sua estatística de clutter,
sua sensibilidade a estado de mar e, sobretudo, sua cadência de revisita.

## Cabos submarinos como infraestrutura crítica

Aproximadamente toda a comunicação intercontinental de dados trafega por cabos
submarinos de fibra óptica. Trata-se de uma infraestrutura simultaneamente
essencial e fisicamente frágil: o cabo típico em águas profundas tem diâmetro
comparável ao de uma mangueira de jardim e repousa diretamente sobre o fundo,
sem qualquer proteção além do próprio isolamento; apenas em trechos rasos, onde
o risco de interação com atividade humana é reconhecidamente maior, ele é
enterrado ou revestido com armação metálica [@carter2009].

O Ártico deixou de ser periférico nessa geografia. A retração progressiva do
gelo marinho tornou economicamente viáveis rotas de cabo transárticas que
encurtam substancialmente a latência entre Europa e Ásia em relação às rotas
convencionais, e dois sistemas de grande porte estão em implantação: o *Polar
Express*, ao longo da costa ártica russa, com cerca de 12 650 km e capacidade
projetada da ordem de dezenas a uma centena de terabits por segundo, com
segmentos entrando em serviço a partir de 2026; e o *Far North Fiber*, de
aproximadamente 17 000 km, ligando Japão e Europa pela passagem noroeste com
aterragens no Alasca, no Ártico canadense, na Groenlândia, na Noruega, na
Finlândia e na Irlanda [@subnet_polarexpress; @subnet_farnorthfiber].

A mesma retração ampliou a navegabilidade das rotas marítimas do Nordeste e do
Noroeste, com aumento correspondente do tráfego mercante. As duas tendências
convergem geograficamente: o mesmo afinamento de gelo que viabiliza o cabo
viabiliza o navio que pode danificá-lo, e ambos se concentram nos mesmos
corredores rasos e estreitos, junto às aproximações costeiras. O ativo a
proteger, portanto, está sendo instalado agora, e no mesmo espaço em que a
ameaça cresce.

## Satélite não substitui cabo

Uma objeção natural ao problema assim formulado é que a conectividade por
satélite em órbita baixa teria tornado os cabos menos críticos — e o Ártico
seria, à primeira vista, o caso em que essa substituição mais faria sentido,
dada a dificuldade e o custo de instalar e reparar cabos na região. A objeção
merece resposta explícita, porque, se procedesse, esvaziaria a motivação do
trabalho.

Ela procede em parte, e é importante reconhecer onde. Para conectividade
*local* em alta latitude, as constelações em órbita baixa representam uma
mudança qualitativa: comunidades e embarcações árticas que dependiam de enlaces
geoestacionários com latência acima de meio segundo passaram a dispor de
latências de algumas dezenas de milissegundos. A cobertura polar, inicialmente
limitada, foi estendida por planos orbitais de alta inclinação e por malhas de
enlaces ópticos entre satélites, que dispensam estações terrestres em território
remoto — exatamente a limitação que tornava a alta latitude difícil de servir
[@starlink_polar].

Ela não procede, contudo, para o tráfego que motiva este trabalho, e a diferença
é de ordens de grandeza:

| | Cabos submarinos | Constelações em órbita baixa |
|---|---|---|
| Participação no tráfego intercontinental | 95 % a 99 % | resíduo |
| Sistemas em serviço | ~570, mais de 1 milhão de km | poucas constelações |
| Capacidade agregada | milhares de Tbit/s | dezenas de Tbit/s |

A comparação mais expressiva é pontual: a capacidade reivindicada para a maior
constelação em órbita baixa em operação é da ordem de algumas dezenas de
terabits por segundo — comparável à de **um único par de fibras** de um cabo
transatlântico moderno [@subseacables_porque]. Projeções de crescimento
apontam para valores substancialmente maiores ao longo desta década, mas
projeções não são capacidade instalada, e a distância a cobrir permanece de duas
a três ordens de grandeza.

Há ainda um argumento que, em um trabalho sobre segurança de infraestrutura,
pesa mais que a capacidade. Substituir um cabo por uma constelação não elimina a
dependência: transfere-a de um ativo físico sob jurisdição costeira compartilhada
para um serviço único, operado por um ator privado estrangeiro, cuja
disponibilidade depende de decisões comerciais e políticas alheias ao Estado
servido. Do ponto de vista de resiliência, isso é uma troca de vulnerabilidade,
não uma redução — e episódios recentes de suspensão seletiva de serviço em zonas
de conflito ilustram a natureza do risco.

A conclusão é que satélite e cabo são complementares e não substitutos: o
primeiro resolve o acesso na ponta e a redundância de emergência; o segundo
carrega o volume. O crescimento da conectividade em órbita baixa **não** reduz a
criticidade dos cabos árticos que estão sendo instalados — e, ao viabilizar mais
atividade econômica e mais tráfego na região, contribui indiretamente para
aumentar a exposição.

## O problema

Danos a cabos submarinos são eventos rotineiros. Estima-se que ocorram entre
uma e duas centenas de falhas por ano em escala global, e a distribuição de
causas é bem estabelecida: atividade humana responde pela ampla maioria,
com pesca de arrasto e ancoragem dividindo a maior parte dos casos atribuíveis
[@icpc_danos]. Praticamente todos esses eventos são acidentais e ocorrem em
águas rasas, onde a âncora e a rede alcançam o fundo.

O que mudou desde 2023 não foi a frequência, mas a interpretação. Uma sequência
de rompimentos no Mar Báltico — o gasoduto e cabo de telecomunicações
Balticconnector em outubro de 2023, cabos ligando Finlândia, Alemanha, Suécia e
Lituânia em novembro de 2024, e o Estlink 2 em dezembro do mesmo ano —
apresentou um padrão recorrente: em cada caso, uma embarcação de bandeira
estrangeira havia transitado sobre o traçado do cabo em velocidade reduzida, e
em vários deles a âncora foi posteriormente encontrada ausente ou o rastro de
arrasto ficou visível no fundo por dezenas de quilômetros. A explicação
acidental permaneceu formalmente possível em todos os casos; a acumulação
estatística, no entanto, deslocou a discussão do domínio da segurança da
navegação para o da segurança do Estado.

Essa reinterpretação expôs uma assimetria incômoda. Causar o dano é trivial e
barato: exige apenas um navio comum, uma âncora e algumas horas de navegação
lenta sobre um traçado que é, em larga medida, informação pública. Estabelecer
o que ocorreu, depois do fato, é caro, lento e frequentemente inconclusivo — e
essa dificuldade é ainda maior no Ártico, onde a densidade de sensores é baixa,
as distâncias de resposta são grandes e as janelas de observação são,
como visto, sazonalmente restritas.

## O ponto de partida metodológico

A ferramenta natural para atacar esse problema é a fusão entre detecção por SAR
e rastreamento cooperativo por AIS (*Automatic Identification System*). A lógica
é direta: detectam-se alvos na imagem SAR; tenta-se associar cada alvo detectado
a uma posição AIS reportada no instante da aquisição; o que não encontra
correspondência é candidato a *dark vessel* — embarcação presente na cena mas
ausente do rastreamento público.

O precedente metodológico direto é o trabalho de @paolo2024, que aplicou esse
casamento em escala global sobre o acervo Sentinel-1 e demonstrou que uma
parcela substancial da atividade industrial no mar — cerca de três quartos das
embarcações de pesca industrial detectadas — não aparece nos sistemas públicos
de rastreamento. O trabalho estabelece tanto a viabilidade quanto a arquitetura
de referência do casamento SAR–AIS, e é adotado aqui como linha de base.

Ele não resolve, porém, o problema desta dissertação. Sua escala é global e seu
domínio é predominantemente de mar aberto e de baixa latitude, onde a
estatística de clutter é bem-comportada e a cobertura AIS é densa. O problema
aqui é o oposto em quase todos os eixos: um corredor geográfico estreito,
definido pelo traçado de um cabo; um alvo que não se distingue por estar
ausente do AIS, mas por *como se move*; e um ambiente onde gelo marinho degrada
o detector de maneira sistemática. A transposição não é direta, e é no que ela
exige que reside a contribuição deste trabalho.

## Pergunta de pesquisa

Em que medida a fusão entre detecção SAR e rastreamento AIS, a partir
exclusivamente de dados públicos, permite identificar assinaturas cinemáticas
compatíveis com arrasto de âncora sobre cabos submarinos árticos — e quais
limites de desempenho são impostos pelo clutter de gelo, pela cadência de
revisita orbital e pela taxa base do fenômeno?

## Objetivos

**Objetivo geral.** Caracterizar a viabilidade e, sobretudo, os limites de um
sistema de detecção de assinaturas cinemáticas compatíveis com arrasto de
âncora sobre cabos submarinos no Ártico, construído inteiramente sobre dados
de acesso público.

**Objetivos específicos.**

1. Definir e avaliar um corredor de risco condicionado por batimetria, tipo de
   fundo e viabilidade cinemática, em substituição ao *buffer* de distância fixa
   usualmente empregado, quantificando a redução do espaço de busca resultante.
2. Quantificar a degradação do detector SAR em função da concentração e do tipo
   de gelo marinho, estabelecendo o limiar operacional acima do qual a detecção
   deixa de ser informativa.
3. Modelar a probabilidade de detecção como função conjunta da revisita efetiva
   e da duração do evento, estabelecendo um teto de desempenho independente de
   algoritmo.
4. Quantificar explicitamente o valor preditivo positivo do sistema sob a taxa
   base real do fenômeno, e avaliar o desempenho por precisão–revocação e custo
   ponderado.

## Delimitação: o que este trabalho não faz

Esta seção precede deliberadamente a apresentação das contribuições, porque a
utilidade do que se segue depende de que seus limites estejam fixados de
antemão.

**Este trabalho não detecta sabotagem.** Ele detecta assinatura cinemática
compatível com arrasto de âncora — um padrão de movimento, sobre uma região
específica, em condições que tornariam o dano fisicamente possível. Essa
assinatura é condição necessária e largamente insuficiente para caracterizar um
ato deliberado. Um arrasteiro em operação normal, um navio reduzindo velocidade
por mau tempo, uma embarcação desviando de gelo e uma operação de manutenção do
próprio cabo produzem assinaturas semelhantes, e são todos incomparavelmente
mais frequentes.

**Este trabalho não estabelece intenção.** A distinção entre acidente e ato
deliberado depende de evidência que nenhum sensor remoto fornece: estado da
âncora, registros de máquinas, comunicações, histórico de comando. O sistema
aqui proposto pode, no máximo, indicar onde essa evidência deve ser procurada.

**Este trabalho não produz base para interdição.** Como se argumenta no
Capítulo 10, o regime jurídico aplicável a dano a cabo submarino em zona
econômica exclusiva por embarcação de bandeira estrangeira atribui a persecução,
em larga medida, ao Estado de bandeira [@unclos]. Detecção não confere
autoridade. A contribuição do sistema é de instrumento de atribuição, não de
defesa.

Enunciar essas restrições explicitamente não enfraquece o trabalho. A literatura
de vigilância marítima tem alguma tendência a apresentar detectores de anomalia
como se fossem detectores de intenção, e é essa lacuna entre o que se mede e o
que se afirma que costuma comprometer a credibilidade da área junto a quem
precisaria usar seus resultados.

## Contribuições

Delimitado o escopo, três contribuições originais se destacam:

**Corredor de risco condicionado por batimetria.** A literatura de proteção de
cabos define quase universalmente a zona de interesse como um *buffer* de
distância fixa em torno do traçado. Isso é geometricamente conveniente e
fisicamente incorreto: só existe risco de arrasto de âncora onde a profundidade
permite que a âncora alcance o fundo com amarra suficiente para engatar. Definir
o corredor como função de profundidade, tipo de fundo e cinemática necessária
para causar dano reduz o espaço de busca em ordens de grandeza — e é essa
redução, mais do que qualquer refinamento do classificador, que produz o ganho
de precisão. Batimetria pública [@gebco2024] e traçados aproximados
[@kisorca; @telegeography] são suficientes para construí-lo, desde que a
incerteza posicional do traçado seja propagada para a largura do corredor.

**Caracterização da degradação por clutter de gelo.** Detectores CFAR
(*Constant False Alarm Rate*) foram concebidos sob premissas estatísticas de
clutter de mar aberto [@rohling1983; @gao2009]. Blocos de gelo, cristas de
compressão e gelo deformado produzem retroespalhamento intenso e pontual,
indistinguível de casco metálico para o detector, e o problema é máximo
justamente na zona marginal de gelo — heterogênea, dinâmica e trafegada.
Caracterizar essa degradação como função da concentração e do tipo de gelo é
uma contribuição técnica concreta e incontornável para qualquer aplicação
ártica.

**Lacuna entre revisita e duração do evento.** Uma embarcação arrastando âncora
a 5–7 nós percorre dezenas de quilômetros em poucas horas. Quando a revisita SAR
é da mesma ordem de grandeza que a duração do evento, a detecção torna-se
intrinsecamente probabilística — não por deficiência do algoritmo, mas por
propriedade do sistema de observação. Modelar a probabilidade de detecção como
função conjunta da revisita efetiva e da duração do evento estabelece um teto de
desempenho que nenhum classificador pode ultrapassar, e constitui resultado
autônomo.

A essas três soma-se uma contribuição de natureza distinta, que atravessa o
trabalho inteiro: a análise explícita de taxa base. Contra milhares de trânsitos
anuais no corredor, há um punhado de eventos confirmados em toda a história
registrada. Sob prevalência dessa ordem, mesmo uma especificidade de 99 % produz
um conjunto de positivos esmagadoramente falso. Esse cálculo é frequentemente
mencionado de passagem na literatura de detecção de anomalias marítimas e quase
nunca executado; aqui ele é conduzido explicitamente e determina o protocolo de
avaliação — precisão–revocação e custo ponderado, com exclusão justificada de
acurácia e ROC-AUC, ambas enganosas sob desbalanceamento extremo
[@saito2015].

## Organização do texto

O Capítulo 2 revisa os fundamentos de SAR marítimo, detecção CFAR, AIS e fusão
SAR–AIS, além da literatura sobre danos a cabos e sensoriamento em gelo,
identificando ao final a lacuna que o trabalho ocupa. O Capítulo 3 descreve as
fontes de dados, todas públicas, e o recorte espaço-temporal adotado. O Capítulo
4 apresenta o método, incluindo a formulação do corredor de risco condicionado
por batimetria. Os Capítulos 5 e 6 desenvolvem, respectivamente, a
caracterização do desempenho sob clutter de gelo e o modelo de probabilidade de
detecção em função da revisita. O Capítulo 7 conduz a análise de falsos
positivos e fixa o protocolo de avaliação. O Capítulo 8 trata da ausência de
*ground truth* e da estratégia de validação adotada. O Capítulo 9 reúne os
resultados e o Capítulo 10 os discute, com atenção particular ao regime
jurídico aplicável e ao reposicionamento da contribuição de sistema de defesa
para instrumento de atribuição. O Capítulo 11 conclui e aponta desdobramentos.
