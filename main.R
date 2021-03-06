

## ---- libraries ----
library(dplyr)
library(ggplot2)
library(kableExtra, quietly = TRUE)
suppressMessages(library(lmtest))
suppressMessages(library(sandwich))
suppressMessages(library(stargazer))
library(quantreg)
library(tidyr)
library(gridExtra)


## ---- dataWrangling ----

setwd(dir = 'C:/Users/jvelezve/Documents/interest rates')
mainDf <- read.csv("\\\\CALI1183058\\velez\\subdata_loans.csv", header=T)

# keep only if info supersociedades
mainDf <- mainDf %>%
  filter(X_merge =="matched (3)", X_merge_ofi =='matched (3)')


# creates quarters
mainDf$quarter <- factor(paste(mainDf$anio_inicio,'Q',mainDf$trim_inicio, sep = ''), ordered = T)


# creates margins

mainDf$margen <-  mainDf$tasa_de_interes - mainDf$tes5anio

# creating period dummies (periods corresponding with different dispersion)
mainDf$period_dummies <- mainDf$quarter
levels(mainDf$period_dummies) <- list(
  '1' = c("2005Q1","2005Q2","2005Q3","2005Q4",
          "2006Q1","2006Q2","2006Q3","2006Q4",
          "2007Q1","2007Q2","2007Q3","2007Q4",
          "2008Q1","2008Q2","2008Q3","2008Q4",
          "2009Q1","2009Q2"),
  '2' = c("2009Q3","2009Q4",
          "2010Q1","2010Q2","2010Q3","2010Q4",
          "2011Q1","2011Q2"),
  '3' = c("2011Q3","2011Q4",
          "2012Q1","2012Q2","2012Q3","2012Q4",
          "2013Q1","2013Q2","2013Q3","2013Q4")
  )



# CREATES CHARACTERISTICS DUMMIES

# credit scores (done)

# duration
mainDf$term_dummies <- cut(x=mainDf$duracion_dias, breaks = c(0,1,30,365,730,1095,1460,1825,3674))

# assets
asset_cutoffs <- quantile(mainDf$activos_m, c(seq(0,1, by = .1)))
mainDf$asset_dummies <- cut(x=mainDf$activos_m, breaks = asset_cutoffs)

#debt
debt_cutoffs <- quantile(mainDf$obligaciones_financieras_m, c(seq(0,1, by = .1)))
mainDf$debt_dummies <-  cut(x=mainDf$obligaciones_financieras_m, breaks = debt_cutoffs)


#revenue
revenue_cutoffs <- quantile(mainDf$ingresos_operacionales_m, c(seq(0,1, by = .1)))
mainDf$revenue_dummies <-  cut(x=mainDf$ingresos_operacionales_m, breaks = revenue_cutoffs)


#productividad
omega_cutoffs <- quantile(mainDf$omega_acf_sample, c(seq(0,1, by = .1)), na.rm = T)
mainDf$omega_dummies <-  cut(x=mainDf$omega_acf_sample, breaks = omega_cutoffs)


# loan size
loan_cutoffs <- quantile(mainDf$saldo_de_credito_m, c(seq(0,1, by = .1)))
mainDf$loan_dummies <- cut(x=mainDf$saldo_de_credito_m, breaks = loan_cutoffs)

# CIUU (done)

#ciudad
mainDf$city_dummies <- factor(mainDf$cod_ciudad)

# anio
mainDf$year <- factor(mainDf$anio_inicio)


#HHI

mktCred_cutoffs <- quantile(mainDf$hhi_numcreds, c(seq(0,1, by = .1)))
mainDf$mktCred_dummies <- cut(x=mainDf$hhi_numcreds, breaks = mktCred_cutoffs)

mktsaldo_cutoffs <- quantile(mainDf$hhi_saldocreds, c(seq(0,1, by = .1)))
mainDf$mktLoan_dummies <- cut(x=mainDf$hhi_saldocreds, breaks = mktsaldo_cutoffs)


# network size
size_cutoffs <- quantile(mainDf$sizebank, c(seq(0,1, by = .1)))
mainDf$size_dummies <- cut(x=mainDf$sizebank, breaks = size_cutoffs)




## ---- boxplot

## we need to remove the cycle (DTF or tasa de intervención)


df <- mainDf %>%
  group_by(quarter) %>%
  mutate(margen = margen - median(margen))

ylim1 <- boxplot.stats(df$margen)$stats[c(1,5)]

p <- ggplot(df,aes(x=as.factor(quarter), y=margen)) +
  geom_boxplot(outlier.shape = NA) +
  # coord_cartesian(ylim = ylim1*1.05) +
  theme(axis.text.x=element_text(angle = -90, hjust = 0),
        axis.title.x=element_blank()) + 
  geom_vline(xintercept = c(15.5,23.5), linetype='dashed') + labs(y='Margen')


p




## ---- varianceDecomposition ----


myFormula <- 'margen ~ quarter +
                       term_dummies + loan_dummies + dummy_home_bank +
                       revenue_dummies + calificacion + omega_dummies + ciiu2d + debt_dummies +
                       city_dummies + mktCred_dummies + size_dummies'

myRegDummies <- lm(myFormula, mainDf)


results <-NULL

for (var in 1:3) {
  
 myreg <- lm(myFormula,mainDf[mainDf$period_dummies== toString(var),])
 
 results[[var]] <- myreg

}


Anova <- lapply(results, anova)
 
resultsAnova <- NULL


for (i in 1:3){
  sse <- sum(Anova[[i]]$`Sum Sq`)
  resultsAnova[[i]] <- Anova[[i]][1:13,2,drop=F]/sse
}

tableanova <- cbind(resultsAnova[[1]],resultsAnova[[2]],resultsAnova[[3]])

colnames(tableanova) <- paste('Period',1:3)

rownames(tableanova) <- c('Quarter',
                          'Term',
                          'Loan size',
                          'Home Bank',
                          'Revenue',
                          'Credit score',
                          'Productivity',
                          'Sector',
                          'Debt',
                          'City',
                          'HHI',
                          'Lender size',
                          'Residuals')


kable(tableanova, booktabs=T, caption = 'Variance decomposition', digits = 3) %>%
  kable_styling(latex_options = "striped")

tableanovaGroups <- data.frame(matrix(NA,nrow = 5,ncol = 3))


tableanovaGroups[1,] <-data.frame(t(apply(tableanova[1,],2,sum)))
tableanovaGroups[2,] <-as.data.frame(t(apply(tableanova[2:4,],2,sum)))
tableanovaGroups[3,] <-as.data.frame(t(apply(tableanova[5:9,],2,sum)))
tableanovaGroups[4,] <-as.data.frame(t(apply(tableanova[10:12,],2,sum)))
tableanovaGroups[5,] <-as.data.frame(t(apply(tableanova[13,],2,sum)))


rownames(tableanovaGroups) <- c('Quarter','Loan Characteristics','Borrower Characteristics','Market Structure','Residuals')

colnames(tableanovaGroups) <- paste('Period', 1:3)

kable(tableanovaGroups, booktabs=T, caption = 'Variance decomposition (Grouped)', digits = 3) %>%
  kable_styling(latex_options = "striped")



## ---- negosh ----

mainDf$logsaldo_de_credito <- log(mainDf$saldo_de_credito)
mainDf$logingresos_operacionales_m <- log(mainDf$ingresos_operacionales_m+1)
mainDf$logobligaciones_financieras_m <- log(mainDf$obligaciones_financieras_m+1)
mainDf$logempleados <- log(mainDf$empleados)
mainDf$logsizebank  <- log(mainDf$sizebank)
mainDf$hhi_oficinas1000 <- mainDf$hhi_oficinas*1000


#todos los efectos fijos
marginFormula4 <- 'margen ~ quarter +
                            duracion_meses +
                            logsaldo_de_credito +
                            dummy_home_bank +
                            omega_acf_sample + 
                            logingresos_operacionales_m + 
                            cod_ciudad +
                            logobligaciones_financieras_m +
                            calificacion +
                            hhi_oficinas1000 +
                            ciiu2d +
                            logempleados +
                            logsizebank'

# trimestre, sector
marginFormula3 <- 'margen ~ quarter +
                            duracion_meses +
                            logsaldo_de_credito +
                            dummy_home_bank +
                            omega_acf_sample + 
                            logingresos_operacionales_m + 
                            logobligaciones_financieras_m +
                            calificacion +
                            hhi_oficinas1000 +
                            ciiu2d +
                            logempleados +
                            logsizebank'

# trimestre
marginFormula2 <- 'margen ~ quarter +
                            duracion_meses +
                            logsaldo_de_credito +
                            dummy_home_bank +
                            omega_acf_sample + 
                            logingresos_operacionales_m + 
                            logobligaciones_financieras_m +
                            calificacion +
                            hhi_oficinas1000 +
                            logempleados +
                            logsizebank'

# trimestre
marginFormula1 <- 'margen ~ duracion_meses +
                            logsaldo_de_credito +
                            dummy_home_bank +
                            omega_acf_sample + 
                            logingresos_operacionales_m + 
                            logobligaciones_financieras_m +
                            calificacion +
                            hhi_oficinas1000 +
                            logempleados +
                            logsizebank'

marginReg4 <- lm(marginFormula4, mainDf)
marginReg3 <- lm(marginFormula3, mainDf)
marginReg2 <- lm(marginFormula2, mainDf)
marginReg1 <- lm(marginFormula1, mainDf)



stargazer(marginReg1, marginReg2, marginReg3, marginReg4, header=FALSE, type='latex', omit = c('quarter','cod_ciudad','ciiu2d'),
          covariate.labels = c('Term (months)','Amount (log)', 'Home bank', 'Productivity','Revenue (log)', 'Debt (log)', 'Credit score B',
                               'Credit score C', 'Credit score D', 'Credit score E','HHI','Employees (log)', 'Bank Size (log)'),
          column.labels = 'Margin',
          add.lines = list(c('Quarter FE', 'No', 'Yes', 'Yes', 'Yes'), c('City FE', 'No', 'No', 'No', 'Yes'), c('Sector FE','No', 'No', 'Yes', 'Yes')),
          omit.stat=c("f", "ser")
          )


# summary(lm(marginFormula4, mainDf[mainDf$duracion_dias==0,])) regression with subsample of same day loans. 




## ---- quantreg ----


laformula <- 'margen ~ quarter +
                       duracion_meses +
                       logsaldo_de_credito +
                       dummy_home_bank +
                       omega_acf_sample + 
                       logingresos_operacionales_m + 
                       logobligaciones_financieras_m +
                       calificacion +
                       hhi_oficinas1000 +
                       logempleados +
                       logsizebank'
cuartiles <- 1:9/10

QRmarginTermAmount <- rq(laformula, mainDf, tau=cuartiles)


plots <- NULL

vars <- c('dummy_home_bank',
          'duracion_meses',
          'omega_acf_sample',
          'hhi_oficinas1000',
          'logsaldo_de_credito',
          'logingresos_operacionales_m',
          'logobligaciones_financieras_m',
          'logempleados',
          'logsizebank')


plots <- NULL

for( i in 1:9){
    invisible(plots[[i]] <- plot(summary(QRmarginTermAmount), parm=vars[i]))
  
}


mylist <-NULL


for (i in 1:9){
  
  mylist[[i]] <- as.data.frame.table(plots[[i]])
  
}



# tidying dataset to plot handsome plot
library(tidyr)

bigdata <- do.call(rbind,mylist) %>%
  spread(.,Var2,Freq) %>% 
  group_by(Var1) %>%
  mutate(
    olsEstimate = last(coefficients),
    olsLB = last(`lower bd`),
    olsUB = last(`upper bd`)) %>%
  ungroup() %>%
  # mutate( x =  as.numeric(gsub('tau= ','',Var3))) %>%
  filter(Var3!='ols')

bigdata$cuantiles <- as.numeric(
  gsub('tau= ','', bigdata$Var3)
)



dfs <- NULL

for (i in 1:9) {
  dfs[[i]] <- filter(bigdata, Var1 == vars[i])
  
}

nombres <- c('Home-bank',
             'Term (months)',
             'Productivity',
             'HHI',
             'Amount (log)',
             'Revenue (log)',
             'Debt (log)',
             'Employees (log)',
             'Size (branches)')


plotes <- NULL


for (i in 1:9) {
  
  plotes[[i]] <- ggplot(dfs[[i]],aes(x = cuantiles, y=coefficients)) +
    geom_point() + geom_line(group=1) + 
    geom_ribbon(aes(ymin=`lower bd`, ymax=`upper bd`), linetype=2, alpha=.3) + 
    scale_x_continuous(breaks = seq(0.1, 0.9, by = 0.1)) +
    ggtitle(nombres[i])+ 
    geom_line(aes(y=olsEstimate))+ 
    geom_ribbon(aes(ymin=olsLB, ymax=olsUB), linetype=1, alpha=.2) + 
    labs(x= 'Quantile', y='Estimate') + theme_light()
  
}


suppressPackageStartupMessages(library(gridExtra))

grid.arrange(plotes[[1]],
             plotes[[2]],
             plotes[[3]],
             plotes[[4]],
             plotes[[5]],
             plotes[[6]],
             plotes[[7]],
             plotes[[8]],
             plotes[[9]])
             








# this shit takes forever
# marginQreg <- rq(marginFormula4,mainDf, tau=c(.25,.5,.75))
# summary.rq(marginQreg, se = 'boot')  



