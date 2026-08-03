# Resultados

> **Estado deste capítulo.** As seções abaixo especificam integralmente as
> figuras, tabelas e quantidades que serão reportadas, mas **não contêm valores
> medidos** — o processamento ainda não foi executado. Cada seção declara o que
> será apresentado, em que unidades, e qual expectativa foi registrada *antes*
> da medida, conforme o pré-registro do Capítulo 8, consolidado em
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

**Tabela 9.1 — Cobertura por recorte candidato.** Uma linha por recorte
(Golfo da Finlândia; Barents meridional; Svalbard–continente), com: número de
aquisições Sentinel-1 por ano, discriminadas por modo, órbita e par
polarimétrico; distribuição dos intervalos entre passagens, com mediana e
percentis, por ano e por configuração de constelação; fração do corredor e do
período com AIS no nível de mensagem; taxa média de reporte observada; fração do
corredor em profundidade operável; e número de trânsitos anuais.

**Figura 9.1 — Distribuição de intervalos entre passagens.** Histograma por
recorte e por ano. É esta figura que sustenta o argumento central do Capítulo 6:
espera-se que ela exiba agrupamento pronunciado, e é a distância entre a mediana
e a média que quantifica o quanto a "revisita média" engana.

*Critério de rejeição registrado:* recorte descartado se a revisita efetiva
tornar o teto do Capítulo 6 vazio, se a cobertura AIS for insuficiente para o
casamento, ou se a fração em profundidade operável não produzir amostra. Nesse
caso muda-se a área, não o método.

## Caracterização do corredor de risco

**Figura 9.2 — Componentes do campo de risco.** Painéis lado a lado para um
trecho representativo: batimetria, $w_{prof}$, $w_{fundo}$, $w_{tra\varsigma}$ e
o produto $R(\mathbf{x})$, sobre a mesma extensão geográfica, com um *buffer*
convencional sobreposto para comparação visual.

**Figura 9.3 — Curva de alcance da frota.** A função de sobrevivência
$w_{prof}^{0}(d)$ estimada a partir da composição real de tráfego no corredor,
com bandas de incerteza refletindo a dispersão da relação de amarra $s$. É o
resultado que substitui o limiar postulado de profundidade por uma quantidade
derivada.

*Expectativa registrada:* que a curva caia a valores desprezáveis bem antes dos
duzentos metros usualmente citados, na faixa sugerida pela profundidade de
fundeio de projeto da frota mercante. Se não cair, a componente perde
justificativa física e o resultado deve ser reportado como tal.

**Tabela 9.2 — Redução do espaço de busca.** Valor de $\rho$ — razão entre a
área do *buffer* convencional e a área efetiva $A_{ef}$ — por recorte e para
uma faixa de meias-larguras convencionais, com a decomposição de quanto cada
componente contribui para a redução.

*Expectativa registrada:* $\rho$ de ordens de magnitude. Uma redução inferior a
uma ordem de grandeza enfraqueceria substancialmente a primeira contribuição, e
esse resultado deve ser reportado sem atenuação caso ocorra.

**Figura 9.4 — Sensibilidade à incerteza do traçado.** $\rho$ e a largura
efetiva do corredor em função de $\sigma_{tra\varsigma}$, que não é conhecida e
é tratada como parâmetro. Delimita a região de valores em que a contribuição se
sustenta.

## Desempenho do detector por estrato

**Figura 9.5 — Curva de degradação.** Densidade de falso alarme $\lambda_{fa}$
em função da concentração de gelo, a limiar fixo, com o vento como família de
curvas, medida nas células de controle do Capítulo 5. Barras de incerteza
refletindo a população de cada estrato.

**Figura 9.6 — Taxa de troca.** Revocação sobre a verdade positiva parcial em
função da concentração de gelo, mantida $\lambda_{fa}$ constante. É o resultado
operacionalmente mais útil do capítulo: quanta capacidade de detecção é preciso
entregar para manter a precisão à medida que o gelo aumenta.

**Tabela 9.3 — População por célula do desenho fatorial.** Concentração × vento
× modo × tipo de gelo. Reportada integralmente, com as células vazias
explicitadas, antes de qualquer agregação.

**Tabela 9.4 — Mitigações.** Para cada mitigação do Capítulo 5: redução em
$\lambda_{fa}$, custo em revocação, custo em cobertura — esta última como
fração do corredor *e* como fração dos trânsitos excluídos — e aplicabilidade,
isto é, fração do acervo em que a mitigação pode ser usada.

**Figura 9.7 — Estratificação por textura versus por concentração.** Comparação
do poder informativo das duas variáveis de estratificação.

*Expectativa registrada:* que a textura local supere a concentração regional. Se
confirmada, implica que a variável de estratificação usada pela literatura é a
variável errada, e o resultado tem valor próprio.

**Declaração operacional.** O produto final da seção, na forma fixada no
Capítulo 5: o sistema é informativo até concentração $c^{*}$ sob vento até
$w^{*}$ na configuração $m$; acima disso, não.

## Probabilidade de detecção

**Figura 9.8 — Probabilidade de captura.** $P_{capt}$ em função da duração do
evento, de uma a doze horas, calculada pela expressão exata sobre os intervalos
reconstruídos, com a aproximação por revisita média sobreposta. **A distância
entre as duas curvas é o resultado**, e não um detalhe de método.

**Figura 9.9 — Efeito da latitude.** Número de passagens por ciclo e
probabilidade de captura, no mesmo eixo de latitude, exibindo o ganho por
convergência orbital e a perda por agrupamento — porque é o balanço entre os
dois que importa.

**Figura 9.10 — Teto de revocação por regime.** $P_{det}$ para os regimes
cooperativo e não cooperativo, por estrato de gelo, sem agregação. Inclui
$P_{\ge 2}$ para o caso não cooperativo em gelo, onde a classificação tende a
exigir duas passagens.

**Tabela 9.5 — Configuração de constelação por ano.** Revisita efetiva
disponível em cada ano do período de interesse, permitindo responder quanto da
não observação dos incidentes de 2022 a 2024 é atribuível à configuração
reduzida daquele período.

## Precisão calculada e custo esperado

Conforme o Capítulo 8, a precisão não é medida: é calculada a partir da
revocação estimada sobre o conjunto sintético, da densidade de falso alarme
medida nas células de controle e da prevalência estimada. A distinção deve
aparecer no texto e nas legendas.

**Tabela 9.6 — Prevalência estimada.** Numerador, denominador e intervalo, por
corredor, com as fontes de cada termo e a incerteza do numerador declarada.

**Figura 9.11 — Curvas de precisão–revocação por estrato.** Nunca agregadas.

**Tabela 9.7 — Falsos positivos esperados por corredor e por ano.** Em unidades
absolutas, conforme exigido pelo Capítulo 7, ao lado da taxa por trânsito, para
tornar visível a diferença de leitura entre as duas formas.

**Figura 9.12 — Peso de evidência.** Distribuição de $\log \Lambda$ para
trajetórias rotineiras e para trajetórias de arrasto simuladas, com a linha
correspondente ao valor exigido pela chance a priori do Capítulo 7.

*Esta é a figura que responde à pergunta central do trabalho:* o sistema produz
evidência de força suficiente para que a chance posterior deixe de ser
desprezável? A resposta pode ser negativa, e nesse caso deve ser reportada como
o resultado principal.

**Figura 9.13 — Diagrama de confiabilidade.** Calibração de $\Lambda$: valor
declarado contra força de evidência observada. Sem esta figura, a formulação em
razão de verossimilhança perde sentido.

**Figura 9.14 — Custo esperado.** Em função do limiar sobre chance posterior,
para faixas plausíveis das razões de custo do Capítulo 7, com a região de
indiferença marcada.

## Estudos de caso

Seis eventos sob protocolo *leave-one-event-out*. Conforme o Capítulo 8, **não
constituem estimativa de desempenho**: são estudos de caso conduzidos sob
disciplina, e a apresentação deve dizê-lo.

**Tabela 9.8 — Resumo por caso.** Para cada evento: $\Lambda$ atribuído; se e
quando a trajetória entrou no suporte de $R$; passagens ocorridas na janela e o
que cada uma observou; regime cooperativo ou não; e condição ambiental.

**Figuras 9.15 a 9.20 — Um painel por caso.** Trajetória sobre o campo de
risco, perfil temporal de velocidade, instantes de passagem, e decomposição de
$\Lambda$ por descritor.

**Tratamento específico do caso *Vezhen*.** Reportado com a moldura fixada no
Capítulo 8: um $\Lambda$ elevado neste caso confirma que a assinatura cinemática
não distingue mecanismo, e **não** constitui falha do sistema. A legenda da
figura deve conter essa afirmação, e não apenas o texto corrido.

## Ablação

**Tabela 9.9 — Contribuição isolada de cada componente.** Sistema completo
contra variantes com remoção de: componente de profundidade; componente de tipo
de fundo; componente de traçado; limiar adaptativo por estrato; correção do
deslocamento em azimute; e cada descritor cinemático.

*Expectativa registrada quanto ao tipo de fundo:* que sua remoção altere pouco o
desempenho. Se confirmada, o resultado honesto é declarar que a contribuição é
de profundidade e traçado, não de substrato — e a componente deve ser
apresentada como tal na versão final do método.

*Expectativa registrada quanto à correção de azimute:* que sua remoção produza
aumento mensurável de falsas embarcações escuras, quantificando uma fonte de
erro que a literatura frequentemente omite.

## Transferência entre domínios

Conforme o Capítulo 3, a diferença entre os domínios é o resultado, não um
efeito colateral.

**Tabela 9.10 — Desempenho por domínio.** Todas as quantidades principais,
lado a lado para calibração e alvo, com a decomposição da diferença nos eixos
que a produzem: gelo, modo de aquisição e resolução, densidade de AIS, revisita,
densidade de tráfego.

**Figura 9.21 — Decomposição da degradação.** Quanto de cada eixo responde pela
perda de desempenho na transferência.

*Registro obrigatório:* o desempenho no domínio alvo é estimado, não verificado
contra evento real. Nenhuma tabela desta seção deve ser apresentada sem essa
ressalva na legenda.

## Síntese

Fecha o capítulo uma tabela única reunindo os números que o Capítulo 10 utiliza:
$\rho$, $c^{*}$, teto de revocação por regime, precisão calculada, falsos
positivos esperados por ano e peso de evidência típico. É a tabela que um leitor
que pule os detalhes precisa encontrar, e a que sustenta as afirmações da
discussão.
