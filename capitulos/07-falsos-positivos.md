# Falsos positivos: taxa base, confundidores e custo assimétrico

<!-- NÚCLEO DO TRABALHO. Vem ANTES dos resultados, deliberadamente. -->

## Análise de taxa base
<!-- Cálculo explícito com números: N trânsitos/ano × fração que satisfaz o
filtro cinemático, contra eventos confirmados na história registrada.
VPP = (Sens·Prev) / (Sens·Prev + (1−Espec)·(1−Prev))
Apresentar como tabela de VPP × prevalência × especificidade.
Isto é um achado, não uma ressalva. -->

## Confusão entre pesca de arrasto e arrasto de âncora
<!-- Arrasteiro a 3-5 nós tem assinatura quase idêntica. E a ironia central:
pesca de arrasto é a principal causa acidental histórica de dano a cabos. O
comportamento "anômalo" é também a explicação inocente mais comum — e que
também produz dano. Discutir se a distinção é necessária para prevenção
(não é) ou para atribuição (é). -->

## Falha mecânica do sistema de retenção da âncora
<!-- CONFUNDIDOR DE PRIMEIRA ORDEM — identificado a partir do caso Vezhen
(jan. 2025). O Ministério Público sueco arquivou o caso como acidental: dois
dos três dispositivos de retenção estavam inoperantes havia tempo e o terceiro
cedeu ao impacto de uma onda; a âncora caiu sem ação da tripulação.

Ponto crítico para o argumento: a assinatura resultante é FISICAMENTE IDÊNTICA
à de arrasto deliberado — não parecida, idêntica —, porque é o mesmo fenômeno.
Nenhum sensor remoto pode separá-las; a diferença está inteiramente a bordo.
Avaliações de inteligência de jan. 2025 generalizaram essa leitura: tripulações
inexperientes em navios mal mantidos, sem evidência de direção estatal.

Consequência: este confundidor estabelece um teto de precisão independente de
sensor, análogo ao teto de revocação do Cap. 6. Vale enunciá-lo como resultado. -->

## Demais confundidores legítimos
<!-- Desvio por gelo; capeamento e redução de velocidade por mau tempo; espera
de praticagem; operação científica (reboque de sensor, perfilagem); manutenção
do próprio cabo — que por construção ocorre sobre o traçado, em velocidade
baixa, com manobra anômala. Para cada um: assinatura esperada e possibilidade
de desambiguação com dados públicos. -->

## Custo assimétrico
<!-- No Ártico, um falso positivo = deslocar ativo por distâncias enormes ou
abordar/questionar embarcação de outra bandeira, com custo diplomático real.
Formalizar em matriz de custo; otimizar limiar por custo esperado. -->

## Protocolo de avaliação
<!-- Precisão–revocação e custo ponderado. Acurácia e ROC-AUC excluídas com
justificativa explícita: sob desbalanceamento extremo a especificidade domina
a ROC e produz curvas excelentes para sistemas inúteis. -->
