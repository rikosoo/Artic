# Falsos positivos: taxa base, confundidores e custo assimétrico

Este é o capítulo central da dissertação, e vem deliberadamente antes dos
resultados. Se a análise que se segue aparecesse depois deles, leria como
ressalva; antes, lê como o que é — um achado que determina o que o sistema pode
legitimamente afirmar, e portanto o protocolo sob o qual os resultados devem
ser produzidos.

## Unidade de análise

Antes de qualquer aritmética é preciso fixar o que conta como um caso. A escolha
não é neutra: prevalência, precisão e taxa de falso alarme mudam de valor
conforme a unidade, e comparações entre trabalhos que adotam unidades diferentes
são vazias.

Adota-se como unidade o **trânsito**: a passagem de uma embarcação pelo suporte
do campo de risco $R(\mathbf{x})$ definido no Capítulo 4, delimitada por entrada
e saída. Um trânsito é positivo se durante ele houve arrasto de âncora capaz de
danificar o cabo; é negativo em caso contrário.

Duas alternativas foram descartadas. A unidade "cena" torna a prevalência
dependente da largura da faixa do sensor, o que é uma propriedade instrumental e
não do fenômeno. A unidade "detecção" confunde a avaliação do detector com a do
sistema — um alvo detectado três vezes na mesma passagem não são três casos.

## A aritmética da taxa base

### Os dois termos

O denominador é o número de trânsitos pelo corredor em um período. Em corredores
como o Golfo da Finlândia, que estão entre os de tráfego mais denso do mundo,
essa grandeza é de várias dezenas de milhares por ano, e é diretamente
mensurável a partir dos acervos de AIS do Capítulo 3 — sendo, aliás, um dos
poucos números deste trabalho que se obtém com precisão.

O numerador é o número de eventos genuínos. O Capítulo 8 documenta um punhado de
casos em toda a região báltica ao longo de vários anos. Mesmo com generosidade
na contagem — incluindo casos não confirmados judicialmente e tratando cada cabo
afetado como evento distinto — a ordem de grandeza permanece de poucos eventos
por ano distribuídos por muitos corredores.

A prevalência por trânsito situa-se, portanto, na faixa de $10^{-4}$ a
$10^{-5}$. Esse é o número que governa tudo o que segue.

### O cálculo

Com sensibilidade $\mathrm{Se}$, especificidade $\mathrm{Es}$ e prevalência
$\pi$, o valor preditivo positivo é

$$\mathrm{VPP} = \frac{\mathrm{Se}\cdot\pi}{\mathrm{Se}\cdot\pi + (1-\mathrm{Es})(1-\pi)}.$$

A tabela seguinte instancia a expressão para $\pi = 10^{-4}$ e
$\mathrm{Se} = 0{,}8$. Os valores são **ilustrativos** — servem para exibir a
estrutura do problema, não para antecipar os resultados do Capítulo 9, que
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
verdadeira seria preciso uma especificidade acima de 99,99 % — isto é, menos de
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
posterior a um — isto é, para que a hipótese de arrasto se torne tão provável
quanto a alternativa —, é necessário

$$\Lambda \approx 10^{4}.$$

Em termos de peso de evidência [@good1985], isso corresponde a cerca de quarenta
decibéis. É uma exigência elevada, e enunciá-la assim tem três vantagens sobre a
tabela anterior.

Primeiro, ela transforma a taxa base de obstáculo em **especificação de
projeto**: sabe-se quanta evidência é preciso produzir, e pode-se perguntar,
descritor por descritor, quanto cada um contribui para esse total. Segundo, ela
deixa explícito que o sistema não precisa "acertar" — precisa produzir evidência
de força mensurável, que outro processo combinará com o que mais souber.
Terceiro, ela é honesta quanto ao que muda a conclusão: um investigador que
saiba que houve uma falha de cabo naquele traçado e naquele dia opera com uma
chance a priori radicalmente diferente, e o mesmo $\Lambda$ produz então uma
conclusão forte. **A utilidade do sistema depende de quem o usa e do que essa
pessoa já sabe** — o que é, precisamente, a definição de um instrumento de
atribuição e não de alerta.

## Confundidores

### Pesca de arrasto

O confundidor dominante, e aquele em que reside a ironia central do problema.

Um arrasteiro em operação normal desloca-se em velocidade baixa e sustentada,
com rumo persistente, arrastando equipamento pesado pelo fundo. A assinatura
cinemática é quase indistinguível da de uma embarcação arrastando âncora — e a
semelhança não é acidental, é física: em ambos os casos um objeto pesado é
rebocado pelo leito a velocidade reduzida.

A ironia é que, conforme o Capítulo 2, **a pesca de arrasto é historicamente a
principal causa acidental de dano a cabos**. O comportamento que o sistema
procura como sinal de ameaça é também a explicação inocente mais comum e, ao
mesmo tempo, a causa mais frequente do próprio dano que se quer prevenir.

Isso obriga a distinguir dois propósitos que a literatura mistura:

- **Para proteção da infraestrutura**, a distinção é dispensável. Se o objetivo é
  evitar que o cabo seja rompido, um arrasteiro sobre o traçado é tão relevante
  quanto um navio arrastando âncora, e o sistema não precisa separá-los.
- **Para atribuição**, a distinção é tudo. E é ela que o sensoriamento remoto tem
  mais dificuldade em fazer.

Há elementos discriminantes disponíveis: tipo de embarcação declarado no AIS,
histórico de comportamento, compatibilidade com pesqueiros conhecidos, padrão de
manobra em área — a pesca costuma produzir trajetórias em varredura, não um
segmento retilíneo longo. Nenhum deles é conclusivo, e o primeiro depende de
informação declarada pelo próprio suspeito.

### Falha mecânica do sistema de retenção da âncora

Este confundidor não constava do planejamento inicial e foi identificado a
partir do caso *Vezhen*, documentado no Capítulo 8. O Ministério Público sueco
arquivou o caso como acidental: dos três dispositivos de retenção da âncora,
dois estavam inoperantes havia tempo, e o terceiro cedeu ao impacto de uma onda
em horário determinado. A âncora caiu sem qualquer ação da tripulação.

O ponto é mais forte do que o de qualquer outro confundidor, e merece
enunciado explícito:

> A assinatura produzida por uma âncora que cai por falha mecânica não é
> *parecida* com a de um arrasto deliberado. É **idêntica**, porque é o mesmo
> fenômeno físico. A âncora está no fundo, o navio se desloca, o cabo é
> danificado. A diferença entre as duas hipóteses está inteiramente a bordo — no
> estado de manutenção do navio e na intenção da tripulação — e é, por
> construção, invisível a qualquer sensor remoto.

Disso decorre um **teto de precisão independente de sensor**, análogo ao teto de
revocação do Capítulo 6 e igualmente merecedor de enunciado como resultado.
Nenhuma melhoria de resolução, de revisita ou de algoritmo desloca esse limite:
ele é fixado pela fração de eventos de arrasto que têm causa acidental, e essa
fração é uma propriedade do estado da frota, não do sistema de observação.

Avaliações de inteligência divulgadas em janeiro de 2025 generalizaram essa
leitura para o conjunto dos incidentes bálticos, apontando tripulações
inexperientes em navios mal mantidos e ausência de evidência de direção estatal.
Se essa leitura estiver correta, a fração acidental é alta e o teto de precisão é
baixo.

### Demais confundidores

Para cada um, a assinatura esperada e a possibilidade de desambiguação com os
dados públicos do Capítulo 3.

**Desvio e navegação em gelo.** Reduz velocidade e altera rumo de forma que
imita hesitação anômala. Desambiguável, em parte, com os produtos de gelo e as
cartas operacionais: uma redução de velocidade coincidente com entrada em zona
marginal tem explicação suficiente.

**Capeamento e redução de velocidade por mau tempo.** Desambiguável com ERA5,
que fornece vento e estado de mar no instante e no local — e que, note-se, foi
exatamente o fator invocado na conclusão oficial do caso *Vezhen*.

**Espera de praticagem e fundeio em área de espera.** Produz baixa velocidade
prolongada, mas em áreas designadas e com padrão de deriva em torno de um ponto,
não de deslocamento sustentado. Desambiguável por geografia, desde que as áreas
de fundeio sejam mapeadas — o que precisa entrar na aquisição de dados.

**Operação científica.** Reboque de sensores e perfilagem produzem velocidade
baixa e rumo persistente, muito próximos da assinatura de interesse. Difícil de
desambiguar sem informação sobre campanhas em curso, que não é sistematicamente
pública.

**Manutenção do próprio cabo.** O confundidor mais perverso do conjunto: por
construção, ocorre *sobre o traçado*, em velocidade baixa, com manobra anômala e
com equipamento no fundo. Satisfaz todos os critérios do sistema
simultaneamente. Desambiguável apenas com informação da operadora sobre janelas
de reparo — informação que existe, mas não é pública em tempo real.

### O padrão

Nota-se um padrão nos parágrafos acima que vale explicitar. Vários confundidores
são desambiguáveis **em parte**, e a desambiguação depende de dados que não
pertencem ao sistema: campanhas científicas, janelas de manutenção, áreas de
fundeio. Isso reforça a decisão do Capítulo 4 de entregar $\Lambda$ com sua
decomposição em vez de um rótulo: o usuário que dispuser desses dados pode
atualizar a conclusão de forma explícita, ao passo que um classificador binário
teria que ter decidido sem eles.

## Onde as contribuições 1 e 2 entram na aritmética

As duas primeiras contribuições atuam sobre termos distintos da mesma expressão,
e é aqui que isso se torna quantitativo.

O número esperado de falsos positivos por período é, aproximadamente,

$$\mathbb{E}[FP] \;\approx\; \underbrace{\lambda_{fa}(c, w, m)}_{\text{Capítulo 5}} \times \underbrace{A_{ef}}_{\text{Capítulo 4}} \times \; N_{pass},$$

com $\lambda_{fa}$ a densidade de falso alarme por área medida por estrato e
$A_{ef} = \int R(\mathbf{x})\,\mathrm{d}\mathbf{x}$ a área efetiva do corredor.

A Contribuição 1 reduz $A_{ef}$ em ordens de grandeza sem remover eventos
genuínos — porque, por argumento físico, eles não ocorrem fora do suporte de
$R$. É uma redução do denominador da prevalência que não afeta o numerador, e
portanto **aumenta a prevalência dentro da região observada**. É esse o
mecanismo pelo qual o corredor melhora a precisão, e enunciá-lo assim mostra por
que ele é mais eficaz do que qualquer refinamento do classificador: mover $\pi$
de $10^{-5}$ para $10^{-3}$ vale mais que duas ordens de grandeza de melhoria em
especificidade, e é mais fácil de conseguir.

A Contribuição 2 caracteriza $\lambda_{fa}$ e mostra sob que condições ele
cresce a ponto de anular o ganho anterior. As duas se encontram nesta
multiplicação, e o Capítulo 9 reporta o produto.

## Custo assimétrico

### A matriz

Um falso positivo e um falso negativo não custam o mesmo, e nenhum dos dois é
barato no Ártico.

O custo de um **falso positivo** tem duas formas. A branda é operacional:
deslocar um ativo de vigilância por distâncias que, no Ártico, são de centenas
ou milhares de quilômetros, com tempo de resposta medido em dias. A severa é
diplomática: abordar ou questionar uma embarcação de bandeira estrangeira com
base em evidência que se revela infundada tem custo político real, e — como o
Capítulo 10 detalha — frequentemente sem base jurídica que a ampare.

O custo de um **falso negativo** exige uma correção importante em relação à
formulação inicial do projeto. É tentador equipará-lo ao custo do dano: reparo
milionário, interrupção de serviço, semanas de indisponibilidade. Mas isso
atribuiria ao sistema uma capacidade que ele não tem. Como estabelecido no
Capítulo 6, a detecção é retrospectiva ou concomitante, e como estabelecido no
Capítulo 10, não há autoridade de interdição. **O sistema não previne o dano.**

O custo de um falso negativo é, portanto, o custo de **não produzir evidência de
atribuição** para um evento que ocorreu: um episódio que permanece sem
explicação, um caso que não se sustenta, um precedente de impunidade. É um custo
real e possivelmente alto, mas é de natureza diferente do custo do reparo, e
confundi-los levaria a otimizar o limiar para um objetivo que o sistema não
persegue.

### Uso

Fixada a matriz $C$, o limiar de ação — que, na formulação do Capítulo 4, é um
limiar sobre chance posterior e não sobre a saída do classificador — é escolhido
por minimização de custo esperado, e não por maximização de qualquer métrica
simétrica. Reporta-se a curva de custo esperado em função do limiar, para faixas
plausíveis das razões de custo, em vez de um único ponto de operação: as razões
de custo são juízos institucionais, não parâmetros técnicos, e cabe a quem
decide fixá-las.

## Protocolo de avaliação

Do exposto decorre o protocolo, que se aplica a todos os resultados do
Capítulo 9.

**Adota-se:** curvas de precisão–revocação por estrato; número esperado de
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
precisão–revocação é a representação apropriada [@saito2015].

*Métricas agregadas sobre estratos.* Conforme o Capítulo 5, a agregação sobre
condições de gelo e vento esconde exatamente a variação que o trabalho se propõe
a medir.

## O problema de olhar em muitos lugares

Um efeito adicional, ausente da formulação original, precisa ser registrado
porque agrava tudo o que foi dito.

O sistema não avalia um trânsito: varre muitos corredores, ao longo de muitos
dias, em muitas cenas. Cada avaliação é uma oportunidade de erro, e o número
esperado de falsos positivos escala com o produto de todas essas dimensões,
ainda que a taxa por avaliação seja baixa. Um sistema com um falso positivo a
cada dez mil trânsitos, operando sobre um corredor com cinquenta mil trânsitos
anuais, produz cinco alertas falsos por ano — em um fenômeno cujos eventos
genuínos são raros.

A consequência prática é que **o desempenho precisa ser reportado em unidades
absolutas por período**, e não apenas em taxas. "Um falso positivo a cada dez
mil trânsitos" e "cinco alertas falsos por ano neste corredor" são o mesmo
número e comunicam coisas muito diferentes a quem vai operar o sistema.

## Consequência para o que o trabalho pode afirmar

Este capítulo não conclui que o sistema seja inútil. Conclui algo mais preciso, e
que orienta a leitura de todo o restante da dissertação:

1. Um alerta isolado, sem contexto adicional, é quase certamente falso, e
   apresentá-lo como detecção seria enganoso independentemente da qualidade da
   engenharia.
2. O sistema produz valor quando a chance a priori não é a da população geral —
   quando há uma falha de cabo registrada, uma janela temporal, uma suspeita
   prévia. Aí, o mesmo $\Lambda$ sustenta conclusões fortes.
3. Existe um teto de precisão fixado pela fração acidental dos eventos, que
   nenhuma melhoria técnica ultrapassa.
4. A avaliação precisa ser feita sob a prevalência real, com métricas que não a
   escondam.

Os pontos 1 e 2, tomados em conjunto, dizem que a aplicação natural do sistema é
**retrospectiva e dirigida**, não prospectiva e indiscriminada. É a mesma
conclusão a que o Capítulo 6 chegou pela via da revisita e o Capítulo 10 alcança
pela via jurídica — três caminhos independentes convergindo no mesmo lugar, o
que é a melhor evidência disponível de que a conclusão está correta.
