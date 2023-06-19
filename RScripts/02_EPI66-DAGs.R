## ----echo=FALSE, message=FALSE, warning=FALSE, out.height="60%", fig.align='center'------------------

library(spdep)
library(sp)

poa_bairro <- readRDS(file = here::here('dados', 'poa_prop3.rds'))

coords <- sp::coordinates(poa_bairro)

par(mar = c(0, 0, 0, 0))
plot(poa_bairro)
plot(poly2nb(poa_bairro, queen = FALSE), coords,
     add = T, col = "steelblue", lwd = 2)



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='40%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'associa1.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='40%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'associa2.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='40%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'associa3.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'associa6.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='40%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'associa4.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='35%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'associa5.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='70%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'associa7.png'))



## ----echo=FALSE, message=FALSE, warning=FALSE, fig.align='center', out.width="80%"-------------------

n <- 1000
c <- rnorm(n)

b0 <- 0
b1 <- 1.5
b2 <- 1
b3 <- 0.5

x <- b0 + b2 * c + rnorm(n, sd = 0.5)
y <- b0 + b1 * x + b3 * c + rnorm(n, sd = 0.5)

par(mfrow = c(1, 1))
plot(y ~ x, pch = 16, col = "steelblue")



## ----echo=FALSE, message=FALSE, warning=FALSE, results='asis'----------------------------------------

df <- data.frame(c, x, y)

fit1 <- lm(y ~ x, data = df)
#summary(fit1)
fit2 <- lm(y ~ x + c, data = df)
#summary(fit2)

library(sjPlot)

tab <- sjPlot::tab_model(fit1, fit2,
                         string.pred = "Variáveis",
                         show.r2 = FALSE
                         )

library(sjtable2df)

tab_df <- sjtable2df::mtab2df(
  mtab = tab,
  n_models = 2,
  output = "data.frame"
)

tab_df <- tab_df[-4,]

library(knitr)
library(kableExtra)

kbl(tab_df,
    format = "latex",
    caption = "Ajuste por confundior",
    digits = 4,
    booktabs = T) %>% 
  add_header_above(c(" ", "Não ajustado" = 3, "Ajustado" = 3)) %>% 
  kable_styling(latex_options = c("scale_down"))



## ----echo=FALSE, message=FALSE, warning=FALSE, fig.align='center', out.width="80%"-------------------

n <- 1000

x <- rnorm(n)

b0 <- 0
b1 <- 0

y <- b0 + b1 * x + rnorm(n, sd = 0.5)
z <- x + y + rnorm(n, sd = 0.2)

plot(y ~ x, pch = 16, col = "steelblue", ylim = c(-1.8, 1.8), xlim = c(-3.2, 3.2))



## ----echo=FALSE, message=FALSE, warning=FALSE, results='asis'----------------------------------------

df <- data.frame(z, x, y)

fit1 <- lm(y ~ x, data = df)
#summary(fit1)
fit2 <- lm(y ~ x + z, data = df)
#summary(fit2)

tab <- sjPlot::tab_model(fit1, fit2,
                         string.pred = "Variáveis",
                         show.r2 = FALSE
                         )

library(sjtable2df)

tab_df <- sjtable2df::mtab2df(
  mtab = tab,
  n_models = 2,
  output = "data.frame"
)

tab_df <- tab_df[-4,]

library(knitr)
library(kableExtra)

kbl(tab_df,
    format = "latex",
    caption = "Ajuste por colisor",
    digits = 4,
    booktabs = T) %>% 
  add_header_above(c(" ", "Não ajustado" = 3, "Ajustado" = 3)) %>% 
  kable_styling(latex_options = c("scale_down"))



## ----echo=FALSE, message=FALSE, warning=FALSE, fig.align='center', out.width="80%"-------------------

z.cat <- cut(z,
             breaks = c(-Inf, quantile(z, probs = c(1 / 4, 2 / 4, 3 / 4, 1))),
             labels = 1:4)


plot(x[z.cat == "1"], y[z.cat == "1"], pch = 16, col = "#d0a040",
     xlab = "x", ylab = "y", ylim = c(-1.8, 1.8), xlim = c(-3.2, 3.2))
points(x[z.cat == "2"], y[z.cat == "2"], pch = 16, col = "#40d058")
points(x[z.cat == "3"], y[z.cat == "3"], pch = 16, col = "#d05840")
points(x[z.cat == "4"], y[z.cat == "4"], pch = 16, col = "#40b8d0")
legend("bottomright",
       pch = 16,
       col = c("#d0a040", "#40d058", "#d05840", "#40b8d0"),
       legend = 1:4, title = "Subpopulação", bty = "n")



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia1.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia2.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia3.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia4.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia5.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia6.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia7.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia8.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia9.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia10.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia11.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia12.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia13.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'terminologia14.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'constroi1.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi2.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi3.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi4.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi5.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi6.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi7.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi8.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi9.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'constroi10.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'backdoor1.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'backdoor2.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'backdoor3.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'backdoor4.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'backdoor5.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'backdoor6.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'backdoor7.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'backdoor8.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'controle1.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'controle2.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'controle3.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'controle4.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'controle5.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'controle6.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----
knitr::include_graphics(here('imagens', 'controle7.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'controle8.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE----

knitr::include_graphics(here('imagens', 'controle9.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='90%'-------------------

knitr::include_graphics(here('imagens', 'traffic-jam-causality-loop.jpg'))


