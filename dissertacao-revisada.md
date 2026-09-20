---
title: "Detecção de assinaturas cinemáticas compatíveis com arrasto de âncora sobre cabos submarinos árticos por fusão SAR-AIS"
subtitle: "Corredores de risco condicionados por batimetria, degradação por clutter de gelo e os limites da inferência sob taxa base extrema"
author: "Henrique"
date: "2026"
lang: pt-BR
documentclass: report
papersize: a4
fontsize: 12pt
geometry:
  - top=3cm
  - left=3cm
  - right=2cm
  - bottom=2cm
linestretch: 1.5
toc: true
toc-depth: 3
number-sections: true
link-citations: true
bibliography: referencias/referencias.bib
csl: referencias/abnt.csl
figPrefix: ["Figura", "Figuras"]
tblPrefix: ["Tabela", "Tabelas"]
eqnPrefix: ["Equação", "Equações"]
secPrefix: ["Seção", "Seções"]
---

<!-- Arquivo gerado por codigo/montar-dissertacao.sh a partir de
     metadata.yaml e capitulos-revisados/*.md. Não editar à mão: edite os
     capítulos e gere novamente com 'make'. -->

# Resumo {-}

A retração do gelo marinho tornou viáveis os primeiros sistemas de cabo
submarino transárticos e, ao mesmo tempo, ampliou o tráfego mercante sobre os
mesmos corredores rasos em que esses cabos ficam mais expostos. Desde 2023, uma
sequência de rompimentos no Mar Báltico deslocou a discussão sobre danos a
cabos do domínio da segurança da navegação para o da segurança do Estado, sem
que se tenha estabelecido o que a observação remota permite de fato afirmar
sobre cada episódio. Esta dissertação investiga em que medida a fusão entre
detecção por radar de abertura sintética (SAR) e rastreamento cooperativo por
AIS, construída exclusivamente sobre dados de acesso público, permite
identificar assinaturas cinemáticas compatíveis com arrasto de âncora sobre
cabos submarinos árticos, e quais limites de desempenho esse problema impõe.

O método proposto combina detecção CFAR sobre produtos Sentinel-1, casamento
SAR-AIS com correção explícita do deslocamento em azimute de alvos móveis,
restrição espacial por um campo de risco e caracterização cinemática das
trajetórias resultantes. A saída tem a forma de uma razão de verossimilhança
calibrada, e não a de um rótulo binário. A avaliação adota um desenho de dois
domínios: o Báltico como domínio de calibração, onde estão os eventos
documentados, e o Ártico como domínio alvo, onde a pergunta se coloca e não há
rótulos. A diferença de desempenho entre os dois é, assim, um resultado do
trabalho, e não um efeito colateral a minimizar.

São três as contribuições originais. A primeira substitui o *buffer* de
distância fixa em torno do traçado, usual na literatura, por um corredor de
risco condicionado por batimetria, tipo de fundo e incerteza do traçado. Sua
componente de profundidade é derivada de primeiros princípios, a partir da
distribuição de comprimento de amarra da frota que efetivamente transita no
corredor, e não postulada por limiar. A segunda caracteriza quantitativamente a
degradação do detector sob clutter de gelo, separando dois mecanismos que a
literatura trata como um só: o falso alarme por feições de gelo, que custa
precisão, e a detecção perdida sobre fundo brilhante, que custa revocação. O
desenho experimental resolve o problema do rótulo negativo por meio de células
de controle. A terceira modela a probabilidade de detecção como função conjunta
da sequência determinística de passagens e da duração do evento, e estabelece um
teto de revocação anterior a qualquer escolha de algoritmo. Dela decorre que
intervalos heterogêneos entre passagens produzem captura estritamente menor que
intervalos regulares de mesma média, de modo que citar revisita média
superestima a cobertura, com erro que cresce com a latitude. Atravessa as três
uma exigência metodológica: a avaliação sob a prevalência real do fenômeno, da
ordem de um evento em dez mil a cem mil trânsitos, com a precisão calculada a
partir de revocação e densidade de falso alarme, e não medida.

A conclusão é uma redução deliberada de pretensão. O sistema não detecta
sabotagem; detecta assinatura cinemática compatível com arrasto de âncora,
condição necessária e largamente insuficiente para caracterizar ato deliberado.
Sob a taxa base estabelecida, um alerta isolado é quase certamente falso. Existe
ainda um teto de precisão independente de sensor, fixado pela fração de eventos
cuja causa é falha mecânica de retenção da âncora, que produz assinatura
idêntica (e não apenas semelhante) à do arrasto deliberado, como demonstram dois
dos casos mais visíveis do período, qualificados como acidentais por autoridades
de jurisdições distintas. Sob a Convenção das Nações Unidas sobre o Direito do
Mar, detectar tampouco confere ao Estado costeiro autoridade para agir na zona
econômica exclusiva. As três vias, revisita, taxa base e regime jurídico,
convergem de forma independente no mesmo ponto: a fusão SAR-AIS permite produzir
evidência de atribuição com força mensurável, e não permite detecção confiável
de eventos isolados. A aplicação natural do sistema é, portanto, retrospectiva e
dirigida.

**Palavras-chave:** radar de abertura sintética; fusão SAR-AIS; cabos
submarinos; Ártico; arrasto de âncora; gelo marinho; razão de verossimilhança;
taxa base; atribuição.

# Abstract {-}

Retreating sea ice has made the first trans-Arctic submarine cable systems
viable while also increasing merchant traffic over the same shallow corridors in
which those cables are most exposed. Since 2023, a sequence of cable breaks in
the Baltic Sea has shifted the discussion of cable damage from navigational
safety to state security, without establishing what remote observation can
actually assert about any individual episode. This dissertation investigates the
extent to which the fusion of synthetic aperture radar (SAR) detection with
cooperative AIS tracking, built exclusively on publicly available data, allows
the identification of kinematic signatures consistent with anchor dragging over
Arctic submarine cables, and what performance limits the problem imposes.

The proposed method combines CFAR detection over Sentinel-1 products, SAR-AIS
matching with explicit correction of the azimuth displacement of moving targets,
spatial restriction by a risk field, and kinematic characterisation of the
resulting tracks. The output is expressed as a calibrated likelihood ratio
rather than a binary label. Evaluation follows a two-domain design: the Baltic
as the calibration domain, where the documented events are, and the Arctic as
the target domain, where the question arises and no labels exist. The
performance gap between the two is therefore a result of the work, not a side
effect to be minimised.

Three original contributions are offered. The first replaces the fixed-distance
buffer around the cable route, standard in the literature, with a risk corridor
conditioned on bathymetry, seabed type and route uncertainty. Its depth
component is derived from first principles, from the anchor-chain length
distribution of the fleet actually transiting the corridor, rather than
postulated as a threshold. The second quantitatively characterises detector
degradation under sea-ice clutter, separating two mechanisms that the literature
treats as one: false alarms from ice features, which costs precision, and missed
detections against a bright background, which costs recall. The experimental
design solves the negative-label problem through control cells. The third models
detection probability as a joint function of the deterministic pass sequence and
event duration, and establishes a recall ceiling that precedes any choice of
algorithm. From it follows that heterogeneous inter-pass intervals yield
strictly lower capture probability than regular intervals of the same mean, so
that quoting mean revisit overstates coverage, with the error growing with
latitude. A methodological requirement runs through all three: evaluation under
the true prevalence of the phenomenon, on the order of one event per ten to one
hundred thousand transits, with precision computed from recall and false-alarm
density rather than measured.

The conclusion is a deliberate reduction in claim. The system does not detect
sabotage; it detects a kinematic signature consistent with anchor dragging, a
necessary and largely insufficient condition for establishing deliberate action.
Under the established base rate, an isolated alert is almost certainly false.
There is furthermore a sensor-independent precision ceiling, set by the fraction
of events caused by mechanical failure of the anchor retention system, which
produces a signature identical to, and not merely resembling, that of deliberate
dragging, as two of the most visible cases of the period demonstrate, both ruled
accidental by authorities in different jurisdictions. Under the United Nations
Convention on the Law of the Sea, detection likewise confers no coastal-state
authority to act in the exclusive economic zone. The three lines of argument,
revisit, base rate and legal regime, converge independently on the same point:
SAR-AIS fusion allows the production of attribution evidence of measurable
strength, and does not allow reliable detection of isolated events. The natural
application of the system is therefore retrospective and targeted.

**Keywords:** synthetic aperture radar; SAR-AIS fusion; submarine cables;
Arctic; anchor dragging; sea ice; likelihood ratio; base rate; attribution.

# Lista de siglas e abreviaturas {-}

| Sigla | Significado |
|:---------|:--------------------------------------------------------------|
| AIS | *Automatic Identification System*, sistema de identificação automática |
| AMSR2 | *Advanced Microwave Scanning Radiometer 2* |
| ASI | *ARTIST Sea Ice*, algoritmo de concentração de gelo |
| CA-CFAR | *Cell-Averaging CFAR*, CFAR por média de células |
| CDS | *Climate Data Store* |
| CDSE | *Copernicus Data Space Ecosystem* |
| CFAR | *Constant False Alarm Rate*, taxa de falso alarme constante |
| EMODnet | *European Marine Observation and Data Network* |
| ERA5 | Reanálise atmosférica global de quinta geração do ECMWF |
| EW | *Extra Wide swath*, modo de aquisição de faixa extralarga |
| GEBCO | *General Bathymetric Chart of the Oceans* |
| GRD | *Ground Range Detected*, produto SAR em alcance projetado |
| IBCAO | *International Bathymetric Chart of the Arctic Ocean* |
| ICPC | *International Cable Protection Committee* |
| IW | *Interferometric Wide swath*, modo de aquisição de faixa larga |
| KIS-ORCA | *Kingfisher Information Service, Offshore Renewable and Cable Awareness* |
| OS-CFAR | *Order-Statistic CFAR*, CFAR por estatística de ordem |
| OSI SAF | *Ocean and Sea Ice Satellite Application Facility* |
| ROC | *Receiver Operating Characteristic* |
| SAR | *Synthetic Aperture Radar*, radar de abertura sintética |
| SOLAS | *Safety of Life at Sea*, Convenção internacional para a salvaguarda da vida humana no mar |
| UNCLOS | *United Nations Convention on the Law of the Sea*, Convenção das Nações Unidas sobre o Direito do Mar |
| VHF | *Very High Frequency* |
| VPP | Valor preditivo positivo |
| ZEE | Zona econômica exclusiva |

# Lista de símbolos {-}

| Símbolo | Significado | Introduzido em |
|:---------------|:-----------------------------------------------------|:-----|
| $R(\mathbf{x})$ | Campo escalar de risco sobre a superfície do mar | §4.4 |
| $w_{\mathrm{prof}}$ | Componente de profundidade do campo de risco | §4.4 |
| $w_{\mathrm{fundo}}$ | Componente de tipo de fundo do campo de risco | §4.4 |
| $w_{\mathrm{traç}}$ | Componente de traçado do campo de risco | §4.4 |
| $L$ | Comprimento de amarra disponível na embarcação | §4.4 |
| $s$ | Relação de amarra, razão entre amarra lançada e profundidade | §4.4 |
| $d_{\mathrm{max}}$ | Profundidade máxima em que a embarcação produz arrasto efetivo | §4.4 |
| $\sigma_{\mathrm{traç}}$ | Desvio-padrão da incerteza transversal do traçado publicado | §4.4 |
| $a$ | Meia-largura da faixa varrida por uma âncora em arrasto | §4.4 |
| $A_{\mathrm{ef}}$ | Área efetiva do corredor, $\int R(\mathbf{x})\,\mathrm{d}\mathbf{x}$ | §4.4 |
| $\rho$ | Razão de redução do espaço de busca frente ao *buffer* convencional | §4.4 |
| $\Delta_{\mathrm{az}}$ | Deslocamento em azimute de alvo móvel | §4.3 |
| $v_r$ | Velocidade radial do alvo na linha de visada | §4.3 |
| $P_{\mathrm{fa}}$ | Probabilidade de falso alarme por pixel do detector CFAR | §4.2 |
| $\lambda_{\mathrm{fa}}$ | Densidade de falso alarme por unidade de área, por estrato | §5.3 |
| $\tau(c)$ | Taxa de troca entre revocação e concentração de gelo | §5.3 |
| $c$, $w$, $m$ | Estratos de concentração de gelo, vento e configuração de aquisição | §5.2 |
| $c^{*}$, $w^{*}$ | Limiares da declaração operacional de informatividade | §5.5 |
| $D$ | Duração do evento de arrasto | §6.1 |
| $T_0$ | Instante de início do evento | §6.1 |
| $\{g_k\}$ | Intervalos entre passagens consecutivas sobre o corredor | §6.3 |
| $P_{\mathrm{capt}}(D)$ | Probabilidade de captura do evento por ao menos uma passagem | §6.3 |
| $P_{\ge 2}(D)$ | Probabilidade de captura por duas ou mais passagens | §6.5 |
| $P_{\mathrm{det}}$ | Probabilidade de detecção, incluindo classificação | §6.1 |
| $\pi$ | Prevalência do fenômeno por trânsito | §7.2 |
| $\Lambda(\mathbf{o})$ | Razão de verossimilhança entre as hipóteses de arrasto e de rotina | §4.6 |
| $\mathbf{o}$ | Vetor de observações e descritores de uma trajetória | §4.6 |
| $\mathrm{Se}$, $\mathrm{Es}$ | Sensibilidade e especificidade | §7.2 |


# Introdução

## Por que radar de abertura sintética

Acima do Círculo Polar Ártico, o Sol não nasce durante semanas ou meses a cada
inverno; em latitudes próximas a 78° N, a noite polar dura cerca de quatro meses
ininterruptos. Quando o Sol retorna, encontra uma região onde a cobertura de
nuvem baixa e a névoa marinha são persistentes durante boa parte do verão,
sobretudo sobre a zona marginal de gelo, onde o contraste térmico entre água
aberta e superfície congelada alimenta nebulosidade quase permanente. O
resultado é que qualquer sistema de observação da superfície do mar que dependa
de luz solar refletida, incluindo o imageamento óptico e multiespectral de alta
resolução hoje disponível comercialmente, permanece cego ao longo de uma fração
substancial do ano, e cego durante o período de menor tráfego observado e maior
dificuldade de resposta.

O radar de abertura sintética (*Synthetic Aperture Radar*, SAR) não compartilha
nenhuma dessas dependências. Por ser um sensor ativo operando em micro-ondas,
ele ilumina o alvo com energia própria e opera com igual desempenho em noite
polar plena. Nos comprimentos de onda usados em sensoriamento marítimo, como a
banda C em torno de 5,4 GHz no caso do Sentinel-1 [@torres2012], a atenuação
atmosférica por nuvem e por precipitação não convectiva é pequena o suficiente
para ser desprezável na maior parte das aquisições. O SAR é, assim, o único
imageamento com disponibilidade efetivamente contínua sobre o Ártico. Não se
trata de uma preferência metodológica entre alternativas comparáveis, nem de uma
escolha justificada por custo ou conveniência de acesso: é a única modalidade de
observação por imagem que funciona o ano inteiro na região de interesse. Todo o
restante deste trabalho decorre dessa restrição, inclusive suas limitações mais
severas, porque adotar SAR significa também herdar sua estatística de clutter,
sua sensibilidade a estado de mar e, sobretudo, sua cadência de revisita.

## Cabos submarinos como infraestrutura crítica

Aproximadamente toda a comunicação intercontinental de dados trafega por cabos
submarinos de fibra óptica. Trata-se de uma infraestrutura ao mesmo tempo
essencial e fisicamente frágil. O cabo típico em águas profundas tem diâmetro
comparável ao de uma mangueira de jardim e repousa diretamente sobre o fundo,
sem qualquer proteção além do próprio isolamento; apenas em trechos rasos, onde
o risco de interação com atividade humana é reconhecidamente maior, ele é
enterrado ou revestido com armação metálica [@carter2009].

O Ártico deixou de ser periférico nessa geografia. A retração progressiva do
gelo marinho tornou economicamente viáveis rotas de cabo transárticas que
encurtam de forma substancial a latência entre Europa e Ásia em relação às rotas
convencionais, e dois sistemas de grande porte estão em implantação. O *Polar
Express*, ao longo da costa ártica russa, tem cerca de 12 650 km e capacidade
projetada da ordem de dezenas a uma centena de terabits por segundo, com
segmentos entrando em serviço a partir de 2026. O *Far North Fiber*, de
aproximadamente 17 000 km, liga Japão e Europa pela passagem noroeste, com
aterragens no Alasca, no Ártico canadense, na Groenlândia, na Noruega, na
Finlândia e na Irlanda [@subnet_polarexpress; @subnet_farnorthfiber].

A mesma retração ampliou a navegabilidade das rotas marítimas do Nordeste e do
Noroeste, com aumento correspondente do tráfego mercante. As duas tendências
convergem geograficamente: o afinamento de gelo que viabiliza o cabo viabiliza
também o navio capaz de danificá-lo, e ambos se concentram nos mesmos corredores
rasos e estreitos, junto às aproximações costeiras. O ativo a proteger está
sendo instalado agora, e no mesmo espaço em que a ameaça cresce.

## Satélite não substitui cabo

Uma objeção natural ao problema assim formulado é que a conectividade por
satélite em órbita baixa teria tornado os cabos menos críticos, e o Ártico
seria, à primeira vista, o caso em que essa substituição mais faria sentido,
dada a dificuldade e o custo de instalar e reparar cabos na região. A objeção
merece resposta explícita, porque, se procedesse, esvaziaria a motivação do
trabalho.

Ela procede em parte, e é importante reconhecer onde. Para conectividade *local*
em alta latitude, as constelações em órbita baixa representam uma mudança
qualitativa: comunidades e embarcações árticas que dependiam de enlaces
geoestacionários com latência acima de meio segundo passaram a dispor de
latências de algumas dezenas de milissegundos. A cobertura polar, inicialmente
limitada, foi estendida por planos orbitais de alta inclinação e por malhas de
enlaces ópticos entre satélites, que dispensam estações terrestres em território
remoto, superando a limitação que tornava a alta latitude difícil de servir
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
terabits por segundo, comparável à de **um único par de fibras** de um cabo
transatlântico moderno [@subseacables_porque; @telegeography_mitos]. Projeções
de crescimento apontam para valores bem maiores ao longo desta década, mas
projeções não são capacidade instalada, e a distância a cobrir permanece de duas
a três ordens de grandeza.

Há ainda um argumento que, em um trabalho sobre segurança de infraestrutura,
pesa mais que a capacidade. Substituir um cabo por uma constelação não elimina a
dependência: transfere-a de um ativo físico sob jurisdição costeira compartilhada
para um serviço único, operado por um ator privado estrangeiro, cuja
disponibilidade depende de decisões comerciais e políticas alheias ao Estado
servido. Do ponto de vista de resiliência, isso é uma troca de vulnerabilidade,
e não uma redução. Episódios recentes de suspensão seletiva de serviço em zonas
de conflito ilustram a natureza do risco.

A conclusão é que satélite e cabo são complementares, e não substitutos: o
primeiro resolve o acesso na ponta e a redundância de emergência; o segundo
carrega o volume. O crescimento da conectividade em órbita baixa **não** reduz a
criticidade dos cabos árticos que estão sendo instalados e, ao viabilizar mais
atividade econômica e mais tráfego na região, contribui indiretamente para
aumentar a exposição.

## O problema

Danos a cabos submarinos são eventos rotineiros. Estima-se que ocorram entre uma
e duas centenas de falhas por ano em escala global, e a distribuição de causas é
bem estabelecida: a atividade humana responde pela ampla maioria, com pesca de
arrasto e ancoragem dividindo a maior parte dos casos atribuíveis [@icpc_danos].
Praticamente todos esses eventos são acidentais e ocorrem em águas rasas, onde a
âncora e a rede alcançam o fundo.

O que mudou desde 2023 não foi a frequência, mas a interpretação. Uma sequência
de rompimentos no Mar Báltico, envolvendo o gasoduto e cabo de telecomunicações
Balticconnector em outubro de 2023, cabos ligando Finlândia, Alemanha, Suécia e
Lituânia em novembro de 2024, e o Estlink 2 em dezembro do mesmo ano, apresentou
um padrão recorrente. Em cada caso, uma embarcação de bandeira estrangeira havia
transitado sobre o traçado do cabo em velocidade reduzida, e em vários deles a
âncora foi posteriormente encontrada ausente ou o rastro de arrasto ficou
visível no fundo por dezenas de quilômetros. A explicação acidental permaneceu
formalmente possível em todos os casos; a acumulação estatística, no entanto,
deslocou a discussão do domínio da segurança da navegação para o da segurança do
Estado.

Essa reinterpretação expôs uma assimetria incômoda. Causar o dano é trivial e
barato: exige apenas um navio comum, uma âncora e algumas horas de navegação
lenta sobre um traçado que é, em larga medida, informação pública. Estabelecer o
que ocorreu, depois do fato, é caro, lento e frequentemente inconclusivo, e essa
dificuldade é ainda maior no Ártico, onde a densidade de sensores é baixa, as
distâncias de resposta são grandes e as janelas de observação são, como visto,
sazonalmente restritas.

## O ponto de partida metodológico

A ferramenta natural para atacar esse problema é a fusão entre detecção por SAR
e rastreamento cooperativo por AIS (*Automatic Identification System*). A lógica
é direta: detectam-se alvos na imagem SAR; tenta-se associar cada alvo detectado
a uma posição AIS reportada no instante da aquisição; o que não encontra
correspondência é candidato a *dark vessel*, isto é, embarcação presente na cena
mas ausente do rastreamento público.

O precedente metodológico direto é o trabalho de @paolo2024, que aplicou esse
casamento em escala global sobre o acervo Sentinel-1 e demonstrou que uma
parcela substancial da atividade industrial no mar, cerca de três quartos das
embarcações de pesca industrial detectadas, não aparece nos sistemas públicos de
rastreamento. O trabalho estabelece tanto a viabilidade quanto a arquitetura de
referência do casamento SAR-AIS, e é adotado aqui como linha de base.

Ele não resolve, porém, o problema desta dissertação. Sua escala é global e seu
domínio é predominantemente de mar aberto e de baixa latitude, onde a
estatística de clutter é bem-comportada e a cobertura AIS é densa. O problema
aqui é o oposto em quase todos os eixos: um corredor geográfico estreito,
definido pelo traçado de um cabo; um alvo que não se distingue por estar ausente
do AIS, mas por *como se move*; e um ambiente onde o gelo marinho degrada o
detector de maneira sistemática. A transposição não é direta, e é no que ela
exige que reside a contribuição deste trabalho.

## Pergunta de pesquisa

Em que medida a fusão entre detecção SAR e rastreamento AIS, a partir
exclusivamente de dados públicos, permite identificar assinaturas cinemáticas
compatíveis com arrasto de âncora sobre cabos submarinos árticos, e quais
limites de desempenho são impostos pelo clutter de gelo, pela cadência de
revisita orbital e pela taxa base do fenômeno?

## Objetivos

**Objetivo geral.** Caracterizar a viabilidade e, sobretudo, os limites de um
sistema de detecção de assinaturas cinemáticas compatíveis com arrasto de âncora
sobre cabos submarinos no Ártico, construído inteiramente sobre dados de acesso
público.

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
   base real do fenômeno, e avaliar o desempenho por precisão-revocação e custo
   ponderado.

## Delimitação: o que este trabalho não faz

Esta seção precede deliberadamente a apresentação das contribuições, porque a
utilidade do que se segue depende de que seus limites estejam fixados de
antemão.

Este trabalho **não detecta sabotagem**. Ele detecta assinatura cinemática
compatível com arrasto de âncora, isto é, um padrão de movimento, sobre uma
região específica, em condições que tornariam o dano fisicamente possível. Essa
assinatura é condição necessária e largamente insuficiente para caracterizar um
ato deliberado. Um arrasteiro em operação normal, um navio reduzindo velocidade
por mau tempo, uma embarcação desviando de gelo e uma operação de manutenção do
próprio cabo produzem assinaturas semelhantes, e são todos incomparavelmente
mais frequentes.

Este trabalho **não estabelece intenção**. A distinção entre acidente e ato
deliberado depende de evidência que nenhum sensor remoto fornece: estado da
âncora, registros de máquinas, comunicações, histórico de comando. O sistema
aqui proposto pode, no máximo, indicar onde essa evidência deve ser procurada.

Este trabalho **não produz base para interdição**. Como se argumenta no Capítulo
10, o regime jurídico aplicável a dano a cabo submarino em zona econômica
exclusiva por embarcação de bandeira estrangeira atribui a persecução, em larga
medida, ao Estado de bandeira [@unclos]. Detecção não confere autoridade. A
contribuição do sistema é de instrumento de atribuição, e não de defesa.

A literatura de vigilância marítima tem alguma tendência a apresentar detectores
de anomalia como se fossem detectores de intenção, e é a lacuna entre o que se
mede e o que se afirma que costuma comprometer a credibilidade da área junto a
quem precisaria usar seus resultados. Fixar as restrições acima de antemão evita
esse desvio.

## Contribuições

Delimitado o escopo, três contribuições originais se destacam.

A primeira é um **corredor de risco condicionado por batimetria**. A literatura
de proteção de cabos define quase universalmente a zona de interesse como um
*buffer* de distância fixa em torno do traçado, construção geometricamente
conveniente e fisicamente incorreta: só existe risco de arrasto de âncora onde a
profundidade permite que a âncora alcance o fundo com amarra suficiente para
engatar. Definir o corredor como função de profundidade, tipo de fundo e
cinemática necessária para causar dano reduz o espaço de busca em ordens de
grandeza, e é essa redução, mais do que qualquer refinamento do classificador,
que produz o ganho de precisão. Batimetria pública [@gebco2024] e traçados
aproximados [@kisorca; @telegeography] bastam para construí-lo, desde que a
incerteza posicional do traçado seja propagada para a largura do corredor.

A segunda é a **caracterização da degradação por clutter de gelo**. Detectores
CFAR (*Constant False Alarm Rate*) foram concebidos sob premissas estatísticas
de clutter de mar aberto [@rohling1983; @gao2009]. Blocos de gelo, cristas de
compressão e gelo deformado produzem retroespalhamento intenso e pontual,
indistinguível de casco metálico para o detector, e o problema é máximo na zona
marginal de gelo, que é heterogênea, dinâmica e trafegada. Caracterizar essa
degradação como função da concentração e do tipo de gelo é uma contribuição
técnica concreta e incontornável para qualquer aplicação ártica.

A terceira é a **lacuna entre revisita e duração do evento**. Uma embarcação
arrastando âncora a 5 a 7 nós percorre dezenas de quilômetros em poucas horas.
Quando a revisita SAR é da mesma ordem de grandeza que a duração do evento, a
detecção torna-se intrinsecamente probabilística, não por deficiência do
algoritmo, mas por propriedade do sistema de observação. Modelar a probabilidade
de detecção como função conjunta da revisita efetiva e da duração do evento
estabelece um teto de desempenho que nenhum classificador pode ultrapassar, e
constitui resultado autônomo.

A essas três soma-se uma contribuição de natureza distinta, que atravessa o
trabalho inteiro: a análise explícita de taxa base. Contra milhares de trânsitos
anuais no corredor, há um punhado de eventos confirmados em toda a história
registrada. Sob prevalência dessa ordem, mesmo uma especificidade de 99 % produz
um conjunto de positivos esmagadoramente falso. Esse cálculo é frequentemente
mencionado de passagem na literatura de detecção de anomalias marítimas e quase
nunca executado; aqui ele é conduzido de forma explícita e determina o protocolo
de avaliação, baseado em precisão-revocação e custo ponderado, com exclusão
justificada de acurácia e ROC-AUC, ambas enganosas sob desbalanceamento extremo
[@saito2015].

## Organização do texto

O Capítulo 2 revisa os fundamentos de SAR marítimo, detecção CFAR, AIS e fusão
SAR-AIS, além da literatura sobre danos a cabos e sensoriamento em gelo,
identificando ao final a lacuna que o trabalho ocupa. O Capítulo 3 descreve as
fontes de dados, todas públicas, e o recorte espaço-temporal adotado. O Capítulo
4 apresenta o método, incluindo a formulação do corredor de risco condicionado
por batimetria. Os Capítulos 5 e 6 desenvolvem, respectivamente, a
caracterização do desempenho sob clutter de gelo e o modelo de probabilidade de
detecção em função da revisita. O Capítulo 7 conduz a análise de falsos
positivos e fixa o protocolo de avaliação. O Capítulo 8 trata da ausência de
*ground truth* e da estratégia de validação adotada. O Capítulo 9 reúne os
resultados e o Capítulo 10 os discute, com atenção particular ao regime jurídico
aplicável e ao reposicionamento da contribuição, de sistema de defesa para
instrumento de atribuição. O Capítulo 11 conclui e aponta desdobramentos.


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
teórico, independente da distância, propriedade que viabiliza o imageamento de
alta resolução a partir de órbita [@oliver2004].

Duas consequências desse princípio importam diretamente a este trabalho e serão
retomadas adiante. A imagem é uma medida coerente, e portanto afetada por
*speckle*, o que condiciona toda a estatística de detecção discutida na seção
seguinte. E a compressão em azimute pressupõe que o alvo esteja estacionário
durante o intervalo de síntese, premissa que embarcações em movimento violam.

### Retroespalhamento da superfície do mar

Em ângulos de incidência moderados, a faixa usual dos sensores orbitais, o
retroespalhamento da superfície do mar é dominado por ressonância de Bragg com
ondas capilares e de gravidade curtas, de comprimento comparável ao do
comprimento de onda do radar projetado na superfície. Para a banda C, com
comprimento de onda em torno de 5,5 cm, isso corresponde a ondulações de escala
centimétrica, geradas e mantidas pelo vento local.

A implicação prática é que **o mar só é visível ao radar porque há vento**. Em
condições de calmaria, a superfície aproxima-se de um refletor especular, o
retroespalhamento cai e a cena escurece; com vento forte, a rugosidade aumenta e
o sinal de fundo sobe. Nenhum dos dois extremos é benigno para detecção de
embarcações. No primeiro, a superfície escura eleva o contraste com o alvo, mas
áreas de baixo retroespalhamento por outras causas, como manchas de óleo,
estabilização por gelo novo e sombras de vento a sotavento de costa, passam a
mimetizar a assinatura de água calma e complicam a segmentação. No segundo, o
clutter sobe e alvos pequenos desaparecem sob ele. A dependência do desempenho
em relação ao estado de mar é, assim, não monotônica, e é uma das razões pelas
quais a avaliação do Capítulo 5 precisa ser estratificada também por vento, e
não apenas por concentração de gelo.

### A assinatura de uma embarcação

Uma embarcação metálica produz retroespalhamento intenso por dois mecanismos
principais: a reflexão em estruturas de canto formadas entre superestrutura,
convés e casco, e o diedro casco-superfície, que devolve energia na direção do
sensor com alta eficiência. O resultado é um alvo tipicamente muito mais
brilhante que o fundo, o que torna a detecção conceitualmente simples. É essa
simplicidade aparente que torna o problema de falsos positivos tão severo quando
o fundo deixa de se comportar como mar aberto.

Três fenômenos secundários merecem registro porque são explorados no método.

O primeiro é o **deslocamento em azimute de alvos móveis**. A componente radial
da velocidade do alvo introduz uma rampa de fase adicional durante a síntese de
abertura, e o processador a interpreta como deslocamento em azimute. Esse
deslocamento é proporcional à razão entre o alcance oblíquo e a velocidade da
plataforma, multiplicada pela velocidade radial do alvo. Para um sensor orbital
típico, essa razão é da ordem de uma centena de segundos, de modo que
velocidades radiais de poucos metros por segundo produzem deslocamentos de
centenas de metros [@raney1971]. Isso tem duas consequências opostas e
igualmente relevantes: trata-se de uma fonte sistemática de erro no casamento
com AIS, capaz de deslocar um alvo para fora da janela de associação, e, ao
mesmo tempo, de uma **medida de velocidade radial obtida de uma única
aquisição**.

O segundo são as **esteiras**. A esteira de uma embarcação, composta pelos
braços do padrão de Kelvin, pela esteira turbulenta central e, quando presente,
pela esteira estreita em V, frequentemente aparece na imagem SAR e permite
estimar rumo e, sob hipóteses, módulo de velocidade a partir de uma única cena
[@eldhuset1996].

O terceiro são as **ambiguidades e artefatos**. A amostragem finita em azimute
produz réplicas deslocadas de alvos brilhantes, e lóbulos laterais de alvos
intensos podem ultrapassar o limiar de detecção. São fontes conhecidas de falso
alarme e precisam de tratamento explícito no pipeline.

O ponto que se retira desta subseção, e que reaparece no Capítulo 6, é que uma
única aquisição SAR não fornece apenas presença: fornece presença mais uma
estimativa parcial de cinemática instantânea. Isso mitiga, sem eliminar, a
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
ao custo de uma resolução bem mais grosseira. A troca é deliberada e faz sentido
para monitoramento de gelo, mas é adversa para este trabalho: **na região de
interesse, o sensor opera no modo de menor resolução**, elevando o tamanho
mínimo de embarcação detectável. Verificar qual modo cobre efetivamente o
corredor escolhido é, por isso, uma tarefa do Capítulo 3, e não um detalhe de
implementação.

A segunda é a **polarização**. Sobre oceano, a combinação usual é VV com VH;
sobre gelo, HH com HV. A razão entre co- e cross-polarização é informativa para
separar superfície metálica de gelo deformado, e essa possibilidade é avaliada
como mitigação no Capítulo 5, mas depende de qual par polarimétrico foi
efetivamente adquirido, o que novamente remete à política de aquisição.

A terceira é a **revisita**. O ciclo de repetição orbital nominal de cada
satélite é de doze dias, e a constelação reduz esse valor por um fator igual ao
número de satélites operacionais. Esse número, porém, descreve mal a situação em
alta latitude: a convergência das órbitas quase polares faz com que faixas
adjacentes se sobreponham cada vez mais à medida que a latitude cresce, de modo
que a frequência efetiva de observação em regiões árticas é bem maior que a
nominal. Duas ressalvas se impõem. Primeiro, o ganho é geográfico e precisa ser
calculado para o corredor específico, não assumido. Segundo, a composição da
constelação variou ao longo do período de interesse: a perda de um satélite ao
final de 2021 e a incorporação de um substituto ao final de 2024 alteraram a
revisita disponível durante os anos em que ocorreram os incidentes usados como
casos de validação no Capítulo 8. Reconstruir a revisita *efetivamente
disponível em cada data*, e não a nominal da missão, é requisito do modelo do
Capítulo 6.

## Detecção de embarcações em imagens SAR

### O detector CFAR

A família de detectores CFAR (*Constant False Alarm Rate*) domina a detecção de
alvos pontuais em SAR [@crisp2004]. O princípio é local e adaptativo: para cada
pixel sob teste, estima-se a estatística do clutter a partir de uma janela de
referência que o circunda, separada por células de guarda destinadas a impedir
que energia do próprio alvo contamine a estimativa; o limiar de decisão é então
calculado de modo a manter constante a probabilidade de falso alarme sob a
distribuição assumida para o fundo.

As variantes diferem na forma de estimar o fundo. O CA-CFAR usa a média das
células de referência e é ótimo sob clutter homogêneo, mas degrada de forma
acentuada quando a janela contém alvos interferentes ou uma transição de
textura. O OS-CFAR substitui a média por uma estatística de ordem, ganhando
robustez a alvos múltiplos e a bordas ao custo de alguma perda de detecção em
fundo homogêneo [@rohling1983]. Variantes com censura automática buscam
identificar e descartar amostras contaminadas antes de estimar o limiar
[@gao2009].

### As premissas e onde elas quebram

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

- junto à borda de gelo, a janela de referência atravessa uma descontinuidade de
  textura, e a estimativa de fundo torna-se um híbrido de dois regimes;
- gelo deformado e cristas de compressão produzem retroespalhamento intenso e
  espacialmente concentrado, que é a assinatura que o detector foi construído
  para encontrar;
- em zonas de tráfego denso, alvos interferentes na janela elevam o limiar e
  produzem mascaramento mútuo.

Há ainda um ponto aritmético que costuma ser subestimado e que conecta este
capítulo diretamente ao Capítulo 7: a probabilidade de falso alarme do CFAR é
definida **por pixel**. Uma cena de faixa larga contém tipicamente centenas de
milhões de pixels, de modo que mesmo uma taxa nominal da ordem de $10^{-6}$
produz centenas de falsos alarmes por cena antes de qualquer filtragem. O número
de detecções brutas nunca é o número de embarcações, e a distância entre os dois
é onde reside a maior parte do trabalho de engenharia e do risco metodológico.

### Abordagens por aprendizado profundo

Detectores baseados em redes convolucionais e arquiteturas de detecção de
objetos superam de forma consistente o CFAR em conjuntos de referência, e o
próprio trabalho de @paolo2024 apoia-se em segmentação por rede profunda. A
adoção dessa linha aqui esbarra, contudo, em uma restrição que atravessa toda a
dissertação: conjuntos de treinamento anotados para SAR marítimo são
predominantemente de mar aberto e de latitudes médias, e o desempenho anunciado
não transfere automaticamente para cenas dominadas por gelo. Como o Capítulo 8
detalha, o problema deste trabalho é a escassez de rótulos no domínio de
interesse. Um detector clássico, cujo comportamento sob violação de premissa
pode ser caracterizado analiticamente, é preferível a um detector
estatisticamente superior cuja degradação fora do domínio de treinamento não é
inspecionável, sobretudo porque **caracterizar a degradação é o objetivo do
Capítulo 5**, e não um obstáculo a contornar.

## Sistema de identificação automática (AIS)

### Natureza e obrigatoriedade

O AIS é um sistema de radiodifusão cooperativa em VHF, concebido para segurança
da navegação e prevenção de abalroamento, e não para vigilância. A distinção não
é retórica: o sistema pressupõe boa-fé do emissor, e toda a sua utilidade para
fins de fiscalização é um subproduto. A obrigatoriedade decorre da Convenção
SOLAS e alcança, em linhas gerais, embarcações acima de determinada arqueação em
viagem internacional e navios de passageiros, com regimes complementares
adotados regionalmente, notadamente para embarcações de pesca acima de certo
comprimento na União Europeia [@solas_v19]. Embarcações abaixo desses limiares
podem operar legalmente sem transmitir, o que estabelece um piso irredutível de
"embarcações escuras" perfeitamente lícitas.

Os transponders dividem-se em Classe A, de maior potência e maior taxa de
reporte, com intervalos que variam de poucos segundos em navegação a alguns
minutos em fundeio, e Classe B, de menor potência e cadência mais esparsa. A
variação da taxa de reporte com velocidade e manobra é relevante para o
casamento: uma embarcação em movimento lento reporta com menos frequência, que é
a condição cinemática de interesse deste trabalho.

### Recepção terrestre e satelital

Estações costeiras oferecem recepção confiável dentro do alcance VHF, mas a
densidade dessa infraestrutura no Ártico é baixa, e em grande parte da área de
interesse ela é simplesmente inexistente. A cobertura depende, portanto, de AIS
satelital.

A recepção por satélite tem duas limitações estruturais. A primeira é de
**colisão de mensagens**: o protocolo de acesso ao meio foi dimensionado para a
célula de alcance de uma estação costeira, e a pegada de um satélite abrange
muitas dessas células ao mesmo tempo, de modo que em áreas de tráfego denso
mensagens de embarcações distintas se sobrepõem e a probabilidade de detecção
cai [@carsonjackson2012]. O Báltico, origem de praticamente todo o conjunto de
validação do Capítulo 8, está entre as regiões de maior densidade de tráfego do
mundo, e é onde essa degradação é maior. A segunda é de **latência**, já que a
mensagem só chega ao usuário após o *downlink*.

Convém corrigir aqui uma imprecisão comum: em termos de *passagens*, a cobertura
satelital em alta latitude é boa, pelo mesmo argumento de convergência orbital
que favorece o SAR. O problema ártico do AIS não é a frequência de passagem, mas
a ausência de recepção terrestre complementar, a latência e a probabilidade de
detecção por mensagem. Formular a limitação corretamente importa, porque as
mitigações são distintas.

### As três formas de ausência

Um alvo detectado no SAR sem correspondência no AIS admite três explicações
qualitativamente diferentes, e a literatura frequentemente as trata como uma só:

1. **Falha de recepção.** A embarcação transmitiu, mas a mensagem não foi
   recebida, por colisão, geometria ou lacuna de cobertura.
2. **Ausência lícita ou desligamento.** A embarcação não é obrigada a
   transmitir, ou desligou o equipamento, conduta que pode ser irregular sem ser
   indício de qualquer outra coisa.
3. **Falsificação.** A embarcação transmite identidade ou posição incorretas,
   por manipulação do equipamento ou por interferência no sinal de
   posicionamento por satélite, prática documentada em várias regiões
   [@gfw_aisgaps].

A terceira é a mais problemática para este trabalho, porque produz
correspondência aparente: existe uma posição AIS onde o alvo SAR está, o alvo é
classificado como cooperativo e sai do conjunto de candidatos. Trata-se de um
mecanismo de **falso negativo**, e não de falso positivo, e por isso não aparece
nas métricas usuais de detecção de embarcação escura. Registrá-lo de forma
explícita é parte da honestidade metodológica que o Capítulo 7 exige.

## Fusão SAR-AIS e detecção de anomalias

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
limitada, e a saída de interesse não é presença, mas **comportamento**: o alvo
relevante pode estar perfeitamente visível no AIS e ainda assim ser o alvo. O
casamento SAR-AIS deixa de ser o produto final e passa a ser uma etapa
intermediária.

Do ponto de vista técnico, o casamento envolve interpolar a trajetória AIS para
o instante exato da aquisição, definir uma janela de associação espaço-temporal
e resolver a atribuição entre conjuntos por minimização de custo. As fontes de
erro são conhecidas: o intervalo entre reportes, a incerteza de interpolação sob
manobra e, recorrendo à seção 2.1, o deslocamento em azimute de alvos com
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
7 se propõe a quantificar, e não apenas a mencionar.

## Danos a cabos submarinos

Falhas em cabos submarinos são fenômeno corriqueiro e bem documentado pela
indústria: a ordem de grandeza é de mais de uma centena de eventos por ano em
escala global, com a ampla maioria atribuível a atividade humana, e com pesca de
arrasto e ancoragem dividindo a maior parte dos casos de causa determinada
[@icpc_danos; @carter2009]. Três fatos dessa literatura estruturam o método do
Capítulo 4.

O primeiro é que **a distribuição por profundidade é fortemente concentrada**. A
quase totalidade dos danos antrópicos ocorre em plataforma continental e águas
rasas, porque é onde âncora e arte de pesca alcançam o fundo. Em águas profundas
o cabo repousa livre e praticamente inacessível. Essa é a base física do
corredor de risco condicionado por batimetria: a variável que separa risco de
não-risco não é distância ao cabo, é profundidade.

O segundo é que **a prática de proteção reflete esse fato**. Operadores enterram
o cabo em trechos rasos, contra interação com pesca e ancoragem, e o deixam
exposto em profundidade. A existência dessa prática é evidência de que a
indústria já opera com um modelo de risco condicionado por profundidade, o que
torna mais notável que a literatura de detecção continue a definir zonas de
interesse por *buffer* de distância fixa.

O terceiro é que **a causa acidental dominante é também o confundidor
dominante**. Se a pesca de arrasto é historicamente a principal causa acidental
de dano, então a assinatura cinemática de interesse é, na maior parte das
ocorrências, produzida por atividade lícita. Essa não é uma limitação do sensor;
é uma propriedade da distribuição de causas. O Capítulo 7 desenvolve a
consequência.

## Sensoriamento remoto de gelo marinho

### Retroespalhamento

O comportamento do gelo marinho em banda C depende de idade e de história
térmica. Gelo multiano, submetido a ciclos de derretimento que reduzem a
salinidade e deixam a estrutura porosa, apresenta espalhamento de volume
apreciável e retroespalhamento tipicamente mais alto que o gelo de primeiro ano
liso, cujo retorno é dominado pela rugosidade de superfície [@dierking2013].
Essa separação, contudo, é sistematicamente perturbada por dois fatores. O
primeiro é a **deformação**: cristas de compressão, blocos e gelo empilhado por
sobreposição produzem retorno intenso e localizado independentemente da idade, e
são a fonte direta do problema do Capítulo 5. O segundo é a **estação**: sob
condições de derretimento superficial, a água livre na superfície altera de
forma radical as propriedades dielétricas, e as assinaturas de gelo de
diferentes idades tendem a convergir.

Água aberta rugosa por vento pode atingir, em co-polarização, níveis comparáveis
aos de gelo, o que torna a discriminação gelo/água ambígua em condições de vento
forte. A polarização cruzada oferece, em geral, melhor separabilidade, porque a
água aberta apresenta retorno cruzado muito baixo enquanto o gelo mantém
contribuição de volume, propriedade que fundamenta a mitigação avaliada no
Capítulo 5.

### Produtos de concentração e o problema de escala

A estratificação experimental do Capítulo 5 exige uma medida de concentração de
gelo casada temporalmente com cada aquisição. As fontes operacionais usuais
derivam de radiômetros passivos em micro-ondas [@osisaf], complementadas por
cartas de gelo produzidas por serviços nacionais.

Há aqui uma incompatibilidade de escala que precisa ser declarada, e não
silenciada: os produtos de concentração por micro-ondas passivas têm resolução
espacial de quilômetros a dezenas de quilômetros, contra pixels de dezenas de
metros na imagem SAR, uma diferença de três ordens de grandeza. Uma célula de
concentração cobre uma área em que a imagem SAR distingue água aberta, banquisa
consolidada e fragmentos individuais. Isso implica que a variável de
estratificação é, na melhor das hipóteses, um descritor de contexto regional, e
não uma caracterização local do fundo sob o alvo. A zona marginal de gelo, onde
a heterogeneidade dentro de uma célula é máxima, é onde o descritor é menos
informativo e onde o problema de detecção é mais agudo. O Capítulo 5 trata essa
limitação de forma explícita, e ela é uma das razões para complementar a
estratificação por concentração com descritores de textura extraídos da própria
imagem.

## Lacuna identificada

Os ramos revisados são individualmente maduros. A detecção CFAR em SAR está
consolidada há décadas; a fusão SAR-AIS foi levada à escala global e validada; a
detecção de anomalias em AIS dispõe de uma literatura ampla; a estatística de
danos a cabos é documentada pela indústria; e o sensoriamento de gelo em banda C
é área estabelecida. O que não existe é o trabalho que os articula sob as
restrições simultâneas deste problema.

Concretamente, não se identificou trabalho que reúna:

1. **definição do espaço de busca por condicionamento físico**, isto é, por
   profundidade, tipo de fundo e viabilidade cinemática, no lugar do *buffer*
   geométrico em torno do traçado, embora a própria prática de enterramento
   seletivo da indústria de cabos evidencie que o risco é condicionado por
   profundidade;
2. **caracterização quantitativa da degradação do detector em função do gelo**,
   com a incompatibilidade de escala entre produto de concentração e imagem
   tratada de frente, no lugar do mascaramento binário de áreas com gelo;
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


# Dados

Este capítulo fixa a área de estudo, o recorte temporal e as fontes que
sustentam os experimentos dos Capítulos 5 a 9. A ordem é deliberada: a
estratégia de domínios vem primeiro, porque é ela que determina quais dados são
necessários; a verificação de viabilidade vem antes do pré-processamento, porque
é ela que pode invalidar a escolha; e o orçamento de incerteza posicional
encerra o capítulo, porque alimenta diretamente a largura do corredor definido
no Capítulo 4.

## Estratégia de dois domínios

O Capítulo 8 estabelece que praticamente todo o *ground truth* disponível está
no Báltico e no Mar do Norte, e não no Ártico. Dos eventos documentados com
data, posição, embarcação identificada e desfecho investigativo, nenhum ocorreu
em condições árticas com cobertura de dados suficiente para servir de caso de
validação. Insistir em um recorte exclusivamente ártico significaria construir
um sistema que não pode ser verificado contra nenhum evento real.

Adota-se, por isso, um desenho de **dois domínios**. O **domínio de calibração**
é o Báltico, onde estão os eventos documentados, a cobertura AIS mais densa e a
batimetria mais bem levantada; é onde o detector é parametrizado, o corredor de
risco é construído e validado, e os casos reais são testados sob protocolo
*leave-one-event-out*. O **domínio alvo** é o Ártico, onde a pergunta de
pesquisa se coloca e onde não há rótulos; é onde se mede o que a transferência
custa, em termos de degradação por gelo (Capítulo 5), de mudança de revisita e
de modo de aquisição (Capítulo 6) e de rarefação da cobertura AIS.

Essa separação não é um paliativo diante da escassez de dados; é o desenho
experimental que a escassez torna correto. A **diferença de desempenho entre os
dois domínios é o resultado**, e não um efeito colateral a minimizar. Um
trabalho que reportasse apenas desempenho ártico teria de fabricar seus próprios
rótulos e não teria contra o que compará-los; um que reportasse apenas
desempenho báltico não responderia à pergunta. O par responde.

A consequência é que a transferência de domínio precisa ser tratada com
explicitação de cada eixo que muda, a saber, gelo, modo de aquisição, resolução,
densidade de AIS, batimetria e densidade de tráfego, e não como uma aplicação do
mesmo modelo a uma nova região.

### Recorte de calibração

O recorte adotado é o **Golfo da Finlândia e Báltico central**. O trecho
concentra a maior parte dos eventos do Capítulo 8, entre eles o Balticconnector,
o Estlink 2 e os cabos associados e o enlace Elisa entre Finlândia e Estônia, e
inclui o segmento Gotland-Ventspils do caso *Vezhen*, que fornece o negativo
rotulado. É raso ao longo de praticamente toda a sua extensão, o que o mantém
integralmente dentro da faixa de profundidade operável para ancoragem e,
portanto, dentro do corredor de risco.

Duas propriedades tornam o recorte especialmente adequado. A primeira é que se
trata de uma das áreas de tráfego mais densas do mundo, o que fornece um
denominador robusto para a análise de taxa base do Capítulo 7: o número de
trânsitos por ano no corredor é grande e mensurável. A segunda é que o Báltico
apresenta cobertura de gelo sazonal no Golfo da Finlândia e no Golfo de Bótnia,
o que permite estudar o problema do Capítulo 5 **dentro do domínio de
calibração**, com AIS denso disponível como verdade parcial, antes de transferir
para condições árticas onde essa verificação não existe. Trata-se de uma
vantagem que o recorte ártico puro não ofereceria.

### Recorte alvo

Dois candidatos, a decidir na verificação de viabilidade descrita adiante.

O primeiro é o **enlace Svalbard-continente**. Corresponde ao único incidente
ártico razoavelmente documentado [@nupi_svalbard] (Capítulo 8, caso A2) e tem
trechos rasos junto às duas extremidades, com o trecho intermediário em
profundidade que o exclui do corredor de risco, o que por si só é uma boa
demonstração do poder de recorte da Contribuição 1. A desvantagem é o tráfego
escasso, que torna a estatística de taxa base pouco informativa.

O segundo é o **Mar de Barents meridional e aproximações costeiras**. Tem
tráfego bem maior, plataforma continental rasa em grande extensão, presença
sazonal de gelo com zona marginal ativa e cobertura AIS costeira norueguesa
disponível. É o recorte com melhor equilíbrio entre relevância e
mensurabilidade.

A recomendação é adotar o segundo como recorte principal e o primeiro como
estudo de caso adicional, aproveitando o fato de que este último é pequeno e
barato de processar. A decisão final depende da verificação de cobertura.

## Recorte temporal

Adotam-se duas janelas com finalidades distintas.

A **janela de eventos** vai de outubro de 2023 a junho de 2026. Cobre todos os
incidentes do conjunto de validação, do Balticconnector à conclusão da
investigação do caso *Fitburg*, e é a janela sobre a qual se recuperam cenas
específicas em torno de cada evento.

A **janela estatística** vai de 2019 ao presente, ou cobre o maior intervalo com
cobertura homogênea. Serve à caracterização de tráfego, à distribuição de
velocidades e rumos no corredor e ao denominador da taxa base do Capítulo 7,
além de fornecer massa suficiente para a estratificação por gelo do Capítulo 5.

A composição da constelação Sentinel-1 variou dentro dessas janelas, com um
período prolongado de operação com um único satélite entre o final de 2021 e o
final de 2024. Isso não invalida as janelas, mas **proíbe tratar a revisita como
constante**: toda estatística agregada sobre o período precisa ser condicionada
à configuração vigente na data, e a reconstrução dessa configuração é insumo
direto do modelo do Capítulo 6.

## Fontes

Todas as fontes são de acesso público. Isso é uma escolha metodológica, ligada à
reprodutibilidade integral do trabalho por terceiros, e não uma limitação
imposta por falta de acesso a dados restritos. A escolha tem, além disso, um
efeito argumentativo relevante para o Capítulo 10: um sistema construído sobre
dados públicos demonstra o que qualquer ator, inclusive um ator não estatal,
pode estabelecer sobre um evento, que é a natureza de um instrumento de
atribuição.

| Fonte | Produto | Escala | Papel |
|---|---|---|---|
| Sentinel-1 (CDSE) | GRD, modos IW e EW | 10 m (IW) / 40 m (EW), espaçamento de pixel | Imageamento primário |
| AIS nacional (DK, NO) e agregadores | Mensagens dinâmicas e estáticas | Posição por reporte | Casamento e cinemática |
| EMODnet Bathymetry | Grade batimétrica europeia | ~100 m | Batimetria do domínio de calibração |
| GEBCO / IBCAO | Grade global e ártica | 15 arcsec / ~200 m | Batimetria do domínio alvo |
| KIS-ORCA, EMODnet Human Activities | Traçados de cabo | Variável | Geometria do corredor |
| AMSR2 (ASI) e OSI SAF | Concentração de gelo | ~3 km e ~25 km | Estratificação do Capítulo 5 |
| Cartas de gelo (met.no, DMI) | Análise operacional | Polígonos | Tipo de gelo e borda |
| ERA5 (CDS) | Vento a 10 m, estado de mar | ~31 km, horário | Estratificação por vento |
| Fontes de incidentes | Registros de falha | Data e posição aproximada | Rótulos-proxy (Capítulo 8) |

### Sentinel-1

O acervo é obtido pelo *Copernicus Data Space Ecosystem*, que sucedeu o portal
anterior de distribuição e oferece catálogo e acesso programático [@cdse].
Adotam-se produtos GRD, cujo espaçamento de pixel é de aproximadamente 10 m no
modo IW e 40 m no modo EW, com resolução efetiva correspondentemente mais
grosseira que o espaçamento em ambos os casos.

Três pontos condicionam o uso, e todos já foram antecipados no Capítulo 2:

- **modo de aquisição.** A expectativa é IW no domínio de calibração e EW em boa
  parte do domínio alvo, com a perda de resolução associada. Isso precisa ser
  verificado por consulta ao catálogo, e não presumido.
- **par polarimétrico.** VV+VH sobre oceano e HH+HV sobre gelo, o que determina
  quais mitigações do Capítulo 5 são aplicáveis em cada cena.
- **revisita efetiva.** Contada sobre o corredor específico e por data, e não
  tomada do valor nominal da missão.

### AIS

Esta é a fonte cuja obtenção exige maior cuidado, e onde a premissa inicial do
projeto precisa ser corrigida.

*Global Fishing Watch* não distribui mensagens AIS individuais. Os dados brutos
que a organização utiliza são de origem comercial e não podem ser
redistribuídos livremente; o que se publica são produtos **agregados**, como
esforço aparente de pesca em grade, eventos de pesca e de transbordo e consultas
por API para fins não comerciais, além de um conjunto anonimizado e rotulado
destinado a treinar classificadores [@gfw_dados]. Esses produtos são excelentes
para caracterizar padrões de atividade e serão usados com essa finalidade, mas o
casamento SAR-AIS do Capítulo 4 exige posição, rumo e velocidade por embarcação
e por instante, e nenhum produto em grade atende a isso. O AISHub, por sua vez,
opera em regime de reciprocidade: o acesso pressupõe a contribuição de um fluxo
próprio de dados, o que não é viável para um projeto acadêmico sem receptor.

As fontes que efetivamente resolvem o problema, e que se adotam como primárias,
são os **acervos nacionais de AIS histórico**, ambos abertos e sem registro:

- a **autoridade marítima dinamarquesa** disponibiliza AIS histórico em arquivos
  CSV de acesso livre, com histórico que remonta a mais de uma década e
  cobertura que alcança o Báltico ocidental e parte do central [@dma_ais];
- a **administração costeira norueguesa** disponibiliza AIS histórico para águas
  norueguesas sob a licença norueguesa para dados públicos abertos, com serviço
  dedicado de consulta histórica [@kystverket_ais], cobrindo a costa ártica e,
  portanto, o domínio alvo.

A combinação cobre os dois domínios no nível de mensagem e sem barreira de
acesso. Há um custo prático a dimensionar desde já: o acervo dinamarquês
distribui da ordem de alguns gigabytes por dia de tráfego, o que situa um ano de
dados na casa das centenas de gigabytes. Isso torna a seleção prévia por recorte
espacial e temporal, e não o download integral seguido de filtragem, a
estratégia obrigatória de aquisição.

Duas verificações precisam preceder qualquer processamento. A primeira é a
**extensão geográfica efetiva** de cada acervo em relação aos corredores
escolhidos, já que a cobertura é definida pela rede de receptores costeiros de
cada país e não pela fronteira marítima. A segunda é a **profundidade do
histórico** frente à janela temporal adotada. Delas depende a viabilidade do
casamento e, por extensão, de todo o método.

Registre-se ainda que a cobertura AIS disponível não é a cobertura AIS real: as
três formas de ausência discutidas no Capítulo 2 operam sobre qualquer acervo, e
a fração de embarcações sem correspondência inclui, necessariamente, falhas de
recepção que não têm relação com o fenômeno de interesse.

### Batimetria

Para o domínio de calibração, adota-se **EMODnet Bathymetry**, cuja grade para
mares europeus é bem mais fina que a global e incorpora levantamentos
hidrográficos nacionais [@emodnet_bathy]. Para o domínio alvo, adota-se
**GEBCO**, cuja componente ártica deriva em larga medida da carta batimétrica
internacional do Oceano Ártico [@gebco2024; @ibcao].

A resolução nominal da grade GEBCO é de 15 segundos de arco, o que corresponde a
células de aproximadamente 460 m na direção norte-sul e, em latitudes árticas,
consideravelmente menos na direção leste-oeste. Essa resolução é adequada para
distinguir plataforma continental de bacia profunda, mas **é grosseira junto ao
limiar de profundidade que define o corredor de risco**, e o problema é agravado
pelo fato de a grade ser uma compilação: a incerteza vertical varia
espacialmente conforme a densidade de levantamentos que alimentaram cada célula,
e é maior no Ártico, onde a cobertura por sondagem é mais esparsa.

A consequência metodológica é que o corredor do Capítulo 4 **não pode ser
definido por um limiar rígido de profundidade**. A transição precisa ser suave e
a incerteza batimétrica precisa ser propagada, sob pena de que a fronteira do
corredor seja um artefato da grade, e não uma propriedade do fundo.

### Traçados de cabo

Aqui é necessária uma advertência que altera a escolha de fonte prevista
originalmente. O mapa de cabos submarinos da TeleGeography é **esquemático**: os
traçados são estilizados para legibilidade e não representam a geometria real do
cabo no fundo. Ele é útil para identificar quais enlaces existem, quem os opera
e onde estão os pontos de aterragem, e é inadequado para definir a geometria do
corredor.

As fontes utilizáveis para geometria são as **cartas de conscientização
produzidas para a pesca**, como o KIS-ORCA, que existem para informar
arrasteiros sobre onde não arrastar, e os produtos de atividade humana do
EMODnet, que agregam informação de cabos em águas europeias. Ainda assim, a
posição publicada é aproximada por decisão deliberada dos operadores: a
localização exata é informação sensível.

Isso não é um obstáculo ao método, e sim um insumo dele. A incerteza posicional
do traçado entra no orçamento de erro da seção final deste capítulo e determina
uma largura mínima do corredor abaixo da qual não faz sentido descer. Um
trabalho que definisse um corredor de largura inferior à incerteza do traçado
estaria reportando precisão fictícia.

### Gelo marinho

Adotam-se duas fontes complementares, pelas razões de escala discutidas no
Capítulo 2. Como variável contínua de estratificação, a concentração derivada do
radiômetro AMSR2 pelo algoritmo ASI [@amsr2_asi], cuja grade de aproximadamente
3 km é a melhor resolução operacionalmente disponível em micro-ondas passivas e
reduz, sem eliminar, a incompatibilidade de escala com a imagem SAR. Como
referência de tipo de gelo e posição da borda, as cartas de gelo operacionais
dos serviços meteorológicos norueguês e dinamarquês, que incorporam análise
humana e distinguem classes de idade e de concentração que o produto automático
não separa.

Mesmo com o produto de 3 km, permanece uma diferença de duas ordens de grandeza
em relação ao pixel SAR. A estratificação por concentração é, assim, um
descritor de contexto regional, e o Capítulo 5 a complementa com descritores de
textura extraídos da própria cena.

### Reanálise atmosférica

A reanálise ERA5, distribuída pelo *Climate Data Store*, fornece vento a 10 m e
parâmetros de estado de mar em passo horário e resolução de aproximadamente
31 km [@era5]. O uso é duplo: estratificar o desempenho do detector por condição
de vento, conforme exigido pela seção 2.1, e sustentar a discussão do confundidor
"redução de velocidade por mau tempo" no Capítulo 7, inclusive no caso *Vezhen*,
cuja causa oficial envolve o impacto de uma onda em horário determinado.

### Registros de falha e reparo

Não existe base pública consolidada de falhas de cabo. O comitê internacional de
proteção de cabos mantém registros que não são abertos, e a informação
disponível é dispersa entre comunicados de operadoras, notícias e relatórios
setoriais. O Capítulo 8 trata esses registros como rótulos-proxy fracos, com
data confiável e posição aproximada, e a tabela de casos em
`docs/casos-validacao.md` é o produto desse levantamento.

## Verificação de viabilidade

Esta seção descreve um procedimento que **antecede** o processamento e cujo
resultado pode alterar a área de estudo. Executá-lo cedo é a diferença entre
descobrir um problema de cobertura no quarto mês e descobri-lo no vigésimo.

Para cada recorte candidato, consulta-se o catálogo e apura-se:

1. **número de aquisições Sentinel-1** sobre o corredor por ano, discriminado
   por modo, órbita ascendente ou descendente e par polarimétrico;
2. **revisita efetiva**, isto é, a distribuição do intervalo entre passagens
   consecutivas, por ano, dada a configuração de constelação vigente;
3. **cobertura AIS**, isto é, a fração do corredor e do período com dados no
   nível de mensagem, e a taxa média de reporte observada;
4. **fração do corredor em profundidade operável**, a partir da grade
   batimétrica adotada;
5. **densidade de tráfego**, isto é, o número de trânsitos anuais, insumo do
   denominador da taxa base.

**Critérios de rejeição.** Um recorte candidato é descartado se a revisita
efetiva for tão esparsa que o teto de desempenho do Capítulo 6 torne o
experimento vazio; se a cobertura AIS no nível de mensagem for insuficiente para
o casamento; ou se a fração do corredor em profundidade operável for pequena
demais para produzir amostra. Nesses casos, **muda-se a área de estudo, e não o
método**: as três contribuições são geograficamente transponíveis, e a
transposição é preferível a diluí-las para acomodar um recorte inadequado.

O resultado dessa verificação constitui a primeira tabela de resultados do
trabalho e deve ser reportado mesmo quando favorável, porque documenta a base
factual da escolha de área.

## Pré-processamento

A cadeia adotada para os produtos GRD é convencional, mas cada etapa é
justificada pelo efeito que produz na estatística do fundo, o que importa porque
é essa estatística que o detector do Capítulo 4 pressupõe.

A **calibração radiométrica** para coeficiente de retroespalhamento é o primeiro
passo, sem o qual limiares não são comparáveis entre cenas, órbitas e ângulos de
incidência.

A **correção geométrica de terreno** com modelo de elevação é necessária para o
georreferenciamento exigido pelo casamento com AIS e pela sobreposição com o
corredor.

A **máscara de terra**, com margem, elimina a fonte trivial de falso alarme
representada por estruturas costeiras. A margem precisa ser suficiente para
cobrir o deslocamento em azimute de alvos móveis discutido no Capítulo 2.

A **filtragem de *speckle* não é aplicada antes da detecção**. Esta é a única
escolha não convencional da cadeia e merece justificativa. A filtragem reduz a
variância do fundo e, com isso, altera a distribuição sobre a qual o limiar CFAR
é calculado; um detector calibrado sobre dados filtrados opera com uma taxa de
falso alarme efetiva diferente da nominal, e a diferença depende do filtro e da
janela. Como o objeto do Capítulo 5 é caracterizar como a estatística do fundo
se afasta da premissa, introduzir um filtro que a modifica de forma dependente
do conteúdo local comprometeria a medida. A detecção opera sobre a intensidade
calibrada; a filtragem, quando usada, restringe-se a etapas de extração de
textura e à inspeção visual.

A **correção de ruído térmico** é particularmente relevante no modo EW e nas
faixas de polarização cruzada, onde o padrão de ruído por subfaixa pode produzir
descontinuidades que o detector interpreta como estrutura.

## Orçamento de incerteza posicional

Três fontes de erro se acumulam entre o alvo real e sua posição atribuída, e
somá-las de forma explícita é o que permite dimensionar o corredor sem fingir
precisão inexistente:

| Fonte | Ordem de grandeza | Comentário |
|---|---|---|
| Geolocalização do produto SAR | metros a poucas dezenas de metros | Pequena em relação às demais |
| Deslocamento em azimute do alvo móvel | centenas de metros | Depende da velocidade radial; parcialmente corrigível |
| Posição publicada do traçado do cabo | não declarada, presumivelmente centenas de metros a quilômetros | Domina o orçamento |
| Grade batimétrica junto ao limiar | centenas de metros na horizontal | Afeta a fronteira do corredor |

A conclusão operacional é que **a incerteza do traçado do cabo domina o
orçamento** e estabelece o piso de largura do corredor. Refinamentos nas demais
componentes só se tornam significativos depois que essa for reduzida, o que
depende de informação que os operadores deliberadamente não publicam. Esse
resultado precisa ser declarado no Capítulo 4 e reaparecer nas limitações do
Capítulo 10: a resolução espacial útil do sistema não é a resolução do sensor.

## Organização e reprodutibilidade

Os dados brutos não são versionados, pelo volume; versionam-se os produtos
intermediários compactos, os scripts de aquisição com os identificadores exatos
de cena e de granule, e a configuração de cada experimento. Qualquer terceiro
com acesso às mesmas fontes públicas deve conseguir reconstruir o conjunto a
partir do repositório, e essa é a forma prática pela qual a escolha por dados
públicos, declarada no início do capítulo, se converte em verificabilidade.


# Método

Este capítulo descreve o sistema proposto. A seção 4.4 contém a primeira
contribuição original do trabalho, o corredor de risco condicionado por
batimetria, e a seção 4.6 fixa a forma da saída, que é uma razão de
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
o qual o desempenho é medido**: trata-se da restrição do domínio, e não de um
filtro posterior de conveniência. A segunda é que a saída da etapa 3 não é
descartada quando há correspondência AIS. Diferentemente de um sistema de
detecção de embarcações escuras, aqui o alvo de interesse pode estar
perfeitamente identificado no AIS, e o que importa é seu comportamento. A
ausência de correspondência é uma característica entre outras, e não o critério
de seleção.

## Detecção de alvos

A detecção opera sobre a intensidade calibrada, sem filtragem prévia de
*speckle*, pelas razões dadas no Capítulo 3.

Adota-se um detector CFAR com estatística de ordem, cuja robustez a
heterogeneidade da janela de referência e a alvos interferentes é preferível ao
ganho marginal do estimador por média em fundo homogêneo, e o fundo, neste
problema, raramente é homogêneo. A geometria do detector é definida por três
parâmetros: o raio da janela de guarda, dimensionado para exceder a maior
embarcação esperada acrescida do borrão de movimento; o raio da janela de
referência, dimensionado para conter amostras suficientes para a estimativa sem
atravessar estruturas de larga escala como bordas de gelo; e a ordem da
estatística empregada.

O limiar decorre da probabilidade de falso alarme por pixel especificada,
$P_{\mathrm{fa}}$. Como observado no Capítulo 2, essa probabilidade é *por
pixel*: para uma cena com $N$ pixels válidos, o número esperado de falsos
alarmes antes de qualquer pós-processamento é

$$\mathbb{E}[N_{\mathrm{fa}}] = N \cdot P_{\mathrm{fa}},$$

de modo que valores nominalmente conservadores ainda produzem centenas de
detecções espúrias por cena. O Capítulo 5 estabelece $P_{\mathrm{fa}}$ **por
estrato de gelo**, e não globalmente; esta seção fixa apenas a forma do
detector.

O pós-processamento agrupa pixels detectados em objetos por conectividade,
descarta objetos de dimensão incompatível com embarcação e trata duas fontes
conhecidas de artefato. Lóbulos laterais de alvos intensos são suprimidos por
critério de proximidade e razão de intensidade em relação ao alvo dominante.
Ambiguidades em azimute, cuja posição esperada é calculável a partir dos
parâmetros de aquisição, são marcadas como candidatas a réplica quando coincidem
com essa previsão.

## Correspondência SAR-AIS

### Propagação das trajetórias

Cada trajetória AIS é propagada ao instante exato de aquisição $t_a$ a partir do
reporte imediatamente anterior, com velocidade e rumo reportados. A incerteza da
posição propagada cresce com o intervalo $\Delta t$ desde o último reporte e com
a taxa de guinada observada; trajetórias sob manobra recebem incerteza maior. O
ponto é relevante para este trabalho em particular porque, como notado no
Capítulo 2, embarcações em baixa velocidade reportam com menor frequência, e a
baixa velocidade é a condição de interesse.

### Correção do deslocamento em azimute

Um alvo com velocidade radial $v_r$ aparece deslocado em azimute de

$$\Delta_{\mathrm{az}} = \frac{R}{V}\, v_r,$$

onde $R$ é o alcance oblíquo e $V$ a velocidade da plataforma. A razão $R/V$ é
da ordem de uma centena de segundos para um sensor orbital, de modo que
velocidades radiais de poucos metros por segundo produzem deslocamentos de
centenas de metros, comparáveis ou superiores à janela de associação que se
usaria ingenuamente.

A correção é aplicada na direção do **modelo direto**, e não da inversão. Não se
tenta corrigir a posição da detecção SAR, cuja velocidade é desconhecida a
priori; projeta-se a velocidade reportada pelo AIS sobre a linha de visada do
radar, obtém-se $v_r$ e desloca-se a **posição prevista do candidato AIS** para
onde ele deveria aparecer na imagem. A associação é então feita no espaço da
imagem, entre a detecção observada e a posição prevista já deslocada. Essa
escolha elimina uma fonte sistemática de erro que, quando ignorada, produz
falsas embarcações escuras, já que o alvo simplesmente caiu fora da janela.

### Associação

A associação é resolvida como problema de atribuição. Define-se o custo entre a
detecção $i$ e o candidato AIS $j$ como a distância de Mahalanobis entre a
posição observada e a posição prevista, sob a covariância combinada da
propagação AIS, da geolocalização do produto e do resíduo da correção de
azimute. Pares cuja distância excede um limiar de *gating* são proibidos, e a
atribuição ótima sobre a matriz restante é obtida por algoritmo húngaro
[@kuhn_assignment].

O tratamento dos resultados distingue três situações, e a distinção importa
porque o Capítulo 7 precisa saber de onde vêm os candidatos:

- **correspondência unívoca**, quando a detecção é associada a um único
  candidato dentro do *gate*;
- **correspondência ambígua**, quando há mais de um candidato compatível,
  tipicamente em tráfego denso; a atribuição é registrada com marca de
  ambiguidade e não é tratada como evidência de nada;
- **sem correspondência**, quando nenhum candidato está dentro do *gate*.
  Registra-se, sem atribuir causa, que essa condição admite as três explicações
  discutidas no Capítulo 2, a saber, falha de recepção, ausência lícita ou
  desligamento, e falsificação. A última produz o efeito oposto, uma
  correspondência aparente e espúria, que este procedimento **não detecta**.

## Corredor de risco condicionado por batimetria

Esta seção contém a primeira contribuição do trabalho.

### O problema com o *buffer* fixo

A prática corrente na literatura de proteção de infraestrutura submarina define
a zona de interesse como um *buffer* de largura fixa em torno do traçado
publicado. A construção é geometricamente simples e fisicamente incorreta por
duas razões independentes: trata como equivalentes trechos em que uma âncora
alcança o fundo e trechos em que não alcança, e atribui ao traçado publicado uma
precisão que ele não possui.

A proposta é substituir o *buffer* por um campo escalar de risco
$R(\mathbf{x}) \in [0,1]$, definido sobre a superfície do mar, que expressa a
probabilidade de que uma interação de âncora naquele ponto seja fisicamente
capaz de danificar o cabo.

### Formulação

Fatoram-se três condições necessárias e aproximadamente independentes:

$$R(\mathbf{x}) = w_{\mathrm{prof}}(\mathbf{x}) \cdot w_{\mathrm{fundo}}(\mathbf{x}) \cdot w_{\mathrm{traç}}(\mathbf{x}).$$

Note-se que a viabilidade cinemática **não** aparece aqui, embora estivesse
prevista na formulação inicial do projeto. A razão é de coerência semântica:
$R$ é um campo espacial, uma propriedade do lugar, ao passo que a cinemática é
uma propriedade da trajetória. Fundi-las produziria um objeto que não é nem uma
coisa nem outra e impediria a ablação de cada componente. A cinemática é tratada
na seção 4.5 e combinada na 4.6.

### Componente de profundidade

Esta é a componente central, e a que se procura derivar de primeiros princípios
no lugar de fixar por limiar arbitrário.

Uma âncora só interage com o fundo se a amarra disponível permitir que ela
alcance o leito com folga suficiente para que uma porção da amarra repouse
horizontalmente e a unha possa engatar. A razão entre o comprimento de amarra
lançado e a profundidade, a *relação de amarra*, precisa exceder um valor mínimo
$s$, tipicamente de alguns múltiplos. O comprimento total de amarra disponível,
$L$, é uma característica da embarcação: navios mercantes carregam amarra em
quantidade que escala com o porte, medida em quartéis de comprimento
padronizado.

A profundidade máxima em que uma dada embarcação pode produzir arrasto efetivo é
portanto

$$d_{\mathrm{max}} = \frac{L}{s}.$$

Como $L$ varia com a classe e o porte da embarcação e $s$ tem alguma dispersão,
$d_{\mathrm{max}}$ é uma variável aleatória sobre a **população de embarcações
que efetivamente transita no corredor**. A componente de profundidade é a função
de sobrevivência dessa variável:

$$w_{\mathrm{prof}}^{0}(d) = \Pr\left( \frac{L}{s} \ge d \right) = 1 - F_{d_{\mathrm{max}}}(d).$$

Esta é a diferença essencial em relação ao limiar fixo: a curva não é postulada,
mas **estimada a partir da composição real da frota** no corredor, que o AIS
fornece por classe e porte. Um corredor por onde transitam grandes graneleiros
tem cauda mais longa que um corredor de cabotagem, e a mesma profundidade
representa risco diferente nos dois casos.

As ordens de grandeza envolvidas merecem registro, porque já indicam que o
resultado da derivação não coincide com o limiar usualmente adotado. A amarra é
medida em quartéis de 27,5 m, e navios mercantes portam algo entre dez e treze
quartéis por âncora, o que situa $L$ na casa das poucas centenas de metros
[@amarra_pratica]. Com as relações de amarra de 5:1 a 7:1 recomendadas para
fundeio, a profundidade máxima de fundeio projetada para a maior parte da frota
mercante fica em torno de 80 a 100 m, e o fundeio comercial efetivo raramente
ultrapassa algumas dezenas de metros. O valor de duzentos metros que circula
como limiar de risco é, portanto, **conservador por uma margem larga**: a
derivação por primeiros princípios produz um corredor bem mais restritivo que o
postulado, o que reforça a contribuição em vez de enfraquecê-la.

Uma distinção precisa ser feita com cuidado, e ela é a principal fonte de
incerteza da componente. A relação de amarra de 5:1 a 7:1 é a recomendada para
**fundeio seguro**, isto é, para manter posição sob vento e corrente. A condição
de interesse aqui é diferente e menos exigente: basta que a âncora alcance o
leito e disponha de amarra suficiente para engatar e arrastar, o que ocorre com
relações menores. O valor de $s$ apropriado para *arrasto capaz de causar dano*
não está estabelecido na literatura com a mesma firmeza que o valor para
fundeio, e é sobre ele que a curva $w_{\mathrm{prof}}^{0}$ é mais sensível.
Trata-se $s$, por isso, como variável aleatória com distribuição declaradamente
incerta, e reporta-se a sensibilidade de $\rho$ e do desempenho à sua
especificação, no lugar de escolher um número e apresentá-lo como estabelecido.

Resta incorporar a incerteza batimétrica. Sendo $p(d \mid \mathbf{x})$ a
distribuição da profundidade verdadeira em $\mathbf{x}$, dada a célula da grade
e sua incerteza vertical,

$$w_{\mathrm{prof}}(\mathbf{x}) = \int_{0}^{\infty} w_{\mathrm{prof}}^{0}(d) \; p(d \mid \mathbf{x}) \; \mathrm{d}d .$$

A convolução resolve o problema levantado no Capítulo 3: a fronteira do corredor
deixa de ser uma isolinha da grade batimétrica, que seria em parte artefato de
compilação, e passa a ser uma transição suave cuja largura reflete a qualidade
do levantamento local. Onde a batimetria é bem conhecida, a transição é abrupta;
onde é esparsa, como em boa parte do Ártico, é larga. A incerteza aparece no
produto em vez de ser escondida por ele.

### Componente de tipo de fundo

A capacidade de engate depende do substrato: fundos moles permitem penetração,
enquanto fundo rochoso tende a fazer a âncora resvalar. A componente
$w_{\mathrm{fundo}}$ atribui peso conforme a classe de substrato obtida de
cartografia pública de habitats de fundo.

Esta é reconhecidamente a componente mais frágil das três. A cartografia
disponível é grosseira, frequentemente interpolada a partir de amostragem
esparsa, e a relação entre classe de substrato e comportamento de âncora é
qualitativa. Além disso, o efeito é ambíguo quanto ao dano: uma âncora que
resvala sobre rocha penetra menos, mas não é por isso inofensiva a um cabo
exposto. Por essa razão, $w_{\mathrm{fundo}}$ é implementada de forma
conservadora, sem zerar região alguma, e **é objeto de ablação explícita no
Capítulo 9**. Se sua remoção não alterar o desempenho, o resultado honesto é
declarar que a contribuição é de profundidade e traçado, e não de substrato.

### Componente de traçado e a largura do corredor

Seja $r(\mathbf{x})$ a distância de $\mathbf{x}$ ao traçado publicado. A posição
verdadeira do cabo difere da publicada por um deslocamento transversal
$\epsilon$ que se modela como gaussiano de desvio $\sigma_{\mathrm{traç}}$.
Sendo $a$ a meia-largura da faixa efetivamente varrida por uma âncora em
arrasto,

$$w_{\mathrm{traç}}(\mathbf{x}) = \Pr\big( |r(\mathbf{x}) - \epsilon| \le a \big).$$

Como $\sigma_{\mathrm{traç}}$ é de ordens de grandeza superior a $a$, o
resultado aproxima-se de

$$w_{\mathrm{traç}}(\mathbf{x}) \approx \frac{2a}{\sigma_{\mathrm{traç}}} \, \phi\!\left( \frac{r(\mathbf{x})}{\sigma_{\mathrm{traç}}} \right),$$

com $\phi$ a densidade normal padrão. O perfil transversal do corredor é,
assim, **a própria densidade da incerteza do traçado**, e sua largura efetiva é
determinada por $\sigma_{\mathrm{traç}}$, e não por uma escolha do analista.

Esse resultado formaliza a conclusão do orçamento de incerteza do Capítulo 3:
não há corredor mais estreito que a ignorância sobre onde o cabo está. Um
sistema que declarasse largura inferior estaria reportando precisão fictícia. Ao
mesmo tempo, o corredor assim definido é enormemente mais restritivo que um
*buffer* fixo generoso, porque decai suavemente em vez de terminar em uma borda
arbitrária, e porque é multiplicado pelas outras duas componentes.

A estimativa de $\sigma_{\mathrm{traç}}$ é ela própria um problema, já que os
operadores não publicam a incerteza de seus traçados. Adota-se a estratégia de
tratá-la como parâmetro e reportar os resultados como função dela, no lugar de
fixar um valor não fundamentado; a sensibilidade do desempenho a
$\sigma_{\mathrm{traç}}$ é um resultado do Capítulo 9.

### Redução do espaço de busca

A grandeza que quantifica a contribuição é a razão entre a área de um *buffer*
convencional de meia-largura $W$ e a área efetiva do campo de risco:

$$\rho = \frac{|\{\mathbf{x} : r(\mathbf{x}) \le W\}|}{\int R(\mathbf{x})\, \mathrm{d}\mathbf{x}}.$$

O denominador é uma área efetiva, no sentido de que um campo de risco que
valesse um dentro de uma região e zero fora reproduziria a área dessa região. A
hipótese a testar é que $\rho$ seja de ordens de magnitude, e que o ganho de
precisão associado seja proporcional, porque a taxa de falso alarme escala com a
área observada, ao passo que os eventos de interesse, por construção física, não
ocorrem fora do suporte de $R$.

## Análise cinemática de trajetória

Restringido o domínio, caracteriza-se o comportamento de cada trajetória. Os
descritores são escolhidos por corresponderem a condições necessárias do
fenômeno físico, e não por desempenho empírico.

A **velocidade sustentada em faixa compatível** é o primeiro deles. O arrasto
capaz de romper um cabo ocorre em uma faixa intermediária: abaixo dela a
embarcação está essencialmente à deriva e a energia transmitida é baixa; acima,
a âncora tende a não se manter engatada. Mede-se a fração do tempo em que a
velocidade permanece na faixa e a duração do trecho contínuo mais longo.

A **persistência de rumo** é o segundo. O arrasto prolongado produz rumo
estável, distinto tanto da manobra de aproximação de porto quanto do padrão de
mudanças frequentes característico da pesca de arrasto em área.

A **geometria em relação ao cabo** compreende o ângulo de cruzamento e o
comprimento do trecho percorrido dentro do suporte de $R$, ponderado por $R$ ao
longo da trajetória.

A **desaceleração anômala** é a queda de velocidade não explicada por manobra
portuária, encontro com gelo ou estado de mar. As três explicações alternativas
são testadas contra os dados de gelo e ERA5 do Capítulo 3 antes de o descritor
ser considerado anômalo.

A **cinemática instantânea a partir de uma única cena**, por fim, decorre do
Capítulo 2: o deslocamento em azimute e a esteira fornecem estimativas de
velocidade independentes do AIS. Elas cumprem dois papéis. Permitem caracterizar
parcialmente alvos sem correspondência, para os quais não há trajetória. E
permitem **verificar** a velocidade reportada por um alvo com correspondência,
que é o único mecanismo do sistema capaz de expor falsificação de AIS.

## Pontuação e classificação

### Por que não um rótulo

Sob a prevalência estabelecida no Capítulo 7, um classificador binário é
ativamente enganoso: a esmagadora maioria de seus positivos será falsa,
independentemente da qualidade do detector, e o rótulo "positivo" comunica uma
confiança que a evidência não sustenta. O problema não se resolve ajustando o
limiar; é estrutural.

### Razão de verossimilhança

Adota-se como saída a razão de verossimilhança entre as duas hipóteses, na forma
consagrada pela avaliação de evidência em contexto forense [@aitken_forense]:

$$\Lambda(\mathbf{o}) = \frac{p(\mathbf{o} \mid H_{\mathrm{arrasto}})}{p(\mathbf{o} \mid H_{\mathrm{rotina}})},$$

onde $\mathbf{o}$ reúne os descritores cinemáticos, o perfil de $R$ ao longo da
trajetória, o estado de correspondência AIS e as covariáveis ambientais. Sob a
regra de Bayes em forma de razão de chances,

$$\underbrace{\frac{\Pr(H_{\mathrm{arrasto}} \mid \mathbf{o})}{\Pr(H_{\mathrm{rotina}} \mid \mathbf{o})}}_{\text{chance posterior}} = \Lambda(\mathbf{o}) \cdot \underbrace{\frac{\Pr(H_{\mathrm{arrasto}})}{\Pr(H_{\mathrm{rotina}})}}_{\text{chance a priori}} .$$

A separação é o ponto. **O sistema estima $\Lambda$; ele não estima a chance a
priori, e não deve fingir que estima.** A prevalência do fenômeno é uma
propriedade do corredor, do período e do contexto, e é, como o Capítulo 7
demonstra, extremamente baixa. Ao entregar $\Lambda$ acompanhado da evidência
que o compõe, o sistema fornece aquilo que pode fundamentar, e deixa a
combinação com o *a priori* explícita e auditável em vez de embutida.

Essa escolha tem três consequências que atravessam o restante da dissertação.
Ela torna a saída **componível** com informação que o sistema não possui, como o
histórico do navio, o contexto geopolítico ou a existência de uma falha de cabo
registrada. Ela torna o custo assimétrico do Capítulo 7 aplicável de forma
transparente, já que o limiar de ação passa a ser uma decisão declarada sobre
chance posterior e custo, e não um artefato interno do classificador. E ela é,
como se argumenta no Capítulo 10, a forma natural de um **instrumento de
atribuição**: força de evidência é o que um sistema técnico pode oferecer a um
processo de decisão que não lhe pertence.

### Estimação e calibração

$\Lambda$ é estimada por modelo generativo simples sobre os descritores, com os
dois termos ajustados separadamente. O denominador vem do tráfego real do
corredor, que é abundante e majoritariamente rotineiro; o numerador, das
trajetórias sintéticas injetadas descritas no Capítulo 8, complementadas pelos
poucos eventos reais disponíveis.

A calibração, isto é, a verificação de que um valor declarado de $\Lambda$
corresponde à força de evidência efetivamente observada, é feita sobre o
conjunto sintético e verificada nos casos reais sob protocolo
*leave-one-event-out*. Reporta-se a qualidade da calibração, e não apenas a
capacidade de ordenação, porque um $\Lambda$ mal calibrado destrói toda a
utilidade da separação acima: ele reintroduz, de forma oculta, o excesso de
confiança que a formulação pretendia evitar.

### Saída

Para cada trajetória avaliada, o sistema emite o valor de $\Lambda$ com
intervalo de incerteza, a decomposição por descritor, o perfil de $R$ ao longo
da trajetória, as covariáveis ambientais que sustentam ou enfraquecem as
explicações alternativas e as marcas de ambiguidade de correspondência. O
conjunto, e não o número isolado, é o produto do sistema.


# Caracterização de desempenho sob clutter de gelo

Este capítulo contém a segunda contribuição do trabalho: a caracterização
quantitativa de como o detector definido no Capítulo 4 degrada em presença de
gelo marinho, e a que preço essa degradação pode ser mitigada.

O capítulo descreve o desenho experimental e o protocolo de análise; os valores
medidos são apresentados no Capítulo 9. Essa separação é deliberada. O desenho
precisa ser defensável antes de produzir números, sob pena de que a escolha de
estratos e métricas seja feita à luz dos resultados.

## O problema

### Duas falhas distintas, frequentemente confundidas

A presença de gelo degrada o desempenho por dois mecanismos independentes, que a
literatura de detecção em SAR com frequência trata como um só e que têm causas,
métricas e mitigações diferentes.

O primeiro é o **falso alarme por gelo**. Cristas de compressão, blocos emersos
e gelo deformado produzem retroespalhamento intenso e espacialmente concentrado.
Para um detector construído para encontrar esse padrão sobre fundo homogêneo,
tais feições são alvos. A perda é de precisão.

O segundo é a **detecção perdida em gelo**. Uma embarcação sobre banquisa
consolidada é observada contra um fundo brilhante, e não escuro. O contraste que
sustenta a detecção em mar aberto reduz-se ou desaparece, e o limiar necessário
para suprimir o clutter de gelo eleva-se acima do retorno de embarcações
pequenas. A perda é de revocação.

Os dois mecanismos operam ao mesmo tempo e em direções opostas na curva de
precisão-revocação, o que torna impossível caracterizá-los por uma métrica
agregada. Separá-los é a primeira exigência do desenho experimental.

### O acoplamento com o Capítulo 6

Há um terceiro efeito, menos evidente, e que agrava os dois anteriores.

O Capítulo 2 estabeleceu que uma única aquisição SAR fornece não apenas
presença, mas cinemática instantânea parcial, por duas vias: o deslocamento em
azimute proporcional à velocidade radial e a esteira. O Capítulo 6 apoia-se
nessa propriedade para atenuar a limitação imposta pela revisita esparsa.

**Ambas as vias enfraquecem em gelo.** Não há esteira de Kelvin em banquisa, e
uma embarcação navegando em gelo o faz em velocidade reduzida, o que diminui o
deslocamento em azimute a ponto de torná-lo comparável à incerteza de
geolocalização. Onde a detecção é mais difícil, perde-se também o mecanismo que
permitiria extrair cinemática de uma passagem isolada.

A degradação por gelo e o limite de revisita não são, assim, limitações
independentes que se somam: elas se compõem. O modelo do Capítulo 6 precisa
tratar o termo $P(\text{detecção} \mid \text{passagem})$ como função do estrato
de gelo, e o termo de classificação também. Este capítulo fornece ambas as
funções.

### A zona marginal como pior caso

A zona marginal de gelo concentra todas as dificuldades. É heterogênea em escala
inferior à célula do produto de concentração, é dinâmica em escala de horas, e é
onde o tráfego efetivamente ocorre, já que embarcações contornam a banquisa
consolidada em vez de atravessá-la. Um sistema que funcionasse bem em mar aberto
e em banquisa fechada, falhando apenas na zona marginal, seria inútil, porque é
ali que estão os alvos.

## Desenho experimental

### O problema do rótulo negativo

O obstáculo central do experimento não é medir detecções, é saber o que elas
são. Uma detecção não associada a nenhuma posição AIS admite duas leituras
incompatíveis: ou é uma feição de gelo, isto é, um falso alarme, que é o objeto
de medida deste capítulo, ou é uma embarcação genuína sem correspondência, isto
é, o alvo que o sistema procura. Estimar taxa de falso alarme como "detecções
sem correspondência AIS" confunde as duas e inviabiliza a medida.

A solução adotada é definir **células de controle**: regiões cobertas por gelo,
selecionadas por ausência completa de tráfego AIS em uma janela temporal ampla
em torno da aquisição e por distância a qualquer rota de navegação conhecida.
Nessas células, qualquer detecção é, com alta probabilidade, uma feição de gelo.
Elas fornecem o rótulo negativo que o problema não oferece naturalmente.

A contaminação residual, isto é, uma embarcação escura genuína dentro de uma
célula de controle, não pode ser eliminada, mas pode ser limitada por
construção, ao exigir das células afastamento de rotas e ausência de qualquer
atividade registrada. O trabalho reporta a fração estimada de contaminação, sob
a premissa de que embarcações escuras não são uniformemente distribuídas mas
concentradas em áreas de atividade econômica, e trata a taxa de falso alarme
medida como limite superior.

Um segundo mecanismo, independente, complementa a discriminação: a **coerência
de deriva**. O campo de gelo desloca-se de forma espacialmente coerente entre
aquisições consecutivas, sob forçamento de vento e corrente, ao passo que uma
embarcação se move independentemente do campo. Feições que acompanham a deriva
local são gelo. O mecanismo exige pares de aquisições suficientemente próximos
no tempo e, por isso, não é aplicável em toda parte, mas onde é aplicável
fornece verificação externa às células de controle.

### Estratificação

O experimento é estratificado em quatro eixos.

A **concentração de gelo** é dividida em quatro faixas: água essencialmente
livre; gelo esparso; concentração intermediária; banquisa fechada. A fonte é o
produto de aproximadamente 3 km descrito no Capítulo 3.

O **tipo de gelo e a proximidade da borda** vêm das cartas operacionais, com
classes de primeiro ano, multiano e uma classe específica de zona marginal,
definida por distância à borda de gelo em vez de por concentração, já que a
heterogeneidade que caracteriza a zona não é capturada pelo valor médio da
célula.

O **vento** vem do ERA5. Este eixo é indispensável e não fazia parte da
formulação original do projeto. Sem ele, a degradação atribuída ao gelo estaria
confundida com a degradação por estado de mar: a seção 2.1 estabeleceu que o
clutter de mar aberto cresce com o vento, de modo que uma medida de taxa de
falso alarme em função apenas da concentração de gelo atribuiria ao gelo um
efeito que é em parte meteorológico. Os dois eixos precisam ser cruzados.

A **configuração de aquisição** compreende o modo IW ou EW e o par
polarimétrico. Como o Capítulo 3 antecipou, o modo varia sistematicamente com a
região, e a resolução mais grosseira do modo de faixa larga altera tanto o
tamanho mínimo detectável quanto a estatística do fundo. Não separar esse eixo
faria com que a diferença entre domínios fosse atribuída ao gelo quando parte
dela é instrumental.

O cruzamento completo é um desenho fatorial cujas células não terão todas
população suficiente. O procedimento é reportar a população por célula e agregar
eixos apenas quando a agregação for justificável, declarando quais células
ficaram vazias, no lugar de apresentar médias marginais que escondem
desbalanceamento.

### Verdade positiva parcial

A capacidade de detecção é medida sobre embarcações com posição AIS confirmada
dentro da cena, que constituem verdade positiva conhecida. A limitação dessa
verdade precisa ser declarada: embarcações que reportam AIS são um **subconjunto
enviesado**, já que tendem a ser maiores, cooperativas e comerciais. A taxa de
detecção medida sobre elas é, portanto, otimista em relação à população
completa, e particularmente otimista quanto a alvos pequenos. O trabalho reporta
a taxa de detecção estratificada por porte da embarcação, o que permite ao menos
exibir a dependência e extrapolar com cautela declarada, no lugar de reportar um
número agregado que não corresponde a nenhuma população real.

## Métricas

### Densidade de falso alarme

A métrica primária é a **densidade de falso alarme**, isto é, o número de
detecções espúrias por unidade de área, medida nas células de controle:

$$\lambda_{\mathrm{fa}}(c, w, m) = \frac{\mathbb{E}[N_{\mathrm{det}}]}{A},$$

para o estrato definido por concentração $c$, vento $w$ e configuração $m$.

A escolha de densidade por área em vez da probabilidade por pixel usada no
Capítulo 4 é deliberada e tem duas razões. A primeira é que ela é comparável
entre modos de aquisição com resoluções diferentes, o que a probabilidade por
pixel não é. A segunda, mais importante, é que ela se conecta diretamente ao
Capítulo 7: o número esperado de falsos positivos em um corredor é a densidade
multiplicada pela área efetiva do corredor, que é a quantidade que a
Contribuição 1 reduz. As duas contribuições encontram-se nessa multiplicação.

### Curva de degradação e taxa de troca

O resultado principal do capítulo tem duas formas.

A primeira é a **curva de degradação**: $\lambda_{\mathrm{fa}}$ em função da
concentração de gelo, a limiar fixo, com o eixo de vento como família de curvas.
Ela mostra o quanto o detector se afasta de sua taxa nominal quando a premissa
de mar aberto é violada.

A segunda, e a mais útil operacionalmente, é a **taxa de troca**. Fixando-se a
densidade de falso alarme em um valor de referência, o que exige elevar o limiar
à medida que a concentração de gelo cresce, mede-se a revocação resultante sobre
a verdade positiva parcial. Define-se

$$\tau(c) = -\frac{\partial\, \text{revocação}}{\partial c} \bigg|_{\lambda_{\mathrm{fa}}\, \text{fixo}},$$

isto é, quanta capacidade de detecção é preciso entregar para manter a precisão
constante à medida que o gelo aumenta. Essa é a grandeza que um operador precisa
conhecer e que a literatura raramente reporta, porque exige o rótulo negativo
que as células de controle fornecem.

### Curvas de precisão-revocação por estrato

Reportadas por estrato, nunca agregadas. Conforme o protocolo fixado no Capítulo
7, não se reporta acurácia nem área sob a curva ROC.

## Mitigações avaliadas

Cada mitigação é avaliada pelo mesmo critério: quanto reduz $\lambda_{\mathrm{fa}}$
e quanto custa em revocação ou em cobertura. Nenhuma é adotada por reduzir falso
alarme isoladamente.

O **limiar adaptativo por estrato** é a mitigação mínima: calibrar o limiar
separadamente em cada célula do desenho fatorial. O custo em revocação é dado
diretamente pela taxa de troca.

A **máscara por concentração de gelo** exclui do processamento áreas acima de
uma concentração limite. É eficaz e grosseira: o custo não é em revocação, mas
em **cobertura**, já que o sistema deixa de observar parte do corredor. A área
excluída precisa ser reportada como fração do corredor e como fração do tráfego
que por ela passa. Uma máscara que remova o falso alarme removendo também metade
dos trânsitos não é uma mitigação, é uma redução de escopo.

A **razão de polarizações** explora a separabilidade entre superfície metálica e
gelo deformado discutida na seção 2.6, avaliada como descritor adicional na
etapa de rejeição de candidatos. A aplicabilidade depende do par adquirido em
cada cena, o que restringe a mitigação a um subconjunto do acervo.

Os **descritores de textura**, extraídos da vizinhança do candidato, servem a
dois propósitos: discriminar diretamente gelo de embarcação e, mais relevante,
**fornecer um indicador local de condição de gelo a partir da própria imagem**,
contornando parcialmente a incompatibilidade de escala do produto de
concentração discutida nos Capítulos 2 e 3. A hipótese a testar é que a
estratificação por textura local seja mais informativa que a estratificação por
concentração regional. Se confirmada, é um resultado com valor próprio, porque
implica que a variável de estratificação usada pela literatura é a variável
errada.

A **rejeição por coerência de deriva** aplica como filtro o mesmo mecanismo
usado na construção do rótulo negativo, onde houver pares de aquisições
próximos. O custo é a aplicabilidade limitada e a latência.

## Declaração operacional

O capítulo encerra com uma resposta numérica a uma pergunta única: **acima de
que condição de gelo o sistema deixa de ser informativo?**

O critério é definido antes da medida, para não ser escolhido em função dela.
Considera-se que o sistema deixa de ser informativo em um estrato quando a
precisão alcançável, na revocação mínima de utilidade operacional, cai a ponto
de a razão de verossimilhança do Capítulo 4 se aproximar da unidade, isto é,
quando a evidência produzida deixa de distinguir as hipóteses. Sob a prevalência
do Capítulo 7, esse ponto é atingido bem antes do que a intuição sugere.

O produto é uma declaração da forma: *o sistema é informativo até a concentração
$c^{*}$ sob vento até $w^{*}$ na configuração $m$; acima disso, não*. Uma
resposta honesta e delimitada a essa pergunta vale mais, para quem precisar usar
o sistema, do que qualquer ganho marginal em uma métrica agregada, e é o tipo de
resultado que trabalhos de detecção em ambiente ártico tipicamente não reportam.

## Ameaças à validade

A **contaminação das células de controle** por embarcações escuras genuínas é
limitada por construção, quantificada e tratada como limite superior da taxa de
falso alarme.

O **viés da verdade positiva** para embarcações grandes e cooperativas é
declarado, e parcialmente exposto pela estratificação por porte.

A **resolução do produto de concentração**, duas ordens de grandeza acima do
pixel SAR, é a motivação para os descritores de textura como estratificação
alternativa; a comparação entre as duas estratificações é ela própria um
resultado.

A **confusão sazonal** decorre de que, sob derretimento superficial, as
assinaturas de gelo de diferentes idades convergem (seção 2.6) e a relação entre
tipo de gelo e retroespalhamento se altera. A estratificação precisa incluir
estação, ou os estratos de tipo de gelo perdem significado no verão.

A **extrapolação entre domínios** é a última ameaça. Os estratos de gelo com
maior população estarão no domínio de calibração; os de maior interesse, no
domínio alvo. A transferência é o objeto do Capítulo 9 e não deve ser presumida
aqui.


# Revisita orbital e duração do evento

Este capítulo contém a terceira contribuição do trabalho: um modelo da
probabilidade de detecção como função conjunta da cadência de observação e da
duração do evento, e o teto de desempenho que dele decorre.

O resultado é anterior a qualquer escolha de algoritmo. Ele não descreve uma
limitação da implementação proposta, mas uma propriedade do sistema de
observação, e vale igualmente para qualquer detector que opere sobre o mesmo
acervo.

## Formulação

Uma embarcação arrastando âncora a velocidade de arrasto percorre dezenas de
quilômetros em poucas horas. O evento é, portanto, **transitório**: existe
durante uma janela de duração comparável ou inferior ao intervalo típico entre
observações. Se a cadência de revisita é da mesma ordem de grandeza que a
duração do evento, então a observação do evento é um acontecimento aleatório, e
a detecção é intrinsecamente probabilística.

Essa é uma diferença qualitativa em relação ao problema que a literatura de
fusão SAR-AIS normalmente ataca. Detectar pesca não declarada, por exemplo, é
detectar uma atividade que persiste por dias ou semanas em uma região: qualquer
passagem dentro desse período a observa, e a revisita afeta apenas a resolução
temporal do resultado, e não a sua existência. Aqui, uma passagem que ocorra
duas horas antes ou depois não observa nada.

Formalmente, decompõe-se

$$P_{\mathrm{det}} = \mathbb{E}_{T_0, D}\left[ 1 - \prod_{i\,:\, t_i \in [T_0,\, T_0 + D]} \big(1 - p_i\big) \right],$$

onde $T_0$ é o instante de início do evento, $D$ sua duração, $\{t_i\}$ a
sequência de instantes de aquisição sobre o corredor, e $p_i$ a probabilidade de
que a passagem $i$ produza detecção **e** classificação corretas, quantidade que
o Capítulo 5 caracteriza em função do estrato de gelo, do vento e da
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
distribuição dos intervalos é, assim, fortemente heterogênea, e essa
heterogeneidade cresce com a latitude, porque a convergência das órbitas aumenta
o número de faixas que cobrem o ponto.

A consequência prática é que a sequência não precisa ser modelada
estocasticamente: ela pode ser **reconstruída** a partir do catálogo, para o
corredor específico e para cada data, com a configuração de constelação vigente,
que, como o Capítulo 3 registrou, variou ao longo do período de interesse. O
objeto de modelagem aleatória é o instante do evento, e não o da observação.

## Probabilidade de captura

Seja $\{g_k\}$ o conjunto de intervalos entre passagens consecutivas sobre o
corredor em um período de referência. Admitindo que o instante de início do
evento seja uniforme sobre esse período, hipótese discutida adiante, o evento
inicia dentro do intervalo $g_k$ com probabilidade proporcional a $g_k$, e, uma
vez dentro dele, é capturado por ao menos uma passagem se e somente se começar a
menos de $D$ do fim do intervalo. Segue

$$P_{\mathrm{capt}}(D) \;=\; \frac{\sum_k \min(D,\, g_k)}{\sum_k g_k}.$$

A expressão é exata e não exige hipótese distribucional sobre as passagens.

### O caso homogêneo e por que ele engana

Se todos os intervalos fossem iguais a $\bar g$, o resultado se reduziria a

$$P_{\mathrm{capt}}(D) = \min\!\left(\frac{D}{\bar g},\, 1\right),$$

isto é, a razão entre duração do evento e revisita, saturando em um. É esta a
forma que a intuição sugere e que justificaria citar uma "revisita média" como
descritor suficiente de cobertura.

Ela é otimista. Como $\min(D, g)$ é côncava em $g$, a desigualdade de Jensen dá

$$P_{\mathrm{capt}}(D) \;=\; \frac{\mathbb{E}[\min(D, g)]}{\mathbb{E}[g]} \;\le\; \min\!\left(\frac{D}{\mathbb{E}[g]},\, 1\right).$$

**Para uma mesma revisita média, intervalos heterogêneos produzem probabilidade
de captura estritamente menor que intervalos regulares.** O motivo é
transparente: agrupar passagens desperdiça observações, já que duas passagens
separadas por poucas horas quase sempre veem, ou deixam de ver, o mesmo evento,
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
próprios incidentes documentados no Capítulo 8: extensões de arrasto relatadas,
da ordem de dezenas a uma centena de quilômetros, combinadas com as velocidades
características de arrasto, produzem durações da ordem de poucas a algumas
horas.

Com um conjunto dessa dimensão não se estima uma distribuição; adota-se uma
família paramétrica com suporte positivo e assimetria à direita, e **reporta-se
o resultado como função de $D$ em vez de integrar sobre uma distribuição mal
estimada**. A curva $P_{\mathrm{capt}}(D)$, com $D$ variando de uma a doze
horas, é mais informativa e mais honesta do que um número único obtido por
integração sobre uma distribuição que os dados não sustentam.

Duas ressalvas sobre a hipótese de início uniforme. A primeira é que, se o
evento for deliberado, o instante de início pode não ser uniforme: um ator
informado pode consultar efemérides públicas e escolher a janela entre
passagens, o que reduz $P_{\mathrm{capt}}$ abaixo do valor calculado. O modelo,
nesse caso, é um limite superior, e vale registrar que a publicidade dos
horários de passagem é, para esta aplicação, uma vulnerabilidade e não apenas
uma conveniência. A segunda é que a atividade marítima tem estrutura diurna e
sazonal que pode correlacionar-se com a hora local das passagens de uma órbita
heliossíncrona; essa correlação é verificável nos dados de tráfego e precisa ser
checada antes de assumir uniformidade.

## Dois regimes de observação

Ao instanciar $p_i$, aparece uma distinção que a formulação original do projeto
não previa e que altera substancialmente o alcance do resultado.

### Alvo cooperativo

Se a embarcação transmite AIS, sua trajetória é conhecida com cadência de
segundos a minutos, ordens de grandeza mais fina que qualquer revisita orbital.
A assinatura cinemática de interesse, isto é, velocidade sustentada em faixa de
arrasto, persistência de rumo e geometria em relação ao cabo, é obtida
**integralmente do AIS**, sem depender de o satélite passar durante o evento.

Nesse regime, o papel do SAR não é detectar o evento. É:

- **verificar** a posição e a velocidade reportadas, expondo falsificação,
  função que, conforme o Capítulo 4, nenhum outro elemento do sistema cumpre;
- **corroborar** com observação independente e não cooperativa, o que tem valor
  probatório distinto do registro AIS, cuja integridade depende do próprio
  suspeito.

A revisita, aqui, determina a probabilidade de **corroboração**, e não a de
detecção. O evento é detectado de qualquer forma; o que a passagem acrescenta é
uma evidência de natureza diferente.

### Alvo não cooperativo

Se a embarcação não transmite, ou transmite posição falsa, a trajetória só pode
ser reconstruída a partir de observações SAR. Aqui, o teto de
$P_{\mathrm{capt}}$ aplica-se integralmente, e com um agravante: uma única
passagem fornece posição e, pelo Capítulo 2, cinemática instantânea parcial via
deslocamento em azimute e esteira, mas o Capítulo 5 estabeleceu que **ambas as
vias enfraquecem em gelo**, onde não há esteira e a velocidade reduzida torna o
deslocamento em azimute comparável à incerteza de geolocalização.

Portanto, no regime não cooperativo e em condições de gelo, a classificação
tende a exigir **duas ou mais passagens dentro da janela do evento**, cuja
probabilidade é substancialmente menor que a de uma:

$$P_{\ge 2}(D) \;=\; \frac{\sum_k \max\!\big(0,\, \min(D, g_k + g_{k+1}) - g_k\big)}{\sum_k g_k},$$

com a soma tomada sobre pares consecutivos. A queda em relação a
$P_{\mathrm{capt}}$ é acentuada onde os intervalos são heterogêneos.

### O que isso implica para o trabalho

A observação de que os dois regimes têm tetos radicalmente diferentes tem uma
consequência empírica desconfortável e que precisa ser dita: **todos os
incidentes documentados no Capítulo 8 pertencem ao regime cooperativo**. As
embarcações envolvidas, nos casos do Golfo da Finlândia, do enlace
Gotland-Ventspils e dos demais, transmitiam AIS, e foi pelo AIS que foram
identificadas. Nenhum caso conhecido foi descoberto por detecção SAR de alvo não
cooperativo.

Disso decorrem duas leituras, e ambas entram no Capítulo 10:

1. Para o modelo de ameaça efetivamente documentado, a contribuição realista do
   sistema não é detecção primária, mas **corroboração independente e detecção
   de falsificação de AIS**, que é a função de um instrumento de atribuição, e
   não de um sistema de alerta.
2. O regime não cooperativo permanece relevante como cenário, mas é
   **hipotético**: não há caso documentado que o instancie. Um trabalho que
   otimizasse o sistema para esse regime estaria otimizando para uma ameaça
   postulada, e a honestidade exige dizê-lo.

## Modelo completo e estudo de sensibilidade

Combinando os elementos, e condicionando ao regime $r \in \{\text{coop},
\text{não coop}\}$ e ao estrato ambiental $s$ do Capítulo 5:

$$P_{\mathrm{det}}(D \mid r, s) \;=\; \mathbb{E}_{T_0}\!\left[ 1 - \big(1 - p(r, s)\big)^{N(T_0, D)} \right],$$

com $N(T_0, D)$ o número de passagens no intervalo $[T_0, T_0+D]$, obtido da
sequência reconstruída.

O estudo de sensibilidade percorre:

- **duração do evento**, de uma a doze horas;
- **latitude**, para exibir o ganho de passagens por ciclo e, ao mesmo tempo, a
  perda por agrupamento, com as duas curvas no mesmo eixo, já que é o balanço
  entre elas que importa;
- **configuração de constelação**, reproduzindo as condições vigentes em cada
  ano do período de interesse, o que permite responder quanto da não detecção
  dos incidentes de 2022 a 2024 é atribuível à configuração reduzida daquele
  período;
- **estrato de gelo e vento**, através de $p(r,s)$ medido no Capítulo 5;
- **regime cooperativo e não cooperativo**, separadamente e sem agregação.

## O teto e o que ele implica

O produto do capítulo é uma família de curvas de limite superior de revocação.
Nenhum classificador, por melhor que seja, pode exceder $P_{\mathrm{det}}$: o
que não foi observado não pode ser classificado.

Isso fornece um critério de leitura para a literatura da área. Um trabalho que
reporte revocação acima do teto correspondente à sua cadência de observação está
medindo outra coisa, quase sempre por **condicionamento a eventos observados**:
constrói-se o conjunto de avaliação a partir de casos que se sabe terem sido
imageados, o que remove do denominador os eventos que o sistema perderia. O viés
é silencioso porque o conjunto resultante parece razoável; apenas não
corresponde à população sobre a qual o sistema operaria.

Declarar o teto tem ainda uma função construtiva. Ele torna comparáveis
propostas de melhoria heterogêneas: um ganho de revisita por incorporação de
outra constelação e um ganho de classificação por melhor detector passam a ser
mensuráveis na mesma escala, e é possível mostrar qual delas domina em cada
regime. A resposta esperada, e a verificar, é que no regime não cooperativo o
fator limitante seja a cadência de observação, e não a qualidade do
classificador, o que implicaria que esforço adicional de modelagem tem retorno
menor que acesso a mais observações.

## Ameaças à validade

A **hipótese de início uniforme**, discutida acima, é violada por evasão
deliberada e possivelmente por estrutura diurna do tráfego. Ambas são
verificáveis.

A **distribuição de duração** é mal estimada, com base em um punhado de eventos.
A ameaça é mitigada por reportar em função de $D$ em vez de integrar.

A **cobertura real** difere da cobertura catalogada. A sequência reconstruída
pressupõe que cada aquisição catalogada seja utilizável; cenas com falha,
cobertura parcial do corredor ou modo inadequado precisam ser excluídas antes da
contagem, ou o teto sai otimista.

A **independência entre passagens** é a hipótese mais frágil. O modelo trata
$p_i$ como independentes entre passagens dentro de uma mesma janela, mas
passagens próximas no tempo compartilham condição de gelo e de vento, de modo
que a falha de uma torna a falha da outra mais provável. O efeito reduz
$P_{\mathrm{det}}$ abaixo do valor calculado, o que mantém o resultado como
limite superior, mas a magnitude do efeito deve ser estimada, e não apenas
mencionada.


# Falsos positivos: taxa base, confundidores e custo assimétrico

Este é o capítulo central da dissertação, e vem deliberadamente antes dos
resultados. Se a análise que se segue aparecesse depois deles, leria como
ressalva; antes, lê como o que é, isto é, um achado que determina o que o
sistema pode legitimamente afirmar, e portanto o protocolo sob o qual os
resultados devem ser produzidos.

## Unidade de análise

Antes de qualquer aritmética é preciso fixar o que conta como um caso. A escolha
não é neutra: prevalência, precisão e taxa de falso alarme mudam de valor
conforme a unidade, e comparações entre trabalhos que adotam unidades diferentes
são vazias.

Adota-se como unidade o **trânsito**, isto é, a passagem de uma embarcação pelo
suporte do campo de risco $R(\mathbf{x})$ definido no Capítulo 4, delimitada por
entrada e saída. Um trânsito é positivo se durante ele houve arrasto de âncora
capaz de danificar o cabo, e negativo em caso contrário.

Duas alternativas foram descartadas. A unidade "cena" torna a prevalência
dependente da largura da faixa do sensor, que é uma propriedade instrumental e
não do fenômeno. A unidade "detecção" confunde a avaliação do detector com a do
sistema, já que um alvo detectado três vezes na mesma passagem não são três
casos.

## A aritmética da taxa base

### Os dois termos

O denominador é o número de trânsitos pelo corredor em um período. Em corredores
como o Golfo da Finlândia, que estão entre os de tráfego mais denso do mundo,
essa grandeza é de várias dezenas de milhares por ano, e é diretamente
mensurável a partir dos acervos de AIS do Capítulo 3, sendo, aliás, um dos
poucos números deste trabalho que se obtém com precisão.

O numerador é o número de eventos genuínos. O Capítulo 8 documenta um punhado de
casos em toda a região báltica ao longo de vários anos. Mesmo com generosidade
na contagem, incluindo casos não confirmados judicialmente e tratando cada cabo
afetado como evento distinto, a ordem de grandeza permanece de poucos eventos
por ano distribuídos por muitos corredores.

A prevalência por trânsito situa-se, portanto, na faixa de $10^{-4}$ a
$10^{-5}$. Esse é o número que governa tudo o que segue.

### O cálculo

Com sensibilidade $\mathrm{Se}$, especificidade $\mathrm{Es}$ e prevalência
$\pi$, o valor preditivo positivo é

$$\mathrm{VPP} = \frac{\mathrm{Se}\cdot\pi}{\mathrm{Se}\cdot\pi + (1-\mathrm{Es})(1-\pi)}.$$

A tabela seguinte instancia a expressão para $\pi = 10^{-4}$ e
$\mathrm{Se} = 0{,}8$. Os valores são **ilustrativos**: servem para exibir a
estrutura do problema, e não para antecipar os resultados do Capítulo 9, que
usarão as grandezas medidas no corredor efetivamente escolhido.

| Especificidade | Falsos positivos por 20 000 trânsitos | VPP aproximado |
|---|---|---|
| 0,99 | 200 | 0,8 % |
| 0,999 | 20 | 7 % |
| 0,9999 | 2 | 44 % |
| 0,99999 | 0,2 | 89 % |

A leitura é direta e severa. **Uma especificidade de 99 %, que em quase qualquer
outro domínio seria considerada excelente, produz um conjunto de positivos
composto por mais de 99 % de erros.** Para que a maioria dos alertas fosse
verdadeira seria preciso uma especificidade acima de 99,99 %, isto é, menos de
um falso positivo a cada dez mil trânsitos rotineiros, sustentada em presença de
gelo, mau tempo, tráfego pesqueiro e todos os confundidores da seção seguinte.

Nada disso é consequência de um detector ruim. É consequência da prevalência, e
seria igualmente verdadeiro para um sistema perfeito em todos os demais
aspectos.

## O peso de evidência exigido

A formulação do Capítulo 4 permite enunciar o mesmo fato de forma mais útil.
Como a saída do sistema é uma razão de verossimilhança $\Lambda$, e

$$\text{chance posterior} = \Lambda \times \text{chance a priori},$$

a chance a priori de aproximadamente $10^{-4}$ implica que, para levar a chance
posterior a um, isto é, para que a hipótese de arrasto se torne tão provável
quanto a alternativa, é necessário

$$\Lambda \approx 10^{4}.$$

Em termos de peso de evidência [@good1985], isso corresponde a cerca de quarenta
decibéis. É uma exigência elevada, e enunciá-la assim tem três vantagens sobre a
tabela anterior.

Primeiro, ela transforma a taxa base de obstáculo em **especificação de
projeto**: sabe-se quanta evidência é preciso produzir, e pode-se perguntar,
descritor por descritor, quanto cada um contribui para esse total. Segundo, ela
deixa explícito que o sistema não precisa "acertar", mas produzir evidência de
força mensurável, que outro processo combinará com o que mais souber. Terceiro,
ela é honesta quanto ao que muda a conclusão: um investigador que saiba que
houve uma falha de cabo naquele traçado e naquele dia opera com uma chance a
priori radicalmente diferente, e o mesmo $\Lambda$ produz então uma conclusão
forte. **A utilidade do sistema depende de quem o usa e do que essa pessoa já
sabe**, que é a definição de um instrumento de atribuição, e não de alerta.

## Confundidores

### Pesca de arrasto

O confundidor dominante, e aquele em que reside a ironia central do problema.

Um arrasteiro em operação normal desloca-se em velocidade baixa e sustentada,
com rumo persistente, arrastando equipamento pesado pelo fundo. A assinatura
cinemática é quase indistinguível da de uma embarcação arrastando âncora, e a
semelhança não é acidental, é física: em ambos os casos um objeto pesado é
rebocado pelo leito a velocidade reduzida.

A ironia é que, conforme o Capítulo 2, **a pesca de arrasto é historicamente a
principal causa acidental de dano a cabos**. O comportamento que o sistema
procura como sinal de ameaça é também a explicação inocente mais comum e, ao
mesmo tempo, a causa mais frequente do próprio dano que se quer prevenir.

Isso obriga a distinguir dois propósitos que a literatura mistura:

- **Para proteção da infraestrutura**, a distinção é dispensável. Se o objetivo
  é evitar que o cabo seja rompido, um arrasteiro sobre o traçado é tão
  relevante quanto um navio arrastando âncora, e o sistema não precisa
  separá-los.
- **Para atribuição**, a distinção é tudo. E é ela que o sensoriamento remoto
  tem mais dificuldade em fazer.

Há elementos discriminantes disponíveis: tipo de embarcação declarado no AIS,
histórico de comportamento, compatibilidade com pesqueiros conhecidos, padrão de
manobra em área, já que a pesca costuma produzir trajetórias em varredura, e não
um segmento retilíneo longo. Nenhum deles é conclusivo, e o primeiro depende de
informação declarada pelo próprio suspeito.

### Falha mecânica do sistema de retenção da âncora

Este confundidor não constava do planejamento inicial e foi identificado a
partir do caso *Vezhen*, documentado no Capítulo 8. O Ministério Público sueco
arquivou o caso como acidental [@vezhen_mp2025]: dos três dispositivos de
retenção da âncora, dois estavam inoperantes havia tempo, e o terceiro cedeu ao
impacto de uma onda em horário determinado. A âncora caiu sem qualquer ação da
tripulação.

O ponto é mais forte do que o de qualquer outro confundidor, e merece enunciado
explícito:

> A assinatura produzida por uma âncora que cai por falha mecânica não é
> *parecida* com a de um arrasto deliberado. É **idêntica**, porque é o mesmo
> fenômeno físico. A âncora está no fundo, o navio se desloca, o cabo é
> danificado. A diferença entre as duas hipóteses está inteiramente a bordo, no
> estado de manutenção do navio e na intenção da tripulação, e é, por
> construção, invisível a qualquer sensor remoto.

Disso decorre um **teto de precisão independente de sensor**, análogo ao teto de
revocação do Capítulo 6 e igualmente merecedor de enunciado como resultado.
Nenhuma melhoria de resolução, de revisita ou de algoritmo desloca esse limite:
ele é fixado pela fração de eventos de arrasto que têm causa acidental, e essa
fração é uma propriedade do estado da frota, e não do sistema de observação.

Avaliações de inteligência divulgadas em janeiro de 2025 generalizaram essa
leitura para o conjunto dos incidentes bálticos, apontando tripulações
inexperientes em navios mal mantidos e ausência de evidência de direção estatal.
Se essa leitura estiver correta, a fração acidental é alta e o teto de precisão
é baixo.

### Demais confundidores

Para cada um, a assinatura esperada e a possibilidade de desambiguação com os
dados públicos do Capítulo 3.

O **desvio e a navegação em gelo** reduzem velocidade e alteram rumo de forma
que imita hesitação anômala. São desambiguáveis, em parte, com os produtos de
gelo e as cartas operacionais: uma redução de velocidade coincidente com entrada
em zona marginal tem explicação suficiente.

O **capeamento e a redução de velocidade por mau tempo** são desambiguáveis com
ERA5, que fornece vento e estado de mar no instante e no local, e que foi o
fator invocado na conclusão oficial do caso *Vezhen*.

A **espera de praticagem e o fundeio em área de espera** produzem baixa
velocidade prolongada, mas em áreas designadas e com padrão de deriva em torno
de um ponto, e não de deslocamento sustentado. São desambiguáveis por
geografia, desde que as áreas de fundeio sejam mapeadas, o que precisa entrar na
aquisição de dados.

A **operação científica**, com reboque de sensores e perfilagem, produz
velocidade baixa e rumo persistente, muito próximos da assinatura de interesse.
É difícil de desambiguar sem informação sobre campanhas em curso, que não é
sistematicamente pública.

A **manutenção do próprio cabo** é o confundidor mais perverso do conjunto: por
construção, ocorre *sobre o traçado*, em velocidade baixa, com manobra anômala e
com equipamento no fundo. Satisfaz todos os critérios do sistema ao mesmo tempo.
É desambiguável apenas com informação da operadora sobre janelas de reparo,
informação que existe, mas não é pública em tempo real.

### O padrão

Nota-se um padrão nos parágrafos acima que vale explicitar. Vários confundidores
são desambiguáveis **em parte**, e a desambiguação depende de dados que não
pertencem ao sistema: campanhas científicas, janelas de manutenção, áreas de
fundeio. Isso reforça a decisão do Capítulo 4 de entregar $\Lambda$ com sua
decomposição no lugar de um rótulo: o usuário que dispuser desses dados pode
atualizar a conclusão de forma explícita, ao passo que um classificador binário
teria que ter decidido sem eles.

## Onde as contribuições 1 e 2 entram na aritmética

As duas primeiras contribuições atuam sobre termos distintos da mesma expressão,
e é aqui que isso se torna quantitativo.

O número esperado de falsos positivos por período é, aproximadamente,

$$\mathbb{E}[FP] \;\approx\; \underbrace{\lambda_{\mathrm{fa}}(c, w, m)}_{\text{Capítulo 5}} \times \underbrace{A_{\mathrm{ef}}}_{\text{Capítulo 4}} \times \; N_{\mathrm{pass}},$$

com $\lambda_{\mathrm{fa}}$ a densidade de falso alarme por área medida por
estrato e $A_{\mathrm{ef}} = \int R(\mathbf{x})\,\mathrm{d}\mathbf{x}$ a área
efetiva do corredor.

A Contribuição 1 reduz $A_{\mathrm{ef}}$ em ordens de grandeza sem remover
eventos genuínos, porque, por argumento físico, eles não ocorrem fora do suporte
de $R$. É uma redução do denominador da prevalência que não afeta o numerador, e
portanto **aumenta a prevalência dentro da região observada**. É esse o mecanismo
pelo qual o corredor melhora a precisão, e enunciá-lo assim mostra por que ele é
mais eficaz do que qualquer refinamento do classificador: mover $\pi$ de
$10^{-5}$ para $10^{-3}$ vale mais que duas ordens de grandeza de melhoria em
especificidade, e é mais fácil de conseguir.

A Contribuição 2 caracteriza $\lambda_{\mathrm{fa}}$ e mostra sob que condições
ele cresce a ponto de anular o ganho anterior. As duas se encontram nesta
multiplicação, e o Capítulo 9 reporta o produto.

## Custo assimétrico

### A matriz

Um falso positivo e um falso negativo não custam o mesmo, e nenhum dos dois é
barato no Ártico.

O custo de um **falso positivo** tem duas formas. A branda é operacional:
deslocar um ativo de vigilância por distâncias que, no Ártico, são de centenas
ou milhares de quilômetros, com tempo de resposta medido em dias. A severa é
diplomática: abordar ou questionar uma embarcação de bandeira estrangeira com
base em evidência que se revela infundada tem custo político real e, como o
Capítulo 10 detalha, frequentemente sem base jurídica que a ampare.

O custo de um **falso negativo** exige uma correção importante em relação à
formulação inicial do projeto. É tentador equipará-lo ao custo do dano, com
reparo milionário, interrupção de serviço e semanas de indisponibilidade. Mas
isso atribuiria ao sistema uma capacidade que ele não tem. Como estabelecido no
Capítulo 6, a detecção é retrospectiva ou concomitante, e como estabelecido no
Capítulo 10, não há autoridade de interdição. **O sistema não previne o dano.**

O custo de um falso negativo é, portanto, o custo de **não produzir evidência de
atribuição** para um evento que ocorreu: um episódio que permanece sem
explicação, um caso que não se sustenta, um precedente de impunidade. É um custo
real e possivelmente alto, mas de natureza diferente do custo do reparo, e
confundi-los levaria a otimizar o limiar para um objetivo que o sistema não
persegue.

### Uso

Fixada a matriz $C$, o limiar de ação, que na formulação do Capítulo 4 é um
limiar sobre chance posterior e não sobre a saída do classificador, é escolhido
por minimização de custo esperado, e não por maximização de qualquer métrica
simétrica. Reporta-se a curva de custo esperado em função do limiar, para faixas
plausíveis das razões de custo, no lugar de um único ponto de operação: as
razões de custo são juízos institucionais, e não parâmetros técnicos, e cabe a
quem decide fixá-las.

## Protocolo de avaliação

Do exposto decorre o protocolo, que se aplica a todos os resultados do
Capítulo 9.

**Adota-se:** curvas de precisão-revocação por estrato; número esperado de
falsos positivos por corredor e por ano, que é mais interpretável que a precisão
para quem opera o sistema; curvas de custo esperado; e diagramas de
confiabilidade para a calibração de $\Lambda$, sem os quais a formulação em
razão de verossimilhança perde sentido.

**Exclui-se, com justificativa:**

*Acurácia.* Com prevalência de $10^{-4}$, um sistema que classifique tudo como
negativo tem acurácia de 99,99 %. A métrica é não apenas pouco informativa, é
maximizada pela inutilidade.

*Área sob a curva ROC.* O eixo da taxa de falso positivo é dominado pelo enorme
número de negativos verdadeiros, de modo que variações que representam centenas
de falsos alarmes deslocam a curva de forma imperceptível. Sob desbalanceamento
extremo, a ROC produz curvas excelentes para sistemas inúteis, e a curva de
precisão-revocação é a representação apropriada [@saito2015].

*Métricas agregadas sobre estratos.* Conforme o Capítulo 5, a agregação sobre
condições de gelo e vento esconde a variação que o trabalho se propõe a medir.

## O problema de olhar em muitos lugares

Um efeito adicional, ausente da formulação original, precisa ser registrado
porque agrava tudo o que foi dito.

O sistema não avalia um trânsito: varre muitos corredores, ao longo de muitos
dias, em muitas cenas. Cada avaliação é uma oportunidade de erro, e o número
esperado de falsos positivos escala com o produto de todas essas dimensões,
ainda que a taxa por avaliação seja baixa. Um sistema com um falso positivo a
cada dez mil trânsitos, operando sobre um corredor com cinquenta mil trânsitos
anuais, produz cinco alertas falsos por ano, em um fenômeno cujos eventos
genuínos são raros.

A consequência prática é que **o desempenho precisa ser reportado em unidades
absolutas por período**, e não apenas em taxas. "Um falso positivo a cada dez
mil trânsitos" e "cinco alertas falsos por ano neste corredor" são o mesmo
número e comunicam coisas muito diferentes a quem vai operar o sistema.

## Consequência para o que o trabalho pode afirmar

Este capítulo não conclui que o sistema seja inútil. Conclui algo mais preciso,
e que orienta a leitura de todo o restante da dissertação:

1. Um alerta isolado, sem contexto adicional, é quase certamente falso, e
   apresentá-lo como detecção seria enganoso independentemente da qualidade da
   engenharia.
2. O sistema produz valor quando a chance a priori não é a da população geral,
   isto é, quando há uma falha de cabo registrada, uma janela temporal, uma
   suspeita prévia. Aí, o mesmo $\Lambda$ sustenta conclusões fortes.
3. Existe um teto de precisão fixado pela fração acidental dos eventos, que
   nenhuma melhoria técnica ultrapassa.
4. A avaliação precisa ser feita sob a prevalência real, com métricas que não a
   escondam.

Os pontos 1 e 2, tomados em conjunto, dizem que a aplicação natural do sistema é
**retrospectiva e dirigida**, e não prospectiva e indiscriminada. É a mesma
conclusão a que o Capítulo 6 chegou pela via da revisita e o Capítulo 10 alcança
pela via jurídica: três caminhos independentes convergindo no mesmo lugar.


# O problema dos rótulos e a estratégia de validação

O Capítulo 7 estabeleceu o que é preciso medir. Este capítulo trata de um
obstáculo anterior: não existe conjunto de dados rotulado contra o qual medir. A
estratégia adotada não contorna essa ausência, mas a decompõe. Cada quantidade
do protocolo de avaliação é estimada a partir da fonte de rótulo que a comporta,
e nenhuma é estimada a partir de uma fonte que não a sustenta.

## A ausência de *ground truth*

Não há registro sistemático de eventos de arrasto de âncora sobre cabos, muito
menos de eventos deliberados. As razões são estruturais: o fenômeno é raro; a
determinação de causa depende de investigação a bordo, e não de observação
remota; os registros de falha de cabo pertencem a operadoras e não são públicos
de forma consolidada; e a qualificação jurídica, quando ocorre, chega anos
depois e frequentemente não conclui, como o Capítulo 10 discute a propósito do
caso *Eagle S*, extinto sem exame de mérito.

O trabalho reconhece isso de frente, sem fabricar um conjunto de conveniência. A
consequência mais importante é enunciada já aqui, porque governa todo o
capítulo:

> **A precisão do sistema não pode ser medida empiricamente.** Com um punhado de
> eventos positivos conhecidos, nenhuma estimativa direta de precisão tem poder
> estatístico. O que pode ser medido separadamente é a revocação, sobre eventos
> simulados e sobre os poucos reais, e a densidade de falso alarme, sobre uma
> população de negativos que é abundante. A precisão é então **calculada** a
> partir dessas duas grandezas e da prevalência do Capítulo 7, e não observada.

Confundir cálculo com medida seria o erro metodológico mais grave possível neste
trabalho, e é o que um conjunto de avaliação artificialmente balanceado
produziria.

## Quatro fontes de rótulo

### Negativos abundantes

A população de trânsitos rotineiros pelo corredor é grande, mensurável e, na
prática, integralmente negativa: dada a prevalência estabelecida, tratar todos
os trânsitos como negativos introduz um erro de contaminação da ordem de
$10^{-4}$, desprezável para a estimação da densidade de falso alarme.

Esta é a fonte de rótulo mais confiável do trabalho, e é o que torna possível
estimar bem o único termo que a aritmética do Capítulo 7 realmente exige com
precisão. A ela soma-se o conjunto de **células de controle** definido no
Capítulo 5, que fornece negativos rotulados especificamente para a medida de
falso alarme por gelo, em regiões sem tráfego.

### Positivos sintéticos

A injeção sintética é a única fonte capaz de produzir positivos em quantidade
suficiente para estimar revocação com poder estatístico, e é o que sustenta as
curvas do Capítulo 6.

A injeção opera em dois níveis, com pesos distintos.

No **nível de trajetória**, que é o primário, geram-se trajetórias com
cinemática de arrasto, isto é, velocidade na faixa característica, persistência
de rumo e geometria de cruzamento, sobre condições ambientais reais: batimetria,
gelo e vento efetivamente observados nas datas simuladas, e sequência de
passagens reconstruída do catálogo conforme o Capítulo 6. Isso exercita o campo
de risco, os descritores cinemáticos e o modelo de captura, que é onde estão as
três contribuições.

No **nível de imagem**, que é secundário e limitado, inserir alvos sintéticos em
cenas SAR reais exercitaria o detector, mas reproduzir fielmente assinatura de
casco, esteira, lóbulos laterais e interação com *speckle* é difícil, e um alvo
sintético mal formado produz estimativas de detecção otimistas de forma não
quantificável. Usa-se de forma restrita e com a limitação declarada; a
caracterização do detector apoia-se preferencialmente na verdade positiva
parcial do Capítulo 5, isto é, em embarcações reais com AIS confirmado.

A ameaça óbvia à validade é a circularidade: trajetórias sintéticas geradas a
partir do mesmo modelo cinemático que o classificador procura produziriam
revocação artificialmente alta. Mitiga-se gerando as trajetórias a partir de
**parâmetros físicos**, como comprimento de amarra, velocidade, resistência de
arrasto e rumo, e não a partir dos descritores usados na pontuação, e
verificando a plausibilidade das trajetórias geradas contra as poucas
trajetórias reais disponíveis.

### Rótulos-proxy

Registros de falha e reparo de cabo fornecem positivos fracos: a data é
confiável, a posição é aproximada, e a causa é frequentemente indeterminada. São
tratados como rótulos com incerteza espaço-temporal explícita, propagada para a
avaliação. Um evento cuja posição é conhecida com incerteza de dezenas de
quilômetros não pode confirmar nem refutar uma associação a uma trajetória
específica com a mesma força de um evento bem localizado.

Sua utilidade principal não é validar detecções individuais, mas **estimar o
numerador da prevalência** do Capítulo 7 com menos viés do que a contagem de
casos que chegaram à imprensa.

### Os eventos reais

O conjunto documentado está consolidado em `docs/casos-validacao.md`, com fontes
e ressalvas. Em resumo: episódios árticos em 2021, 2022 e 2025, todos com
documentação insuficiente ou cobertura de dados inadequada; e a sequência
báltica de 2023 a 2026, que compreende o Balticconnector, os cabos associados ao
*Yi Peng 3*, o Estlink 2 e cabos vizinhos no caso *Eagle S*, o enlace
Gotland-Ventspils no caso *Vezhen*, o cabo Elisa no caso *Fitburg*
[@nbi_fitburg2026] e o enlace Letônia-Gotland de janeiro de 2026, ainda sem
embarcação identificada. Some-se o caso de Taiwan, fora do recorte geográfico,
mantido como contraste jurisdicional.

Aplicados os critérios de viabilidade, a saber, data e posição conhecidas,
cobertura Sentinel-1 provável, AIS disponível e profundidade compatível, restam
aproximadamente **seis eventos utilizáveis, todos bálticos**.

Três consequências, todas já incorporadas aos capítulos anteriores. A primeira é
que seis eventos são pouco para treinar e apertado para validar, o que confirma
a divisão de tarefas entre injeção sintética e casos reais. A segunda é que
praticamente todo o *ground truth* está fora do domínio de interesse, o que
fundamenta o desenho de dois domínios do Capítulo 3. A terceira, e a mais
consequente, é que **todos pertencem ao regime cooperativo** do Capítulo 6:
foram identificados pelo AIS, e não por detecção SAR de alvo não cooperativo. O
regime não cooperativo permanece sem um único caso que o instancie.

## O caso *Vezhen* como negativo rotulado

Um dos seis eventos utilizáveis tem estatuto especial e merece tratamento
separado.

No caso *Vezhen*, a investigação sueca estabeleceu causa mecânica, com falha de
dois dos três dispositivos de retenção e o terceiro cedendo ao impacto de uma
onda em horário determinado, e arquivou o caso como acidental [@vezhen_mp2025].
Trata-se, portanto, de um evento de arrasto real, com hora conhecida, **rotulado
como negativo** quanto à hipótese deliberada.

Seu valor é duplo e vai além de aumentar o tamanho da amostra. Ele é o negativo
mais informativo do conjunto, porque é o único que se situa exatamente onde o
classificador tem de decidir. E ele fornece a verificação empírica da tese do
Capítulo 7: se o sistema atribuir a esse caso um $\Lambda$ elevado, e é o que se
espera, já que a assinatura é a de um arrasto genuíno, isso não é uma falha do
sistema, mas a **confirmação de que a assinatura cinemática não distingue
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
| Precisão e VPP | **Calculados**, não medidos | Não se aplica |
| Verificação externa | Seis eventos reais, *leave-one-event-out* | Muito baixo; qualitativo |

A última linha merece ênfase. Com seis eventos, a validação
*leave-one-event-out* não produz uma estimativa de desempenho, mas seis estudos
de caso conduzidos sob disciplina. Seu valor é qualitativo e diagnóstico:
verificar que o sistema não falha de modo grosseiro em casos conhecidos, e
examinar em detalhe aqueles em que falha. Apresentá-la como medida de acurácia
seria o tipo de excesso que esta dissertação se propõe a evitar.

### *Leave-one-event-out*

Para cada evento, todos os componentes ajustáveis, isto é, limiares por estrato,
parâmetros do campo de risco e calibração de $\Lambda$, são reestimados sem
qualquer informação daquele evento, incluindo a exclusão do período e da região
correspondentes dos conjuntos de ajuste. O evento é então avaliado pelo sistema
resultante.

Reporta-se, para cada caso: o $\Lambda$ atribuído, sua decomposição por
descritor, se e quando a trajetória entrou no suporte do campo de risco, quais
passagens ocorreram na janela do evento e o que cada uma observou.

### Pré-registro do plano de análise

Com seis eventos e um sistema com múltiplos parâmetros ajustáveis, os graus de
liberdade do pesquisador excedem largamente a informação disponível nos dados.
Qualquer escolha feita depois de observar o desempenho nos casos reais, seja um
limiar, uma faixa de velocidade ou uma definição de estrato, contamina a
verificação e a transforma em ajuste.

Adota-se, por isso, o **pré-registro**: o plano de análise, com unidade,
estratos, métricas, limiares, critérios de exclusão de cenas e forma de
reportar, é fixado e versionado no repositório antes do primeiro contato com os
eventos reais. Alterações posteriores são permitidas, desde que declaradas como
tais e reportadas separadamente das análises pré-registradas.

Esta é uma salvaguarda barata e incomum na literatura de sensoriamento remoto.
Em um trabalho cujo argumento central é sobre honestidade estatística, sua
ausência seria difícil de defender.

## O que não pode ser validado

Duas coisas, e ambas precisam ser ditas com todas as letras.

A primeira é a **intenção**. Nenhum elemento do protocolo acima distingue
arrasto deliberado de arrasto acidental, porque nenhum dado disponível contém
essa informação. O caso *Vezhen* demonstra que a distinção depende do estado de
manutenção do navio e da conduta da tripulação, isto é, de informação de bordo.
O sistema não é validado para detectar sabotagem porque **não se propõe a
detectá-la**.

A segunda é o **desempenho no domínio alvo**. Não há eventos árticos
utilizáveis. O desempenho no Ártico é estimado por transferência a partir do
domínio de calibração, com a degradação por gelo medida no Capítulo 5 e a
diferença de revisita modelada no Capítulo 6, mas não é verificado contra nenhum
evento real. Essa é a limitação mais séria do trabalho, e o Capítulo 10 a
registra como tal.

## Enquadramento

O que o sistema detecta é **assinatura cinemática compatível com arrasto de
âncora sobre um trecho onde o dano seria fisicamente possível**. Não sabotagem,
não intenção, não sequer dano, já que a ocorrência do dano é estabelecida pela
falha do cabo, e não pela observação remota.

Essa formulação deve aparecer não apenas nesta seção, mas nos títulos das
figuras, nas legendas das tabelas e no resumo. A razão é prática, e a
experiência dos casos documentados a sustenta: um resultado apresentado como
"detecção de sabotagem" será citado como tal, independentemente das ressalvas no
corpo do texto. A precisão terminológica é a única defesa disponível contra o
uso indevido do próprio trabalho e, como o Capítulo 7 argumentou por outra via,
é também o que dá ao trabalho a credibilidade que uma afirmação mais ambiciosa
lhe custaria.


# Resultados

> **Estado deste capítulo.** As seções abaixo especificam integralmente as
> figuras, tabelas e quantidades que serão reportadas, mas **não contêm valores
> medidos**, porque o processamento ainda não foi executado. Cada seção declara
> o que será apresentado, em que unidades, e qual expectativa foi registrada
> *antes* da medida, conforme o pré-registro do Capítulo 8, consolidado em
> `docs/pre-registro.md`.
>
> A ordem é deliberada: os resultados que podem invalidar o desenho vêm
> primeiro, e os que dependem dos anteriores vêm depois. Um capítulo de
> resultados que começasse pelo desempenho do sistema esconderia que a
> viabilidade dos dados é condição para que esse desempenho signifique alguma
> coisa.

## Verificação de viabilidade

Primeiro resultado do trabalho, e o único que pode alterar a área de estudo.
Conforme o protocolo do Capítulo 3, é reportado mesmo quando favorável, porque
documenta a base factual da escolha de recorte.

**Tabela 9.1, cobertura por recorte candidato.** Uma linha por recorte (Golfo da
Finlândia; Barents meridional; Svalbard-continente), com: número de aquisições
Sentinel-1 por ano, discriminadas por modo, órbita e par polarimétrico;
distribuição dos intervalos entre passagens, com mediana e percentis, por ano e
por configuração de constelação; fração do corredor e do período com AIS no
nível de mensagem; taxa média de reporte observada; fração do corredor em
profundidade operável; e número de trânsitos anuais.

**Figura 9.1, distribuição de intervalos entre passagens.** Histograma por
recorte e por ano. É esta figura que sustenta o argumento central do Capítulo 6:
espera-se que ela exiba agrupamento pronunciado, e é a distância entre a mediana
e a média que quantifica o quanto a "revisita média" engana.

*Critério de rejeição registrado:* recorte descartado se a revisita efetiva
tornar o teto do Capítulo 6 vazio, se a cobertura AIS for insuficiente para o
casamento, ou se a fração em profundidade operável não produzir amostra. Nesse
caso muda-se a área, e não o método.

## Caracterização do corredor de risco

**Figura 9.2, componentes do campo de risco.** Painéis lado a lado para um
trecho representativo: batimetria, $w_{\mathrm{prof}}$, $w_{\mathrm{fundo}}$,
$w_{\mathrm{traç}}$ e o produto $R(\mathbf{x})$, sobre a mesma extensão
geográfica, com um *buffer* convencional sobreposto para comparação visual.

**Figura 9.3, curva de alcance da frota.** A função de sobrevivência
$w_{\mathrm{prof}}^{0}(d)$ estimada a partir da composição real de tráfego no
corredor, com bandas de incerteza refletindo a dispersão da relação de amarra
$s$. É o resultado que substitui o limiar postulado de profundidade por uma
quantidade derivada.

*Expectativa registrada:* que a curva caia a valores desprezáveis bem antes dos
duzentos metros usualmente citados, na faixa sugerida pela profundidade de
fundeio de projeto da frota mercante. Se não cair, a componente perde
justificativa física e o resultado deve ser reportado como tal.

**Tabela 9.2, redução do espaço de busca.** Valor de $\rho$, isto é, a razão
entre a área do *buffer* convencional e a área efetiva $A_{\mathrm{ef}}$, por
recorte e para uma faixa de meias-larguras convencionais, com a decomposição de
quanto cada componente contribui para a redução.

*Expectativa registrada:* $\rho$ de ordens de magnitude. Uma redução inferior a
uma ordem de grandeza enfraqueceria substancialmente a primeira contribuição, e
esse resultado deve ser reportado sem atenuação caso ocorra.

**Figura 9.4, sensibilidade à incerteza do traçado.** $\rho$ e a largura efetiva
do corredor em função de $\sigma_{\mathrm{traç}}$, que não é conhecida e é
tratada como parâmetro. Delimita a região de valores em que a contribuição se
sustenta.

## Desempenho do detector por estrato

**Figura 9.5, curva de degradação.** Densidade de falso alarme
$\lambda_{\mathrm{fa}}$ em função da concentração de gelo, a limiar fixo, com o
vento como família de curvas, medida nas células de controle do Capítulo 5.
Barras de incerteza refletindo a população de cada estrato.

**Figura 9.6, taxa de troca.** Revocação sobre a verdade positiva parcial em
função da concentração de gelo, mantida $\lambda_{\mathrm{fa}}$ constante. É o
resultado operacionalmente mais útil do capítulo: quanta capacidade de detecção
é preciso entregar para manter a precisão à medida que o gelo aumenta.

**Tabela 9.3, população por célula do desenho fatorial.** Concentração, vento,
modo e tipo de gelo. Reportada integralmente, com as células vazias
explicitadas, antes de qualquer agregação.

**Tabela 9.4, mitigações.** Para cada mitigação do Capítulo 5: redução em
$\lambda_{\mathrm{fa}}$, custo em revocação, custo em cobertura, esta última
como fração do corredor *e* como fração dos trânsitos excluídos, e
aplicabilidade, isto é, fração do acervo em que a mitigação pode ser usada.

**Figura 9.7, estratificação por textura versus por concentração.** Comparação
do poder informativo das duas variáveis de estratificação.

*Expectativa registrada:* que a textura local supere a concentração regional. Se
confirmada, implica que a variável de estratificação usada pela literatura é a
variável errada, e o resultado tem valor próprio.

**Declaração operacional.** O produto final da seção, na forma fixada no
Capítulo 5: o sistema é informativo até concentração $c^{*}$ sob vento até
$w^{*}$ na configuração $m$; acima disso, não.

## Probabilidade de detecção

**Figura 9.8, probabilidade de captura.** $P_{\mathrm{capt}}$ em função da
duração do evento, de uma a doze horas, calculada pela expressão exata sobre os
intervalos reconstruídos, com a aproximação por revisita média sobreposta. **A
distância entre as duas curvas é o resultado**, e não um detalhe de método.

**Figura 9.9, efeito da latitude.** Número de passagens por ciclo e
probabilidade de captura, no mesmo eixo de latitude, exibindo o ganho por
convergência orbital e a perda por agrupamento, porque é o balanço entre os dois
que importa.

**Figura 9.10, teto de revocação por regime.** $P_{\mathrm{det}}$ para os
regimes cooperativo e não cooperativo, por estrato de gelo, sem agregação.
Inclui $P_{\ge 2}$ para o caso não cooperativo em gelo, onde a classificação
tende a exigir duas passagens.

**Tabela 9.5, configuração de constelação por ano.** Revisita efetiva disponível
em cada ano do período de interesse, permitindo responder quanto da não
observação dos incidentes de 2022 a 2024 é atribuível à configuração reduzida
daquele período.

## Precisão calculada e custo esperado

Conforme o Capítulo 8, a precisão não é medida: é calculada a partir da
revocação estimada sobre o conjunto sintético, da densidade de falso alarme
medida nas células de controle e da prevalência estimada. A distinção deve
aparecer no texto e nas legendas.

**Tabela 9.6, prevalência estimada.** Numerador, denominador e intervalo, por
corredor, com as fontes de cada termo e a incerteza do numerador declarada.

**Figura 9.11, curvas de precisão-revocação por estrato.** Nunca agregadas.

**Tabela 9.7, falsos positivos esperados por corredor e por ano.** Em unidades
absolutas, conforme exigido pelo Capítulo 7, ao lado da taxa por trânsito, para
tornar visível a diferença de leitura entre as duas formas.

**Figura 9.12, peso de evidência.** Distribuição de $\log \Lambda$ para
trajetórias rotineiras e para trajetórias de arrasto simuladas, com a linha
correspondente ao valor exigido pela chance a priori do Capítulo 7.

*Esta é a figura que responde à pergunta central do trabalho:* o sistema produz
evidência de força suficiente para que a chance posterior deixe de ser
desprezável? A resposta pode ser negativa, e nesse caso deve ser reportada como
o resultado principal.

**Figura 9.13, diagrama de confiabilidade.** Calibração de $\Lambda$: valor
declarado contra força de evidência observada. Sem esta figura, a formulação em
razão de verossimilhança perde sentido.

**Figura 9.14, custo esperado.** Em função do limiar sobre chance posterior,
para faixas plausíveis das razões de custo do Capítulo 7, com a região de
indiferença marcada.

## Estudos de caso

Seis eventos sob protocolo *leave-one-event-out*. Conforme o Capítulo 8, **não
constituem estimativa de desempenho**: são estudos de caso conduzidos sob
disciplina, e a apresentação deve dizê-lo.

**Tabela 9.8, resumo por caso.** Para cada evento: $\Lambda$ atribuído; se e
quando a trajetória entrou no suporte de $R$; passagens ocorridas na janela e o
que cada uma observou; regime cooperativo ou não; e condição ambiental.

**Figuras 9.15 a 9.20, um painel por caso.** Trajetória sobre o campo de risco,
perfil temporal de velocidade, instantes de passagem, e decomposição de
$\Lambda$ por descritor.

**Tratamento específico do caso *Vezhen*.** Reportado com a moldura fixada no
Capítulo 8: um $\Lambda$ elevado neste caso confirma que a assinatura cinemática
não distingue mecanismo, e **não** constitui falha do sistema. A legenda da
figura deve conter essa afirmação, e não apenas o texto corrido.

## Ablação

**Tabela 9.9, contribuição isolada de cada componente.** Sistema completo contra
variantes com remoção de: componente de profundidade; componente de tipo de
fundo; componente de traçado; limiar adaptativo por estrato; correção do
deslocamento em azimute; e cada descritor cinemático.

*Expectativa registrada quanto ao tipo de fundo:* que sua remoção altere pouco o
desempenho. Se confirmada, o resultado honesto é declarar que a contribuição é
de profundidade e traçado, e não de substrato, e a componente deve ser
apresentada como tal na versão final do método.

*Expectativa registrada quanto à correção de azimute:* que sua remoção produza
aumento mensurável de falsas embarcações escuras, quantificando uma fonte de
erro que a literatura frequentemente omite.

## Transferência entre domínios

Conforme o Capítulo 3, a diferença entre os domínios é o resultado, e não um
efeito colateral.

**Tabela 9.10, desempenho por domínio.** Todas as quantidades principais, lado a
lado para calibração e alvo, com a decomposição da diferença nos eixos que a
produzem: gelo, modo de aquisição e resolução, densidade de AIS, revisita,
densidade de tráfego.

**Figura 9.21, decomposição da degradação.** Quanto de cada eixo responde pela
perda de desempenho na transferência.

*Registro obrigatório:* o desempenho no domínio alvo é estimado, e não
verificado contra evento real. Nenhuma tabela desta seção deve ser apresentada
sem essa ressalva na legenda.

## Síntese

Fecha o capítulo uma tabela única reunindo os números que o Capítulo 10 utiliza:
$\rho$, $c^{*}$, teto de revocação por regime, precisão calculada, falsos
positivos esperados por ano e peso de evidência típico. É a tabela que um leitor
que pule os detalhes precisa encontrar, e a que sustenta as afirmações da
discussão.


# Discussão

## Detecção não é autoridade

O regime jurídico aplicável a danos a cabos submarinos é o elemento que
reposiciona toda a contribuição deste trabalho, e convém enunciá-lo com
precisão, porque a imprecisão nesse ponto é comum e consequente.

A Convenção das Nações Unidas sobre o Direito do Mar dedica ao tema um conjunto
reduzido de dispositivos [@unclos; @davenport2018]. O central é o artigo 113,
que obriga cada Estado a **adotar legislação** tipificando como infração o
rompimento ou dano a cabo submarino, doloso ou por negligência culpável,
praticado por navio que arvore sua bandeira ou por pessoa sujeita à sua
jurisdição. A estrutura da obrigação é a de um dever de legislar dirigido ao
Estado de bandeira, e não a atribuição de competência ao Estado costeiro.

Três consequências decorrem dessa arquitetura, e as três operam contra o Estado
em cujas águas o cabo é danificado.

A primeira é que **a Convenção é quase silenciosa quanto à zona econômica
exclusiva**. Fora do mar territorial, não há dispositivo que autorize
expressamente o Estado costeiro a adotar medidas de execução no mar contra navio
estrangeiro suspeito de danificar infraestrutura submarina. O Estado costeiro
pode legislar sobre seus próprios nacionais e navios, mas não adquire
competência executiva sobre terceiros pelo simples fato de o dano ter ocorrido
em sua ZEE.

A segunda é que **a competência recai sobre a bandeira**. O regime funciona
quando o Estado de bandeira tem capacidade e disposição para processar. Quando o
navio arvora bandeira de conveniência, sem vínculo substancial com o armador nem
interesse na persecução, a obrigação do artigo 113 permanece formalmente
atendida e materialmente vazia. É a essa configuração que a literatura recente
se refere como lacuna de persecução [@ejiltalk_lacuna; @lott_baltico2025].

A terceira é que **detectar não confere legitimidade para agir**. Ainda que o
sistema proposto neste trabalho funcionasse perfeitamente, identificando a
embarcação, a trajetória e o instante, o Estado costeiro não passaria a dispor,
por isso, de base jurídica para interceptar, abordar ou processar
[@lieber_clion]. A evidência não cria competência.

## A lacuna de persecução, demonstrada empiricamente

O argumento acima é doutrinário, mas não precisa ser sustentado apenas em
doutrina. O conjunto de casos do Capítulo 8 o demonstra.

O caso *Eagle S* é a demonstração mais direta. Uma embarcação arrastou âncora
por aproximadamente noventa quilômetros, rompendo cinco cabos, incluindo um
enlace de energia entre dois Estados. A investigação identificou a embarcação, a
trajetória e o dano. Em outubro de 2025, o Tribunal Distrital de Helsinque
extinguiu as acusações **por falta de jurisdição**: ainda que a Finlândia
pudesse ser considerada local do crime, o tribunal entendeu que a lei penal
finlandesa não podia ser aplicada, dadas as restrições decorrentes da Convenção,
porque os fatos ocorreram na zona econômica exclusiva e fora do mar territorial
[@eagles_helsinque2025; @ejiltalk_eagles]. O Estado foi ainda condenado a
ressarcir custas aos réus. A decisão foi objeto de recurso pela acusação e, até
a redação deste texto, encontra-se pendente no tribunal de apelação
[@eagles_recurso2026], de modo que a questão jurídica central permanece em
aberto e esta seção pode precisar de atualização.

O contraste com o caso de Taiwan, mantido no conjunto por essa exata razão, é
instrutivo. Conduta materialmente equivalente, com entrada deliberada em zona
proibida de fundeio, arrasto de amarra longa e rompimento de cabo, resultou em
condenação penal, com pena privativa de liberdade e indenização
[@tainan_hongtai2025]. A diferença determinante não foi a qualidade da evidência
nem a gravidade da conduta: foi o espaço marítimo. Em águas sob jurisdição plena
do Estado costeiro, a persecução funcionou; na zona econômica exclusiva, não.

Essa comparação é o argumento do capítulo em forma empírica, e é preferível à
exposição puramente doutrinária porque não depende de interpretação: dois
tribunais, condutas semelhantes, resultados opostos, e uma única variável
explicativa.

## Um segundo achado dos mesmos autos

A leitura das decisões revela um elemento adicional, que não pertence ao
argumento jurídico mas confirma, de fonte independente, a tese do Capítulo 7.

Além de decidir pela falta de jurisdição, o tribunal no caso *Eagle S* consignou
que a perda da âncora decorrera de **falha técnica**, e não de ação deliberada,
não encontrando evidência de dolo ou de negligência grave suficiente para
sustentar responsabilidade penal, ainda que a acusação sustentasse que o estado
de manutenção do navio tornava o evento previsível. Some-se a isso o
arquivamento do caso *Vezhen* pelo Ministério Público sueco, também por causa
mecânica estabelecida [@vezhen_mp2025].

Dois dos casos mais visíveis do conjunto foram, portanto, apreciados por
autoridades distintas, em jurisdições distintas, e ambos qualificados como
acidentais por defeito de equipamento. Isso é evidência empírica direta para o
**teto de precisão independente de sensor** enunciado no Capítulo 7: se a fração
acidental entre os eventos de arrasto é alta, e as decisões disponíveis sugerem
que é, então a precisão máxima alcançável por qualquer sistema que observe
apenas a assinatura cinemática é baixa, por razões que não têm relação com
sensor, algoritmo ou resolução.

Cabe a cautela de registrar que a qualificação de causa nessas decisões foi
feita em contexto processual específico, sob ônus probatório penal, e que uma
delas está sob recurso. A inferência sobre a fração acidental é, por isso,
indicativa e não conclusiva, mas aponta na mesma direção que as avaliações de
inteligência divulgadas em janeiro de 2025, que atribuíram os incidentes
bálticos a tripulações inexperientes em navios mal mantidos
[@wapo2025_acidentes].

## Reposicionamento: de sistema de defesa a instrumento de atribuição

O trabalho parte da formulação implícita de um sistema de proteção de
infraestrutura. Os capítulos anteriores desmontam essa formulação por três vias
independentes, e o que resta é uma contribuição diferente, mais estreita e mais
defensável.

Pela **via da revisita** (Capítulo 6), todos os incidentes documentados
pertencem ao regime cooperativo: as embarcações transmitiam AIS e foram
identificadas por ele. Para esse modelo de ameaça, o SAR não é o detector
primário, mas a fonte de verificação independente e o único mecanismo capaz de
expor falsificação de AIS. O regime não cooperativo, em que a detecção primária
por SAR seria indispensável, não tem até aqui um único caso que o instancie.

Pela **via da taxa base** (Capítulo 7), um alerta isolado, sem contexto
adicional, é quase certamente falso. O sistema produz valor quando a chance a
priori não é a da população geral, isto é, quando há uma falha de cabo
registrada, uma janela temporal delimitada, uma suspeita prévia. A aplicação
natural é retrospectiva e dirigida.

Pela **via jurídica** (este capítulo), não há autoridade de interdição a
alimentar. O que existe é um processo de atribuição e de resposta diplomática,
que se alimenta de evidência.

As três convergem no mesmo ponto: **a contribuição do sistema é produzir
evidência de atribuição, e não prevenir dano.**

Essa é também a razão de ser da escolha formal do Capítulo 4. Um sistema de
defesa precisa de decisões; um instrumento de atribuição precisa de força de
evidência quantificada e componível. A razão de verossimilhança, com sua
decomposição e sua calibração, é o objeto que um processo de atribuição pode
usar, e que um sistema de alerta não saberia o que fazer com.

## Implicações operacionais

**Onde o sistema é útil.** Triagem retrospectiva a partir de uma falha de cabo
registrada, delimitando o conjunto de embarcações compatíveis. Priorização de
investigação. Composição de dossiê de atribuição com evidência independente do
AIS. Verificação de consistência entre posição reportada e posição observada,
que é a única defesa disponível contra falsificação. Caracterização estatística
de risco por trecho, útil ao planejamento de traçado e de enterramento seletivo.

**Onde não é.** Alerta em tempo real. Fundamento para decisão de interceptação.
Estabelecimento de intenção. Qualquer aplicação que trate um valor alto de
$\Lambda$, isoladamente, como conclusão.

Uma observação sobre a resposta institucional. As iniciativas em curso na região
báltica, como a missão de vigilância naval iniciada em 2025, o pacote europeu de
segurança de infraestrutura submarina de 2026 [@ec_cable_toolbox2026] e os
projetos de centro de vigilância marítima com sensores de fundo, concentram-se
em presença naval, capacidade de reparo e sensoriamento *in situ*. Nenhuma delas
ocupa o nicho de um instrumento de atribuição construído sobre dados públicos,
operável por quem não dispõe de meios navais: operadoras de cabo, seguradoras,
pesquisadores, jornalismo investigativo. É esse o argumento de relevância
prática do trabalho, e ele é mais forte do que a alternativa de competir com
capacidades estatais.

## Limitações

A **ausência de verificação no domínio alvo** é a limitação mais séria. Não há
eventos árticos utilizáveis; o desempenho no Ártico é estimado por transferência
e não verificado contra nenhum caso real.

O **poder estatístico dos casos** é baixo. Seis eventos não sustentam estimativa
de desempenho, e os estudos de caso são diagnósticos, e não medida.

A **incerteza do traçado dos cabos** domina o orçamento posicional e fixa o piso
de largura do corredor. Reduzi-la depende de informação que os operadores
deliberadamente não publicam, e por boas razões, já que publicá-la facilitaria
o ato que se quer coibir. Há aqui uma tensão que o trabalho não resolve: maior
precisão do sistema exigiria maior exposição do alvo.

A **cobertura AIS** é estruturalmente limitada em alta latitude pela ausência de
recepção terrestre, com latência e probabilidade de detecção por mensagem fora
do controle do trabalho.

A **falsificação de AIS não é detectada** pelo casamento, que é vulnerável a
correspondência aparente produzida por posição falsificada, mecanismo de falso
negativo que as métricas usuais não expõem.

A **resolução no domínio alvo** é limitada pela operação predominante em modo de
faixa larga sobre regiões polares, que eleva o tamanho mínimo detectável. A
perda é instrumental, anterior a qualquer escolha de método.

A **dependência de dados não públicos para desambiguação** afeta vários
confundidores do Capítulo 7, entre eles campanhas científicas e janelas de
manutenção de cabo, que só são desambiguáveis com informação que existe mas não
é pública. O sistema entrega $\Lambda$ decomposta para que quem disponha desses
dados possa atualizar a conclusão; sem eles, a conclusão permanece mais fraca do
que poderia.

## Considerações éticas e de uso duplo

O sistema é construído sobre dados públicos e produz evidência de atribuição.
Não constitui capacidade ofensiva, não fornece alvos e não confere a ninguém
poder que já não tenha. Ainda assim, três pontos merecem registro.

O primeiro é o **risco de uso contra a pesca legítima**. O confundidor dominante
é o arrasteiro, e a assinatura de interesse é aquela que ele produz
rotineiramente. Um sistema mal calibrado, ou usado sem a moldura de razão de
verossimilhança, produziria um fluxo constante de suspeitas dirigidas a
embarcações pesqueiras, com custo concentrado sobre operadores pequenos e
frequentemente sob bandeiras com menor capacidade de defesa jurídica. A
insistência deste trabalho em precisão, custo assimétrico e ausência de rótulo
binário não é apenas rigor estatístico: é também a salvaguarda disponível contra
esse uso.

O segundo é a **assimetria de quem é observado**. Embarcações que transmitem AIS
são observáveis; as que não transmitem, menos. O sistema pesa, portanto, mais
sobre operadores que cumprem a regra do que sobre os que não cumprem, efeito
perverso que vale enunciar, ainda que o trabalho não o resolva.

O terceiro é a **publicidade das efemérides**. Como registrado no Capítulo 6, os
horários de passagem dos satélites são públicos, e um ator informado pode
escolher a janela entre observações. Discutir abertamente essa vulnerabilidade é
preferível a omiti-la: ela decorre de propriedades orbitais conhecidas e de
catálogos abertos, e a omissão não protegeria ninguém, apenas deixaria o leitor
com uma estimativa de desempenho otimista.

Por fim, uma consideração sobre o próprio enquadramento. O risco mais provável
deste trabalho não é o uso indevido do sistema, cuja capacidade é modesta; é a
citação indevida do trabalho. Um resultado apresentado como "detecção de
sabotagem" seria citado como tal, e a distância entre o que o sistema mede e o
que a citação afirmaria é a distância que os Capítulos 7 e 8 se esforçam por
manter visível. A precisão terminológica, mantida em título, resumo e legendas,
é a única defesa disponível.


# Conclusão e trabalhos futuros

## Retomada da pergunta

A pergunta formulada no Capítulo 1 era em que medida a fusão entre detecção SAR
e rastreamento AIS, a partir exclusivamente de dados públicos, permite
identificar assinaturas cinemáticas compatíveis com arrasto de âncora sobre
cabos submarinos árticos, e quais limites são impostos pelo clutter de gelo,
pela cadência de revisita e pela taxa base do fenômeno.

A resposta que a dissertação constrói tem duas partes, e a segunda é mais
importante que a primeira.

**A fusão é tecnicamente viável** sobre dados públicos, e o método do Capítulo 4
a instrumenta: detecção CFAR, casamento com correção do deslocamento em azimute,
restrição espacial por campo de risco condicionado por batimetria,
caracterização cinemática e saída em razão de verossimilhança calibrada.

**Mas os três limites investigados não são obstáculos de engenharia; são
propriedades do problema**, e cada um estabelece um teto que nenhuma melhoria
técnica ultrapassa. O gelo degrada o detector de forma caracterizável e impõe
uma troca mensurável entre precisão e revocação. A cadência de observação limita
a revocação por cima, e o limite é mais severo do que a revisita média sugere. E
a taxa base, combinada com a fração acidental dos eventos, limita a precisão por
cima. Os três tetos operam ao mesmo tempo, e o produto deles, e não cada um
isoladamente, descreve o que o sistema pode fazer.

Daí a resposta curta à pergunta: **a fusão SAR-AIS permite produzir evidência de
atribuição com força mensurável, e não permite detecção confiável de eventos
isolados.** Essa formulação é mais estreita do que a que motivou o trabalho, e é
a que os capítulos anteriores sustentam.

## Contribuições

**Corredor de risco condicionado por batimetria.** Substituição do *buffer* de
distância fixa por um campo escalar fatorado em profundidade, tipo de fundo e
traçado. A componente de profundidade é derivada de primeiros princípios, como
função de sobrevivência da razão entre comprimento de amarra e relação de amarra
sobre a frota que efetivamente transita no corredor, e não postulada por limiar;
a componente de traçado produz um perfil transversal igual à densidade da
incerteza do traçado, o que formaliza o piso de largura do corredor. O efeito é
reduzir o espaço de busca sem remover eventos genuínos, o que eleva a
prevalência dentro da região observada, mecanismo mais eficaz, como o Capítulo 7
mostra, do que qualquer refinamento de classificador.

**Caracterização da degradação por clutter de gelo.** Separação dos dois
mecanismos que a literatura confunde, isto é, o falso alarme por feições de
gelo, que custa precisão, e a detecção perdida sobre fundo brilhante, que custa
revocação, e sua medida por estrato, sob um desenho que resolve o problema do
rótulo negativo por células de controle. O produto é a taxa de troca entre
revocação e concentração de gelo a precisão constante, e uma declaração
operacional delimitada de até onde o sistema é informativo.

**Acoplamento entre revisita e duração do evento.** Modelo da probabilidade de
captura a partir da sequência determinística de passagens, com o resultado de
que intervalos heterogêneos produzem captura estritamente menor que intervalos
regulares de mesma média, de modo que citar revisita média superestima a
cobertura, e o erro cresce com a latitude. Separação entre regime cooperativo e
não cooperativo, com tetos radicalmente distintos.

A essas três soma-se a exigência metodológica que atravessa o trabalho: a
avaliação sob a prevalência real, com a precisão calculada e não medida, e com a
saída formulada como força de evidência separada da probabilidade a priori.

## O que ficou de fora

**Intenção.** Não é detectável por sensoriamento remoto, e o trabalho não se
propõe a detectá-la. Os casos *Vezhen* e *Eagle S*, ambos qualificados como
acidentais por defeito de equipamento, demonstram que a distinção depende de
informação de bordo.

**Verificação no domínio ártico.** Não há eventos utilizáveis. O desempenho
ártico é estimado por transferência, e essa é a limitação mais séria do
trabalho.

**Prevenção.** O sistema não previne dano, pelas razões de cadência do Capítulo
6 e de competência do Capítulo 10.

**Detecção primária de alvo não cooperativo.** Permanece como cenário
tecnicamente tratado, mas sem um único caso documentado que o instancie.

## Trabalhos futuros

**Constelações comerciais de alta revisita.** É o desdobramento com efeito mais
direto sobre os resultados deste trabalho, e o modelo do Capítulo 6 já está
formulado para avaliá-lo sem refazer nada.

As constelações SAR comerciais em banda X operam hoje em regime muito distinto
do da missão pública usada aqui: frotas de dezenas de satélites com tempos de
revisita anunciados de poucas horas e, em alguns casos e faixas de latitude,
inferiores a uma hora [@umbra_eoportal; @capella_const; @iceye_fleet]. A
comparação com a duração dos eventos é o ponto: se a duração característica de
um arrasto está na faixa de poucas a algumas horas, e a cadência de observação
cai para essa mesma ordem ou abaixo dela, então $P_{\mathrm{capt}}$ satura e **o
teto do Capítulo 6 deixa de ser o fator limitante no regime não cooperativo**. A
pergunta se desloca de "o evento foi observado?" para "o que foi observado
permite classificar?", que é o domínio dos Capítulos 5 e 7.

Duas ressalvas impedem tratar isso como solução. A primeira é que essas
constelações operam por **tarefamento pago**, o que rompe a premissa de dados
inteiramente públicos adotada no Capítulo 3, com consequências para
reprodutibilidade e para quem pode operar o sistema. A segunda é que tarefamento
exige saber **onde e quando** apontar, o que um acervo de aquisição sistemática
dispensa.

E é aí que as contribuições se articulam: a Contribuição 1 reduz a área de
interesse em ordens de grandeza, e a Contribuição 3 identifica as janelas
temporais em que a cobertura sistemática é mais fraca. Juntas, elas transformam
tarefamento comercial de inviável em dimensionável, porque o custo de
tarefamento escala com área e com número de aquisições, que são as duas
grandezas que o corredor e o modelo de captura reduzem. **A combinação entre
corredor condicionado por batimetria e tarefamento comercial dirigido é,
provavelmente, o caminho mais curto para ultrapassar o teto de revisita**, e
merece ser avaliada quantitativamente com o instrumental já construído.

**Polarimetria completa.** A separabilidade entre superfície metálica e gelo
deformado foi avaliada aqui apenas pela razão entre dois canais, limitada pelo
par adquirido em cada cena. Aquisições polarimétricas completas permitiriam
atacar diretamente o mecanismo de falso alarme do Capítulo 5.

**Sensoriamento acústico distribuído no próprio cabo.** É o desdobramento com
maior potencial de transformar o problema, e não apenas de melhorá-lo. Um cabo
instrumentado registra interações com o fundo em sua própria extensão, com tempo
e posição, isto é, fornece **verdade real** para eventos de contato. Isso
reformularia por completo o problema de rótulos do Capítulo 8: deixaria de haver
seis eventos e passaria a haver um registro contínuo, o que permitiria estimar
precisão empiricamente em vez de calculá-la, e treinar em vez de apenas
calibrar. Vale notar que essa perspectiva não altera nenhum dos três tetos, já
que o gelo, a cadência e a fração acidental permanecem, mas altera radicalmente
a capacidade de medi-los.

**Estimação da fração acidental.** O teto de precisão depende de uma grandeza
hoje conhecida apenas por um punhado de decisões judiciais. Um levantamento
sistemático de causas determinadas em falhas de cabo, ainda que sobre registros
de operadoras não públicos, converteria esse teto de indicativo em quantificado,
e é um trabalho de escopo modesto com retorno alto.

**Extensão a outros corredores.** As três contribuições são geograficamente
transponíveis. O Báltico oferece densidade de eventos; o Ártico, relevância
estratégica; outros corredores rasos com tráfego intenso ofereceriam massa
estatística para testar a generalidade do campo de risco.

## Observação final

O trabalho começa perguntando se é possível detectar arrasto de âncora sobre
cabos submarinos árticos por satélite, e termina afirmando algo mais modesto:
que é possível produzir, sobre dados inteiramente públicos, evidência de força
quantificada a respeito de um evento, e que essa força, isoladamente, quase
nunca basta para uma conclusão.

Essa redução não é um resultado negativo. Um sistema que afirmasse mais estaria
afirmando o que não pode sustentar, e a literatura de vigilância marítima já
dispõe de exemplos suficientes disso. A contribuição de um trabalho acadêmico
sobre um tema com pressão política é, em boa medida, delimitar com precisão o
que a técnica autoriza a dizer, sobretudo quando a pressão empurra na direção
oposta. O sistema aqui proposto não detecta sabotagem. Detecta assinatura
cinemática compatível com arrasto de âncora, informa quanto essa observação pesa
como evidência, e entrega ao processo de atribuição a tarefa que lhe cabe.


# Referências {-}

::: {#refs}
:::

