# Método

## Visão geral do pipeline
<!-- Sentinel-1 → pré-processamento → detecção CFAR → correspondência AIS →
filtro por corredor de risco → análise cinemática → pontuação. -->

## Detecção de alvos
<!-- CFAR adaptativo; parametrização; tratamento de sidelobes e ambiguidades
de azimute. -->

## Correspondência SAR–AIS
<!-- Interpolação da trajetória AIS para o instante de aquisição; janela
espaço-temporal de associação; associação por custo (GNN/Hungarian);
tratamento explícito da não-correspondência ambígua. -->

## Corredor de risco condicionado por batimetria
<!-- CONTRIBUIÇÃO 1. R(x) = f(profundidade, tipo de fundo, distância ao cabo,
viabilidade cinemática). Peso decrescente com a profundidade, ~nulo além do
alcance operacional de ancoragem — justificar com comprimento de amarra por
classe de navio, não com limiar arbitrário. Propagar a incerteza do traçado
para a largura do corredor. Reportar redução do espaço de busca vs. buffer
fixo. -->

## Análise cinemática de trajetória
<!-- Velocidade sustentada na faixa de arrasto; persistência de rumo; ângulo de
cruzamento do cabo; desaceleração anômala; correlação com a geometria do cabo. -->

## Pontuação e classificação
<!-- Saída como score calibrado + evidência, não rótulo binário. Justificar:
sob a taxa base do Cap. 7, um rótulo binário é ativamente enganoso. -->
