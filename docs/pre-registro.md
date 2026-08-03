# Pré-registro do plano de análise

Documento previsto na seção final do Capítulo 8. Fixa o plano de análise
**antes do primeiro contato com os eventos reais**, para que a validação
*leave-one-event-out* seja verificação e não ajuste.

**Regra de uso.** Alterações posteriores a este documento são permitidas, mas
devem ser registradas como emendas datadas na seção final, e as análises
correspondentes reportadas separadamente das pré-registradas. Uma emenda não
invalida o trabalho; uma emenda silenciosa, sim.

**Status:** versão inicial, anterior à aquisição de dados.
**Data:** a preencher na primeira versão congelada.

---

## 1. Unidade de análise

Um **trânsito**: passagem de uma embarcação pelo suporte do campo de risco
$R(\mathbf{x})$, delimitada por entrada e saída. Positivo se durante ele houve
arrasto de âncora capaz de danificar o cabo.

Unidades rejeitadas, com motivo: *cena* (torna a prevalência dependente da
largura de faixa, propriedade instrumental); *detecção* (confunde avaliação do
detector com a do sistema).

## 2. Desfechos

**Primário.** Peso de evidência $\log_{10}\Lambda$ atribuído a trajetórias de
arrasto contra trajetórias rotineiras, e sua calibração.

**Secundários.** $\rho$ (redução do espaço de busca); $\lambda_{fa}$ por
estrato; taxa de troca revocação × concentração de gelo; $P_{capt}$ e $P_{det}$
por regime; falsos positivos esperados por corredor e por ano.

**Não são desfechos.** Acurácia e área sob a curva ROC não serão calculadas nem
reportadas, pelas razões do Capítulo 7. Esta exclusão é parte do pré-registro.

## 3. Estratos

Fixados antes da medida e não redefinidos em função dos resultados:

- **Concentração de gelo:** 0–1 %, 1–30 %, 30–70 %, 70–100 %.
- **Tipo:** primeiro ano, multiano, zona marginal (definida por distância à
  borda, não por concentração).
- **Vento a 10 m:** faixas a fixar por quartis da distribuição observada no
  corredor, determinadas **antes** de qualquer análise de desempenho.
- **Configuração de aquisição:** modo × par polarimétrico.
- **Estação:** congelamento e derretimento separados, pela convergência de
  assinaturas sob derretimento superficial.

Células com população insuficiente serão reportadas como vazias, não agregadas
silenciosamente a células vizinhas.

## 4. Critérios de exclusão de dados

Fixados antes da inspeção:

- cenas com cobertura parcial do corredor abaixo de limiar a definir;
- cenas com falha de processamento ou artefato radiométrico identificado;
- períodos sem cobertura AIS no nível de mensagem;
- trajetórias com intervalo entre reportes AIS acima de limiar a definir, por
  impossibilitar propagação confiável ao instante de aquisição.

Toda exclusão é contabilizada e reportada com o motivo. O número de cenas
excluídas por categoria entra na Tabela 9.1.

## 5. Células de controle

Definição operacional, fixada antes da medida:

- ausência completa de reportes AIS em janela de $\pm T$ em torno da aquisição;
- distância mínima $D_{min}$ a qualquer rota de navegação conhecida e a qualquer
  área de fundeio mapeada;
- presença de gelo confirmada pelo produto de concentração.

Valores de $T$ e $D_{min}$ a fixar antes do processamento. A fração estimada de
contaminação por embarcação escura genuína será reportada, e $\lambda_{fa}$
tratada como **limite superior**.

## 6. Geração de trajetórias sintéticas

Parametrização por grandezas **físicas** — comprimento de amarra, relação de
amarra, velocidade, rumo, resistência de arrasto — e explicitamente **não** pelos
descritores usados na pontuação, para evitar circularidade.

Condições ambientais (batimetria, gelo, vento) e sequência de passagens tomadas
de datas e locais reais.

Verificação de plausibilidade contra as trajetórias reais disponíveis,
reportada antes de qualquer uso das trajetórias sintéticas para estimar
revocação.

## 7. Expectativas registradas

Enunciadas antes da medida, para que a confirmação ou refutação seja
interpretável. **Nenhuma delas será revista após observar os resultados.**

| # | Expectativa | Refutação implicaria |
|---|---|---|
| E1 | $\rho$ de pelo menos uma ordem de grandeza | Contribuição 1 substancialmente enfraquecida |
| E2 | $w_{prof}^{0}$ cai a valores desprezáveis bem antes de 200 m | Componente de profundidade perde justificativa física |
| E3 | Distribuição de intervalos entre passagens fortemente agrupada | Argumento do Cap. 6 sobre revisita média perde força |
| E4 | Textura local supera concentração regional como estratificação | Estratificação usual da literatura seria adequada |
| E5 | Remoção de $w_{fundo}$ altera pouco o desempenho | Componente de substrato seria relevante, contra a expectativa |
| E6 | Remoção da correção de azimute aumenta falsas embarcações escuras | Fonte de erro seria menos relevante que o suposto |
| E7 | No regime não cooperativo, a cadência limita mais que o classificador | Esforço de modelagem teria retorno maior que mais observações |

Cada expectativa refutada é um resultado a reportar com o mesmo destaque de uma
confirmada.

## 8. Protocolo *leave-one-event-out*

Para cada um dos eventos utilizáveis:

1. excluir dos conjuntos de ajuste o período e a região do evento;
2. reestimar **todos** os componentes ajustáveis — limiares por estrato,
   parâmetros do campo de risco, calibração de $\Lambda$;
3. avaliar o evento pelo sistema resultante;
4. reportar $\Lambda$, decomposição por descritor, entrada no suporte de $R$,
   passagens na janela e o que cada uma observou.

Declarado antecipadamente: com seis eventos, o procedimento **não produz
estimativa de desempenho**. Será apresentado como conjunto de estudos de caso, e
nenhuma métrica agregada será calculada sobre ele.

## 9. Tratamento do caso *Vezhen*

Registrado aqui por ser o ponto em que a tentação de ajustar é maior.

Um $\Lambda$ elevado atribuído a este caso será reportado como **confirmação**
de que a assinatura cinemática não distingue mecanismo — conforme o Capítulo 7 —
e não como falha a corrigir. Nenhum componente do sistema será modificado com o
objetivo de reduzir o $\Lambda$ deste caso.

## 10. O que não será afirmado

- Que o sistema detecta sabotagem ou estabelece intenção.
- Que o desempenho no domínio ártico foi verificado contra eventos reais.
- Qualquer número de precisão apresentado como medido, e não calculado.

---

## Emendas

*(nenhuma até o momento)*
