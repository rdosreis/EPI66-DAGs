## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='40%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex1.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='40%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex2.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='40%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex3.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='40%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex4.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex5.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex6.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex7.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex8.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens', 'dag-03-ex9.png'))


## ---- echo=FALSE, warning=FALSE, message=FALSE, out.width="70%", fig.align='center'------------------

# Carrega o pacote dagitty
library(dagitty)

# Carrega o DAG a partir do DAGitty
dag2 <- downloadGraph(x = "dagitty.net/mSTdaXn")
plot(dag2)


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='90%'-------------------

knitr::include_graphics(here::here('imagens', 'electoral-causality-loop.jpg'))


