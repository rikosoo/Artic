# Dados

Este capítulo fixa a área de estudo, o recorte temporal e as fontes que
sustentam os experimentos dos Capítulos 5 a 9. A ordem é deliberada: a
estratégia de domínios vem primeiro, porque é ela que determina quais dados são
necessários; a verificação de viabilidade vem antes do pré-processamento,
porque é ela que pode invalidar a escolha; e o orçamento de incerteza posicional
encerra o capítulo, porque alimenta diretamente a largura do corredor definido
no Capítulo 4.

## Estratégia de dois domínios

O Capítulo 8 estabelece que praticamente todo o *ground truth* disponível está
no Báltico e no Mar do Norte, não no Ártico. Dos eventos documentados com data,
posição, embarcação identificada e desfecho investigativo, nenhum ocorreu em
condições árticas com cobertura de dados suficiente para servir de caso de
validação. Insistir em um recorte exclusivamente ártico significaria construir
um sistema que não pode ser verificado contra nenhum evento real.

Adota-se, por isso, um desenho de **dois domínios**:

**Domínio de calibração — Báltico.** Onde estão os eventos documentados, a
cobertura AIS mais densa e a batimetria mais bem levantada. É onde o detector é
parametrizado, o corredor de risco é construído e validado, e os casos reais são
testados sob protocolo *leave-one-event-out*.

**Domínio alvo — Ártico.** Onde a pergunta de pesquisa se coloca e onde não há
rótulos. É onde se mede o que a transferência custa: degradação por gelo
(Capítulo 5), mudança de revisita e de modo de aquisição (Capítulo 6), rarefação
da cobertura AIS.

Essa separação não é um paliativo diante da escassez de dados; é o desenho
experimental que a escassez torna correto. A **diferença de desempenho entre os
dois domínios é o resultado**, não um efeito colateral a minimizar. Um trabalho
que reportasse apenas desempenho ártico teria de fabricar seus próprios rótulos
e não teria contra o que compará-los; um que reportasse apenas desempenho
báltico não responderia à pergunta. O par responde.

A consequência é que a transferência de domínio precisa ser tratada com
explicitação de cada eixo que muda — gelo, modo de aquisição, resolução,
densidade de AIS, batimetria, densidade de tráfego —, e não como uma aplicação
do mesmo modelo a uma nova região.

### Recorte de calibração

**Golfo da Finlândia e Báltico central.** O trecho concentra a maior parte dos
eventos do Capítulo 8 — Balticconnector, Estlink 2 e os cabos associados, o
enlace Elisa entre Finlândia e Estônia — e inclui o segmento Gotland–Ventspils
do caso *Vezhen*, que fornece o negativo rotulado. É raso ao longo de
praticamente toda a sua extensão, o que o mantém integralmente dentro da faixa
de profundidade operável para ancoragem e, portanto, dentro do corredor de
risco.

Duas propriedades tornam o recorte especialmente adequado. A primeira é que se
trata de uma das áreas de tráfego mais densas do mundo, o que fornece um
denominador robusto para a análise de taxa base do Capítulo 7 — o número de
trânsitos por ano no corredor é grande e mensurável. A segunda é que o Báltico
apresenta cobertura de gelo sazonal no Golfo da Finlândia e no Golfo de Bótnia,
o que permite estudar o problema do Capítulo 5 **dentro do domínio de
calibração**, com AIS denso disponível como verdade parcial, antes de transferir
para condições árticas onde essa verificação não existe. Essa é uma vantagem que
o recorte ártico puro não ofereceria.

### Recorte alvo

Dois candidatos, a decidir na verificação de viabilidade descrita adiante:

**(a) Enlace Svalbard–continente.** Corresponde ao único incidente ártico
razoavelmente documentado (Capítulo 8, caso A2) e tem trechos rasos junto às
duas extremidades, com o trecho intermediário em profundidade que o exclui do
corredor de risco — o que, por si só, é uma boa demonstração do poder de
recorte da Contribuição 1. A desvantagem é o tráfego escasso, que torna a
estatística de taxa base pouco informativa.

**(b) Mar de Barents meridional e aproximações costeiras.** Tráfego
substancialmente maior, plataforma continental rasa em grande extensão, presença
sazonal de gelo com zona marginal ativa e cobertura AIS costeira norueguesa
disponível. É o recorte com melhor equilíbrio entre relevância e mensurabilidade.

A recomendação é **(b) como recorte principal e (a) como estudo de caso
adicional**, aproveitando o fato de que o segundo é pequeno e barato de
processar. A decisão final depende da verificação de cobertura.

## Recorte temporal

Adotam-se duas janelas com finalidades distintas.

**Janela de eventos: outubro de 2023 a junho de 2026.** Cobre todos os
incidentes do conjunto de validação, do Balticconnector à conclusão da
investigação do caso *Fitburg*. É a janela sobre a qual se recuperam cenas
específicas em torno de cada evento.

**Janela estatística: 2019 ao presente, ou o maior intervalo com cobertura
homogênea.** Serve à caracterização de tráfego, à distribuição de velocidades e
rumos no corredor e ao denominador da taxa base do Capítulo 7, além de fornecer
massa suficiente para a estratificação por gelo do Capítulo 5.

A composição da constelação Sentinel-1 variou dentro dessas janelas — houve um
período prolongado de operação com um único satélite entre o final de 2021 e o
final de 2024. Isso não invalida as janelas, mas **proíbe tratar a revisita como
constante**: toda estatística agregada sobre o período precisa ser condicionada
à configuração vigente na data, e a reconstrução dessa configuração é insumo
direto do modelo do Capítulo 6.

## Fontes

Todas as fontes são de acesso público. Isso é uma escolha metodológica — a
reprodutibilidade integral do trabalho por terceiros —, e não uma limitação
imposta por falta de acesso a dados restritos. A escolha tem, além disso, um
efeito argumentativo relevante para o Capítulo 10: um sistema construído sobre
dados públicos demonstra o que qualquer ator — inclusive um ator não estatal —
pode estabelecer sobre um evento, o que é precisamente a natureza de um
instrumento de atribuição.

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
anterior de distribuição e oferece catálogo e acesso programático. Adotam-se
produtos GRD, cujo espaçamento de pixel é de aproximadamente 10 m no modo IW e
40 m no modo EW, com resolução efetiva correspondentemente mais grosseira que o
espaçamento em ambos os casos.

Três pontos condicionam o uso, e todos já foram antecipados no Capítulo 2:

- **modo de aquisição** — a expectativa é IW no domínio de calibração e EW em
  boa parte do domínio alvo, com a perda de resolução associada. Isso precisa
  ser verificado por consulta ao catálogo, não presumido;
- **par polarimétrico** — VV+VH sobre oceano e HH+HV sobre gelo, o que
  determina quais mitigações do Capítulo 5 são aplicáveis em cada cena;
- **revisita efetiva** — contada sobre o corredor específico e por data, não
  tomada do valor nominal da missão.

### AIS

Esta é a fonte cuja obtenção exige maior cuidado, e onde a premissa inicial do
projeto precisa ser corrigida.

*Global Fishing Watch* não distribui mensagens AIS individuais. Os dados brutos
que a organização utiliza são de origem comercial e não podem ser
redistribuídos livremente; o que se publica são produtos **agregados** —
esforço aparente de pesca em grade, eventos de pesca e de transbordo, consultas
por API para fins não comerciais — além de um conjunto anonimizado e rotulado
destinado a treinar classificadores. Esses produtos são excelentes para
caracterizar padrões de atividade e serão usados com essa finalidade, mas o
casamento SAR–AIS do Capítulo 4 exige posição, rumo e velocidade por embarcação
e por instante, e nenhum produto em grade atende a isso. O AISHub, por sua vez,
opera em regime de reciprocidade: o acesso pressupõe a contribuição de um fluxo
próprio de dados, o que não é viável para um projeto acadêmico sem receptor.

As fontes que efetivamente resolvem o problema, e que se adotam como primárias,
são os **acervos nacionais de AIS histórico**, ambos abertos e sem registro:

- a **autoridade marítima dinamarquesa** disponibiliza AIS histórico em arquivos
  CSV de acesso livre, com histórico que remonta a mais de uma década e
  cobertura que alcança o Báltico ocidental e parte do central;
- a **administração costeira norueguesa** disponibiliza AIS histórico para águas
  norueguesas sob a licença norueguesa para dados públicos abertos, com serviço
  dedicado de consulta histórica — cobrindo a costa ártica e, portanto, o
  domínio alvo.

A combinação cobre os dois domínios no nível de mensagem e sem barreira de
acesso. Há um custo prático a dimensionar desde já: o acervo dinamarquês
distribui da ordem de alguns gigabytes por dia de tráfego, o que situa um ano de
dados na casa das centenas de gigabytes. Isso torna a seleção prévia por recorte
espacial e temporal — e não o download integral seguido de filtragem — a
estratégia obrigatória de aquisição.

Duas verificações precisam preceder qualquer processamento: a **extensão
geográfica efetiva** de cada acervo em relação aos corredores escolhidos, já que
a cobertura é definida pela rede de receptores costeiros de cada país e não pela
fronteira marítima; e a **profundidade do histórico** frente à janela temporal
adotada. Delas depende a viabilidade do casamento e, por extensão, de todo o
método.

Registre-se ainda que a cobertura AIS disponível não é a cobertura AIS real: as
três formas de ausência discutidas no Capítulo 2 operam sobre qualquer acervo, e
a fração de embarcações sem correspondência inclui, necessariamente, falhas de
recepção que não têm relação com o fenômeno de interesse.

### Batimetria

Para o domínio de calibração, adota-se **EMODnet Bathymetry**, cuja grade para
mares europeus é substancialmente mais fina que a global e incorpora
levantamentos hidrográficos nacionais. Para o domínio alvo, adota-se **GEBCO**,
cuja componente ártica deriva em larga medida da carta batimétrica internacional
do Oceano Ártico.

A resolução nominal da grade GEBCO é de 15 segundos de arco, o que corresponde a
células de aproximadamente 460 m na direção norte–sul e, em latitudes árticas,
consideravelmente menos na direção leste–oeste. Essa resolução é adequada para
distinguir plataforma continental de bacia profunda, mas **é grosseira junto ao
limiar de profundidade que define o corredor de risco**, e o problema é agravado
pelo fato de a grade ser uma compilação: a incerteza vertical varia
espacialmente conforme a densidade de levantamentos que alimentaram cada célula,
e é maior justamente no Ártico, onde a cobertura por sondagem é mais esparsa.

A consequência metodológica é que o corredor do Capítulo 4 **não pode ser
definido por um limiar rígido de profundidade**. A transição precisa ser suave e
a incerteza batimétrica precisa ser propagada, sob pena de que a fronteira do
corredor seja um artefato da grade e não uma propriedade do fundo.

### Traçados de cabo

Aqui é necessária uma advertência que altera a escolha de fonte prevista
originalmente. O mapa de cabos submarinos da TeleGeography é **esquemático**: os
traçados são estilizados para legibilidade e não representam a geometria real do
cabo no fundo. Ele é útil para identificar quais enlaces existem, quem os opera
e onde estão os pontos de aterragem — e é inadequado para definir a geometria do
corredor.

As fontes utilizáveis para geometria são as **cartas de conscientização
produzidas para a pesca**, como o KIS-ORCA, que existem precisamente para
informar arrasteiros sobre onde não arrastar, e os produtos de atividade humana
do EMODnet, que agregam informação de cabos em águas europeias. Ainda assim, a
posição publicada é aproximada por decisão deliberada dos operadores: a
localização exata é informação sensível.

Isso não é um obstáculo ao método — é um insumo dele. A incerteza posicional do
traçado entra no orçamento de erro da seção final deste capítulo e determina uma
largura mínima do corredor abaixo da qual não faz sentido descer. Um trabalho
que definisse um corredor de largura inferior à incerteza do traçado estaria
reportando precisão fictícia.

### Gelo marinho

Adotam-se duas fontes complementares, pelas razões de escala discutidas no
Capítulo 2. Como variável contínua de estratificação, a concentração derivada do
radiômetro AMSR2 pelo algoritmo ASI, cuja grade de aproximadamente 3 km é a
melhor resolução operacionalmente disponível em micro-ondas passivas e reduz —
sem eliminar — a incompatibilidade de escala com a imagem SAR. Como referência
de tipo de gelo e posição da borda, as cartas de gelo operacionais dos serviços
meteorológicos norueguês e dinamarquês, que incorporam análise humana e
distinguem classes de idade e de concentração que o produto automático não
separa.

Mesmo com o produto de 3 km, permanece uma diferença de duas ordens de grandeza
em relação ao pixel SAR. A estratificação por concentração é, portanto, um
descritor de contexto regional, e o Capítulo 5 a complementa com descritores de
textura extraídos da própria cena.

### Reanálise atmosférica

A reanálise ERA5, distribuída pelo *Climate Data Store*, fornece vento a 10 m e
parâmetros de estado de mar em passo horário e resolução de aproximadamente
31 km. O uso é duplo: estratificar o desempenho do detector por condição de
vento, conforme exigido pela seção 2.1, e sustentar a discussão do confundidor
"redução de velocidade por mau tempo" no Capítulo 7 — inclusive no caso
*Vezhen*, cuja causa oficial envolve o impacto de uma onda em horário
determinado.

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
2. **revisita efetiva** — distribuição do intervalo entre passagens
   consecutivas, por ano, dada a configuração de constelação vigente;
3. **cobertura AIS** — fração do corredor e do período com dados no nível de
   mensagem, e taxa média de reporte observada;
4. **fração do corredor em profundidade operável**, a partir da grade
   batimétrica adotada;
5. **densidade de tráfego** — número de trânsitos anuais, insumo do
   denominador da taxa base.

**Critérios de rejeição.** Um recorte candidato é descartado se a revisita
efetiva for tão esparsa que o teto de desempenho do Capítulo 6 torne o
experimento vazio; se a cobertura AIS no nível de mensagem for insuficiente para
o casamento; ou se a fração do corredor em profundidade operável for pequena
demais para produzir amostra. Nesses casos, **muda-se a área de estudo, não o
método** — as três contribuições são geograficamente transponíveis, e a
transposição é preferível a diluí-las para acomodar um recorte inadequado.

O resultado dessa verificação constitui a primeira tabela de resultados do
trabalho e deve ser reportado mesmo quando favorável, porque documenta a base
factual da escolha de área.

## Pré-processamento

A cadeia adotada para os produtos GRD é convencional, mas cada etapa é
justificada pelo efeito que produz na estatística do fundo — o que importa
porque é essa estatística que o detector do Capítulo 4 pressupõe.

**Calibração radiométrica** para coeficiente de retroespalhamento, sem o qual
limiares não são comparáveis entre cenas, órbitas e ângulos de incidência.

**Correção geométrica de terreno** com modelo de elevação, necessária para o
georreferenciamento exigido pelo casamento com AIS e pela sobreposição com o
corredor.

**Máscara de terra**, com margem, para eliminar a fonte trivial de falso alarme
representada por estruturas costeiras. A margem precisa ser suficiente para
cobrir o deslocamento em azimute de alvos móveis discutido no Capítulo 2.

**Filtragem de *speckle*: não aplicada antes da detecção.** Esta é a única
escolha não convencional da cadeia e merece justificativa. A filtragem reduz a
variância do fundo e, com isso, altera a distribuição sobre a qual o limiar CFAR
é calculado; um detector calibrado sobre dados filtrados opera com uma taxa de
falso alarme efetiva diferente da nominal, e a diferença depende do filtro e da
janela. Como o objeto do Capítulo 5 é exatamente caracterizar como a estatística
do fundo se afasta da premissa, introduzir um filtro que a modifica de forma
dependente do conteúdo local comprometeria a medida. A detecção opera sobre a
intensidade calibrada; a filtragem, quando usada, restringe-se a etapas de
extração de textura e à inspeção visual.

**Correção de ruído térmico**, particularmente relevante no modo EW e nas
faixas de polarização cruzada, onde o padrão de ruído por subfaixa pode produzir
descontinuidades que o detector interpreta como estrutura.

## Orçamento de incerteza posicional

Três fontes de erro se acumulam entre o alvo real e sua posição atribuída, e
somá-las explicitamente é o que permite dimensionar o corredor sem fingir
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
partir do repositório — e essa é a forma prática pela qual a escolha por dados
públicos, declarada no início do capítulo, se converte em verificabilidade.
