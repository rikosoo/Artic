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
