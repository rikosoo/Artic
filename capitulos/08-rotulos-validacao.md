# O problema dos rótulos e a estratégia de validação

## A ausência de ground truth
<!-- Não existe conjunto rotulado de sabotagem. Reconhecer de frente. -->

## Injeção sintética de trajetórias
<!-- Trajetórias simuladas de arrasto sobre condições reais de imagem e gelo.
Dá controle sobre revocação e alimenta as curvas do Cap. 6. -->

## Rótulos-proxy a partir de registros de falha e reparo
<!-- Data e localização aproximada como positivos fracos, com a incerteza
espaço-temporal explicitada e propagada. -->

## Validação leave-one-event-out
<!-- Sobre os casos bálticos e do Mar do Norte conhecidos: cada caso testado
por um modelo que não o viu. -->

## Conjunto de casos de validação

<!-- Tabela completa, com fontes e ressalvas: docs/casos-validacao.md
Levantamento feito em ago. 2026 a partir de fontes jornalísticas; cada linha
precisa de confirmação contra fonte primária antes de entrar no texto. -->

### Inventário de eventos documentados (2021–2026)

<!-- Árticos: Svalbard 2021 (segmento desaparecido), Svalbard jan. 2022
(arrasteiro russo, ~20 passagens sobre o traçado), Silver Dania jan. 2025
(liberado).
Bálticos: Balticconnector out. 2023 (Newnew Polar Bear); BCS East-West e
C-Lion1 nov. 2024 (Yi Peng 3); Estlink 2 dez. 2024 (Eagle S, ~90 km de
arrasto); Gotland–Ventspils jan. 2025 (Vezhen); Elisa FI–EE dez. 2025
(Fitburg); Letônia–Gotland jan. 2026 (não identificada).
Contraste: Taiwan–Penghu n.º 3, fev. 2025 (Hong Tai 58) — única condenação. -->

### Eventos utilizáveis e o que isso impõe ao desenho experimental

<!-- Apenas ~6 eventos reúnem data, posição, cobertura S1 provável e AIS:
Eagle S, Fitburg, Vezhen, Yi Peng 3 (dois eventos) e Balticconnector. Todos
bálticos. Pequeno demais para treinar e apertado para validar — o que confirma
a decisão de estimar revocação por injeção sintética e reservar os casos reais
para verificação externa sob leave-one-event-out.

Consequência para o Cap. 3: praticamente todo o ground truth está no Báltico,
não no Ártico. Adotar explicitamente a estratégia de calibrar no Báltico e
transferir para o Ártico, tratando a mudança de domínio (AIS mais rala, gelo,
revisita distinta) como parte do resultado e não como ruído. -->

### Negativos rotulados

<!-- O caso Vezhen é tão valioso quanto os positivos: é um evento de arrasto
com causa mecânica estabelecida por investigação oficial e hora exata da queda
da âncora. Serve como negativo rotulado forte para a matriz de custo do
Cap. 7 — e como demonstração de que a assinatura cinemática não distingue
mecanismo. -->

## Enquadramento
<!-- Repetir aqui, e nos títulos das figuras: o sistema não detecta sabotagem;
detecta assinatura cinemática compatível com arrasto de âncora. -->
