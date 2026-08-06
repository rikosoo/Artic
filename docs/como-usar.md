# Como usar este repositório

Guia de instalação e compilação, do zero até `build/dissertacao.pdf`. Os
comandos abaixo foram executados e verificados em Ubuntu 24.04 com pandoc
3.1.3; onde o resultado depende do sistema, está indicado.

O texto da dissertação é Markdown em `capitulos/`. Nada é compilado
automaticamente: o PDF e o DOCX são gerados sob demanda pelo `Makefile`, e a
pasta `build/` não é versionada.

## 1. Clonar

```bash
git clone git@github.com:rikosoo/Artic.git
cd Artic
```

## 2. Instalar as dependências

São duas, e só a primeira é obrigatória:

- **pandoc** — converte o Markdown. Basta ele para gerar `docx`.
- **xelatex** (TeX Live) — só para o alvo `pdf`. É a dependência pesada:
  ~730 MB instalados.

### Linux (Debian/Ubuntu)

```bash
sudo apt-get update
sudo apt-get install -y pandoc

# Somente se quiser o PDF:
sudo apt-get install -y --no-install-recommends \
    texlive-xetex texlive-lang-portuguese \
    texlive-latex-recommended texlive-fonts-recommended lmodern
```

O pacote `lmodern` é fácil de esquecer e a falha que ele produz não é óbvia:
`! LaTeX Error: File 'lmodern.sty' not found.` Os cinco pacotes acima são o
conjunto mínimo verificado — `texlive-full` funciona, mas são ~6 GB
desnecessários.

### macOS

```bash
brew install pandoc
brew install --cask basictex   # ou mactex, se preferir a instalação completa
```

Com `basictex`, pacotes LaTeX que faltarem se instalam sob demanda:

```bash
sudo tlmgr update --self
sudo tlmgr install lm xetex
```

### Windows

Instalar [pandoc](https://pandoc.org/installing.html) e
[MiKTeX](https://miktex.org/download). O MiKTeX baixa os pacotes LaTeX
faltantes sozinho na primeira compilação — aceite os prompts. O `make` não vem
com o Windows; use o WSL, ou rode as linhas de `pandoc` do `Makefile`
diretamente no PowerShell.

## 3. Baixar o estilo de citação

O `metadata.yaml` aponta para `referencias/abnt.csl`, que **não é versionado** e
precisa ser baixado uma única vez. Sem ele a compilação falha.

```bash
curl -sSL -o referencias/abnt.csl \
  https://raw.githubusercontent.com/citation-style-language/styles/master/associacao-brasileira-de-normas-tecnicas.csl
```

O arquivo tem ~26 KB e começa com `<?xml version="1.0"`. Se vier menor que isso
ou começando com `version https://git-lfs...`, o download falhou — repita.

Se o seu programa de pós-graduação exigir outro estilo, troque o campo `csl:`
do `metadata.yaml` em vez de renomear o arquivo.

## 4. Compilar

```bash
make docx     # build/dissertacao.docx  — não precisa de LaTeX
make pdf      # build/dissertacao.pdf   — precisa de xelatex
make tex      # build/dissertacao.tex   — LaTeX editável
make contagem # palavras por capítulo, em ordem crescente
make limpar   # apaga build/
```

`make` sem argumento equivale a `make pdf`.

Referência do que esperar, no estado atual do texto (~24.900 palavras):

| Alvo | Tempo | Tamanho |
|---|---|---|
| `docx` | poucos segundos | ~98 KB |
| `pdf` | ~1 min na primeira vez | ~307 KB |

Use `docx` para revisão com o orientador — as equações são convertidas para
OMML e ficam editáveis no Word. Use `pdf` para leitura e para o depósito.

## 5. Editar

Um arquivo por capítulo, em `capitulos/`, na ordem do nome. A ordem de
concatenação vem do `$(sort $(wildcard capitulos/*.md))` no `Makefile` — é o
prefixo numérico que manda, não a data nem a posição no disco. Um capítulo novo
precisa do prefixo de dois dígitos para entrar no lugar certo.

Ao acrescentar um capítulo, nada mais precisa ser registrado: o `Makefile` o
encontra sozinho.

### Figuras

Ficam em `figuras/`, versionadas. O `--resource-path=.:figuras` permite
referenciar pelo nome, sem o diretório:

```markdown
![Legenda da figura](minha-figura.png)
```

### Citações

Chaves do `referencias/referencias.bib`, no formato do pandoc-citeproc:

```markdown
Como demonstrado em [@chave2024], ...
Segundo @chave2024, ...
```

A bibliografia é gerada no fim do documento automaticamente. Duas marcações
convencionadas no `.bib` sinalizam pendência — `% VERIFICAR` (metadados de
memória) e `% SUBSTITUIR` (falta a fonte primária); ver
`referencias/LEIA-ME.md`.

### Matemática

LaTeX entre `$...$` (linha) ou `$$...$$` (bloco). Os capítulos 4 a 10 usam
notação matemática, e é por isso que o alvo `pdf` depende de xelatex.

**Não use caracteres Unicode sobrescritos ou matemáticos direto no texto.** A
fonte padrão (Latin Modern) não tem glifos para vários deles, e o pandoc os
**descarta em silêncio** — o PDF sai sem o caractere, sem erro de compilação.
Escreva `$10^{-6}$` e `$\neq$`, não `10⁻⁶` e `≠`.

Para conferir se algo foi perdido:

```bash
make pdf 2>&1 | grep "Missing character"
```

Saída vazia significa que nenhum caractere caiu.

## 6. Fluxo de trabalho no git

Não há CI nem hooks: o repositório é texto e um `Makefile`. `build/`,
`dados/bruto/` e `dados/processado/` são ignorados — não versione saída de
compilação nem dado bruto.

```bash
git checkout -b minha-branch
# editar capitulos/...
make docx            # confirmar que ainda compila antes de commitar
git add capitulos/
git commit -m "Revisa a seção 4.4"
git push -u origin minha-branch
```

Rodar `make docx` antes do commit é o suficiente para pegar erro de sintaxe de
citação, que é a quebra mais comum e não aparece na leitura do Markdown.

## Problemas comuns

**`pandoc: referencias/abnt.csl: openBinaryFile: does not exist`**
O passo 3 não foi feito.

**`! LaTeX Error: File 'lmodern.sty' not found.`**
Falta o pacote `lmodern` (passo 2).

**`[WARNING] Citeproc: citation chave2024 not found`**
A chave não existe no `.bib`. O documento compila mesmo assim, e a citação sai
como `(chave2024?)` no texto — confira o aviso, ele é fácil de perder no meio
da saída.

**`make: command not found` (Windows)**
Use o WSL ou copie as linhas de `pandoc` do `Makefile`.

**O PDF saiu com um trecho faltando e sem erro nenhum.**
Provavelmente é o problema de glifo descrito na seção 5 — rode o `grep
"Missing character"`.
