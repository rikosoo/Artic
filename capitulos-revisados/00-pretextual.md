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
