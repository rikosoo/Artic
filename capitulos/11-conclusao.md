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
restrição espacial por campo de risco condicionado por batimetria, caracterização
cinemática e saída em razão de verossimilhança calibrada.

**Mas os três limites investigados não são obstáculos de engenharia; são
propriedades do problema**, e cada um estabelece um teto que nenhuma melhoria
técnica ultrapassa. O gelo degrada o detector de forma caracterizável e impõe
uma troca mensurável entre precisão e revocação. A cadência de observação limita
a revocação por cima, e o limite é mais severo do que a revisita média sugere. E
a taxa base, combinada com a fração acidental dos eventos, limita a precisão por
cima. Os três tetos operam simultaneamente, e o produto deles — não cada um
isoladamente — descreve o que o sistema pode fazer.

Daí a resposta curta à pergunta: **a fusão SAR–AIS permite produzir evidência de
atribuição com força mensurável, e não permite detecção confiável de eventos
isolados.** Essa formulação é mais estreita do que a que motivou o trabalho, e é
a que os capítulos anteriores sustentam.

## Contribuições

**Corredor de risco condicionado por batimetria.** Substituição do *buffer* de
distância fixa por um campo escalar fatorado em profundidade, tipo de fundo e
traçado. A componente de profundidade é derivada de primeiros princípios — função
de sobrevivência da razão entre comprimento de amarra e relação de amarra sobre
a frota que efetivamente transita no corredor —, e não postulada por limiar; a
componente de traçado produz um perfil transversal igual à densidade da
incerteza do traçado, o que formaliza o piso de largura do corredor. O efeito é
reduzir o espaço de busca sem remover eventos genuínos, o que eleva a
prevalência dentro da região observada — mecanismo mais eficaz, como o Capítulo 7
mostra, do que qualquer refinamento de classificador.

**Caracterização da degradação por clutter de gelo.** Separação dos dois
mecanismos que a literatura confunde — falso alarme por feições de gelo, que
custa precisão, e detecção perdida sobre fundo brilhante, que custa revocação —
e sua medida por estrato, sob um desenho que resolve o problema do rótulo
negativo por células de controle. O produto é a taxa de troca entre revocação e
concentração de gelo a precisão constante, e uma declaração operacional
delimitada de até onde o sistema é informativo.

**Acoplamento entre revisita e duração do evento.** Modelo da probabilidade de
captura a partir da sequência determinística de passagens, com o resultado de
que intervalos heterogêneos produzem captura estritamente menor que intervalos
regulares de mesma média — de modo que citar revisita média superestima a
cobertura, e o erro cresce com a latitude. Separação entre regime cooperativo e
não cooperativo, com tetos radicalmente distintos.

A essas três soma-se a exigência metodológica que atravessa o trabalho: a
avaliação sob a prevalência real, com a precisão calculada e não medida, e com
a saída formulada como força de evidência separada da probabilidade a priori.

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

**Constelações comerciais de alta revisita.** O teto do Capítulo 6 fornece a
métrica exata para avaliar o que se ganharia com acesso a constelações SAR de
revisita substancialmente maior. A questão a responder não é se o ganho existe,
mas se ele desloca o fator limitante: se, no regime não cooperativo, a cadência
deixar de dominar o classificador, o esforço se realoca. O modelo já está
formulado de modo a responder isso sem refazer o trabalho.

**Polarimetria completa.** A separabilidade entre superfície metálica e gelo
deformado foi avaliada aqui apenas pela razão entre dois canais, limitada pelo
par adquirido em cada cena. Aquisições polarimétricas completas permitiriam
atacar diretamente o mecanismo de falso alarme do Capítulo 5.

**Sensoriamento acústico distribuído no próprio cabo.** É o desdobramento com
maior potencial de transformar o problema, e não apenas de melhorá-lo. Um cabo
instrumentado registra interações com o fundo em sua própria extensão, com
tempo e posição — isto é, fornece **verdade real** para eventos de contato.
Isso reformularia por completo o problema de rótulos do Capítulo 8: deixaria de
haver seis eventos e passaria a haver um registro contínuo, o que permitiria
estimar precisão empiricamente em vez de calculá-la, e treinar em vez de
apenas calibrar. Vale notar que essa perspectiva não altera nenhum dos três
tetos — o gelo, a cadência e a fração acidental permanecem —, mas altera
radicalmente a capacidade de medi-los.

**Estimação da fração acidental.** O teto de precisão depende de uma grandeza
hoje conhecida apenas por um punhado de decisões judiciais. Um levantamento
sistemático de causas determinadas em falhas de cabo, ainda que sobre registros
de operadoras não públicos, converteria esse teto de indicativo em quantificado
— e é um trabalho de escopo modesto com retorno alto.

**Extensão a outros corredores.** As três contribuições são geograficamente
transponíveis. O Báltico oferece densidade de eventos; o Ártico, relevância
estratégica; outros corredores rasos com tráfego intenso ofereceriam massa
estatística para testar a generalidade do campo de risco.

## Observação final

O trabalho começa perguntando se é possível detectar arrasto de âncora sobre
cabos submarinos árticos por satélite, e termina afirmando algo mais modesto:
que é possível produzir, sobre dados inteiramente públicos, evidência de força
quantificada a respeito de um evento — e que essa força, isoladamente, quase
nunca basta para uma conclusão.

Essa redução não é um resultado negativo. Um sistema que afirmasse mais estaria
afirmando o que não pode sustentar, e a literatura de vigilância marítima já
dispõe de exemplos suficientes disso. A contribuição de um trabalho acadêmico
sobre um tema com pressão política é, em boa medida, delimitar com precisão o
que a técnica autoriza a dizer — sobretudo quando a pressão empurra na direção
oposta. O sistema aqui proposto não detecta sabotagem. Detecta assinatura
cinemática compatível com arrasto de âncora, informa quanto essa observação
pesa como evidência, e entrega ao processo de atribuição a tarefa que lhe cabe.
