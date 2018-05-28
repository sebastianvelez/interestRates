# Search frictions and market power in negotiated-price markets
### Allen, Clark and Houde

---

### Foreplay

- **Negotiated-price markets**
    - Sellers post prices, but actual transaction prices are achieved via bargaining (cars, health insurance, capital assets, B2B)
    - Key features: *search frictions* (cost of gather quotes), *loyatly advantage* (switching cost, complementarities, etc).
    
Note:
Both things have implications for market power. **Search costs** lead to PD (first seller has almost monopoly power if high costs of search) and **brand loyalty** reduces (bargaining because incumbents provide higher value thus lock-in happens). Together they imply that the firm with an extensive consumer base has an **incumbency advantage** over rival firms in the same market.

---

### Foreplay (II)

- **Canadian mortgage market**  
Administrative data on a large number of individually negotiated mortgage loans.
    - National lenders post common interest rates but branches have freedom to negotiate.
    - Evidence of cost search and brand loyalty
    
Note:
70% consumers combine day-to-day banking and mortgage services at the same institutions and 80% get a rate quote from this lender. Moreover, only 28% obtain a mortgage from a different lender than their main institutions.

--- 

### Research questions

1. What is the impact of search frictions on consumer welfare?
2. What are the sources and magnitude of market power?
    + first-mover advantage arising from PD and search friction
    + loyalty advantage originating from long-term relationships
    
---

### Approach

- Estimate a 2 stage model of demand and supply:  
    - **First stage:** people get a quote from their usual banks and banks use their first quote to weed out high search-cost consumers.
    - **Second stage:** consumers pay a search cost and local banks compete via an English auction for the contract.

--- 

### Consumer surplus loss

Counterfactual experiments eliminate search costs. Loss ($12/month) stems from 3 sources:
- missallocation of buyers and sellers (12%)
- price discrimination (28%)
- direct cost of gathering quotes (50%)


Note:  
They also find that posting rates reduces the banks ability to price discriminate, reducing the welfare cost of search frictions. Competition also amplifies the adverse effects of search frictions on consumer welfare.

---

### Sources of incumbency advantage

- Banks with large consumer bases enjoy a 70% extra margins:
    - search costs account for 30%
    - brand loyalty accounts for 50%
    - 20% their interaction
    
--- 

### Institutional details

- The Big 8 control 90% of the banking industry assets
- 2 kinds of mortgage contracts:  
    - conventional
    - high loan-to-value ratio 
- 2 insurers, same guidelines:a premium ranging from 1.75% to 3.75% the value of the loans
- The large banks operate nationally and post weekly prices that are common across the country


Note:
The Big 8 are 6 banks, 1 coop and a provincial deposit taking institution. Conventional contracts have low loan-to-value ratio and don't require insurance. High loan-to-value do require insurance. 

---

### Mortgage data

- 10% random sample of insured contracts (1999-2002)
- terms of contracts:
    - transaction rate, loan size, house price, closing date
- demographics of borrowers
    - income, FICO score, loan-to-value ratio, house location (FSA)
- They end up with 26,000 observations (1/3 of initial sample)
    
    
Note:
FSA means Forward Sortation Area and it is larger than a zipcode.  
They restrict the contracts to those with homogeneous terms: 25 year amortization period, 5 year fixed rate term, newly issued mortgages, individually negotiated (no broker), without missing values for key attributes.  
Data provided by one of the insurers (CMHC) but they claim the contracts of the other insurer are similar.

---

### Mortgage data (Outcome variables)

- With the data they construct:
    - monthly payment: transaction interest rate, loan size and amortization period
    - negotiated discounts: posted rate and transaction rate
    - loyalty: dummy if consumer has dealt with said bank
    
    

---

### Market structure data

- Consumer base: share of day-to-day banking services
- They group the Ipsos-Reid data into year/regions (10) and income categories (4)
- Estimate the probability that a consumer with characteristics $x_i$ chooses bank $h$, $\psi_h(x_i)$
- Consumer choice set: banks within 10 Km of the centroid of the FSA (justified by data)
    - $\mathcal{N}_i$ set of rival lenders (excluding home bank)
    - $n_i$ number of banks in $\mathcal{N}_i$



Note:
Ipsos-Reid data contains micro-data on 12,000 households. Consumer base proxies for fraction of consumers that have experience with a bank.



---

### Canadian mortgage market (Summary statistics)

![](https://i.imgur.com/UDggSos.png)

---




### Canadian mortgage market (5 key features)


1. Mortgage rates are dispersed
2. Loyal consumers and those living in concentrated markets pay more
3. Consumers search more than they switch
4. Consumers are more loyal in concentrated markets and to banks with larger networks
5. Lenders with strong retail presence have larger market shares





Note:
1. No dispersion on posted rates but lots on transaction rates (.61 R2)
2. Discount for loyal consumer is 9.1 bps smaller than new clients. Discounts increase in number of lenders and decrease in relative size network
3. 80% get a quote from their bank, 60% search and 28% switch away from their original institution


---

### The Model

- Consumers make a discrete choice

$$\max_{j \in \mathcal{J}}\upsilon_j - p_j$$

where $\upsilon_j$ is the WTP for bank $j$, $p_j$ is a monthly payment.

- Consumers get quotes from home bank ($n$) or one of the $n$ lenders in $\mathcal{N}$

- Consumers incur a cost $\kappa > 0$ when getting quotes outside $h$ (independent of # of quotes)


---

### The Model: assumptions

- Consumers valuation

`$$\upsilon_j =
\begin{cases}
\bar{\upsilon} + \lambda, & \text{if } j=h \\
\bar{\upsilon}, & \text{if else} \\
\end{cases}
$$`

- Banks cost of lending

`$$c_j = 
\begin{cases}
c - \Delta, & \text{if } j=h \\
c + \omega_j, & \text{if } j \ne h \\
\end{cases}
$$`

Note:

The idiosyncratic component is distributed $G()$ with $E(\omega_j)=0$. Lenders are constrained by a common posted price $\bar{p}$ which determines the reservation price of consumers($\bar{\upsilon}>\bar{p}$) and whether or not they qualify for a loan ($\bar{p}>c_j$)



---

### The game

- **Stage 0:** consumers decide house, loan size, timing of purchase, etc.
- **Stage 1:** lenders make an offer $p^0$ and consumers decide whether to accept or not
    - State vector (common knowledge) : $s=(c,\lambda, \Delta, \bar{p}, n)$
- **Stage 2:** English auction
    - lenders learn their $\omega_j$
    
---

### Competition stage

2 cases, conditional on rejection of $p^0$

- $\bar{p}<c-\Delta$ (the borrower doesn't qualify)
    - The lowest qualifying bank wins with `$p^* = \min\{ c+\omega_{(2)},\bar{p}\}$`

- $p^0 + \Delta < \bar{p} + \Delta$ (the borrower qualifies)
    - the highest surplus bank wins and offer a quote that provides the same utility as the second best option
    
    
    
---

### Competition stage (ctd)

- The equilibrium pricing function is given by


`$$p^* = 
\begin{cases}
p^0                      & \text{if } \bar{\upsilon} + \lambda - p^0 \ge \bar{\upsilon} - c - \omega_{(1)} \\
c + \omega_{(1)}+\lambda & \text{if } \bar{\upsilon} + \lambda - p^0 < \bar{\upsilon} - c - \omega_{(1)} < \bar{\upsilon} - c -  \gamma \\
c - \gamma               & \text{if } \bar{\upsilon} - c - \omega_{(1)} > \bar{\upsilon} - c -  \gamma >   \bar{\upsilon} - c - \omega_{(2)}\\
c + \omega_{(2)}         & \text{if } \bar{\upsilon} - c - \omega_{(2)} > \bar{\upsilon} - c -  \gamma
\end{cases}
$$`

Note:
Home bank wins in the first two cases. Other bank in the last 2. 


---

### Search decision

- The gain from searching is
`$$\bar{\kappa}(p^0,s)=\bar{\upsilon}+\lambda[1-G_{(1)}(-\gamma)]+E[p^*|p^0,s]-[\bar{\upsilon} + \lambda - p^0]$$`
$$\bar{\kappa}(p^0,s)=p^0 - E[p^*|p^0,s] - \lambda G_{(1)}(-\gamma)$$

- A consumer will reject $p^0$ only if there is a net gain from searching

$$Pr(\kappa < \bar{\kappa}(p^0,s))$$
$$Pr(\kappa < p^0 - E[p^*|p^0,s] - \lambda G_{(1)}(-\gamma)) \equiv H(\bar{\kappa}(p^0,s))$$



Note:

Where $1-G_{(1)}(\gamma)$ is the retention probability of the home bank.



---

### Initial quote

- Banks engage in PD by offering $p^0$ first to capture high-search cost consumers and then $p^*$ if it is rejected

$$\max_{p^0 \le \bar{p}}(p^0-c+\Delta)[1-H(\bar{\kappa}(p^0,s))]+H(\bar{\kappa}(p^0,s))E(\pi^*_h|p^0,s)$$

- The home bank will offer a quote only if it makes a profit at the posted price ($0<\bar{p}-c+\Delta$). The FOC is

`$$p^0 - c + \Delta = \frac{1-H(\bar{\kappa}(p^0,s))}{H'(\bar{\kappa}(p^0,s))\kappa_{p^0}(p^0,s)}+E(\pi^*_h|p^0,s)+\frac{H(\bar{\kappa}(p^0,s))}{H'(\bar{\kappa}(p^0,s))\kappa_{p^0}(p^0,s)}\frac{\partial E(\pi^*_h|p^0,s)}{\partial p^0}$$`



Note:  

There are 3 sources of profit: 1) search costs, 2) cost and quality differentiation, 3) reserve price effect. And the initial quote is additive in c in the interior. They have proofs on that and the corollary that follows



---

### Identification: observed outcomes

1. Distribution of prices for loyals is a function of prices coming from searchers and non searchers
2. Distribution of prices for switchers depends only on the outcome of the auction
3. The switching probability is a combo of
    + consumers rejecting initial offer
    + banks losing the auction

---
    
### Identification 

- Distribution of prices for switchers (*Identification at infintiy*)
    + $c_i$ and $\gamma=\lambda + \delta$
- Distribution of prices for loyals (*Corollary 1*)
    + $\lambda$ and $\delta$
- Empirical probability of remaining loyal
    + $\kappa$
    
Not enough variation



Note:
1. No problem observing just switchers because as prices go up transactions are generated in the auction state. Markets with different $n$ can be used to identify separately $F(c_i|x_i)$,  $G(\omega_i)$ and $\gamma=\Delta+\lambda$. For instance if n=2, $p_i^* = c_i+\gamma$ from where  $F(c_i|x_i)$ can be identified given $\gamma$. For small numbers $n >2$ given the high loyalty, switchers price reflects mostly cost (which is independent of $c$). For large numbers the correlation between the number of rivals and price paid by switchers depends on the loyalty parameter. Really large n arguments are just English auction. 
2. $\lambda$ and $\gamma$ have different effects on average transaction price for loyal consumers but the same for probability of search in the interior and distribution of price for switchers.


---

### Estimation

- Quasi-likelihood estimator
    - aggregate likelihood: $L(p_i,b_i|\mathcal{I}, \theta)$
    - additional information on search effort: $m(\theta)_{K\times1}$
    
- The estimator solves

$$\max_\theta \sum_i \text{log} L(p_i, b_i|\mathcal{I}_i,\theta)-m(\theta)^T\hat{W}_2m(\theta)$$

--- 

### Functional forms

- Cost of lending: `$c_{ij}=L_i \times (c_i,\omega_{ij})$`

- Cost of lending (home bank): `$c_{i,h(i)}=L_i \times (c_i,\Delta_{i,h(i)})$`
    - `$\Delta_{i,h(i)}=\xi_{i,h(i)}-\Delta(z_i^2)$`
    

--- 

### Functional forms

- Cost advantage and WTP are modeled as functions of observables
    - `$\Delta(z_i^2)=L_i \times (\Delta_0 + \Delta_{inc}\text{Income}_i+ \Delta_{owner}\text{Previous Owner}_i)$`
    - `$\lambda(z_i^2)=L_i \times (\lambda + \lambda{inc}\text{Income}_i+ \lambda{owner}\text{Previous Owner}_i)$`
    
Similarly for the search cost distribution

---

### Results: general


- All specifications imply home bank is more likely to win
    - WTP model implies larger price difference between loyals and switchers
    - Cost-advantage models leads to larger estimates for differentiation parameters $\Delta$, $\sigma_\omega$
    - specification (3) used to solve the tie


Note:

All specifications imply that the home bank is more likely to win. But have different implications for the priced of loyals and switchers

---

### Results: cost of lending

- The estimate on `$\sigma_\omega$`, 0.102 has implications for `$c_{(1)} - c_{(2)}$` depending on market structure: $20 for duopoly, $17 for 3 lenders and approaches $14 when 11 lenders
    
- markets power also arises from bank fixed effects, network size and home-bank cost advantage
    - $12 a month cost-advantage for a bank with 3 branches


Note:

Consistent with notion that lending cost function captures complementarity between services that are increasing in size.


---

### Results: cost advantage ($\Delta_i$)

![](https://i.imgur.com/AX1EKrt.png)


--- 



### Results: cost advantage ($\Delta_i$)


- Estimated to be $17 for a $100K loan
- Confers the home bank a huge advantage (51% probability of being cheaper then the most efficient lender in $\mathcal{N}_i$)



--- 



### Search cost distribution

- Search costs are increasing in income and prior-ownership status

- New home-buyers have lower search costs and a 1% increase in income leads to a 0.4% increase in search cost.

- Substantial difference between searchers and non-searchers: $549 and $2300


Note:

Consistent with the interpretation of costs depending on cost time of collecting multiple quotes.

Search costs sound like a lot but the represent just 2.5% of the cost of the contract (but are in general much lower than those in search literature)


----

### Counterfactuals: Search cost or market power

- Use the model to quantify the effect of either in consumer surplus and firms profits
- Compute equilibrium without search costs
    + direct burden of searching quotes
    + misallocation
    + price discrimination

- Compute equilibrium without incumbency advantage


---

### Counterfactuals: no search costs

`$$\begin{align}
\Delta CS_i & = \underbrace{\hat{\upsilon}-p_i-1(\kappa_i<\bar{\kappa}(p^0_i))\kappa_i}_{CS_i} - \underbrace{(\bar{\upsilon}-\tilde{p}_i)}_{\widetilde{CS}_i} \\
& = [\tilde{c}_{i,b}- c_{i,b}] - (m_i-\tilde{m}_i) - 1(\kappa_i<\bar{\kappa}(p^0_i))\kappa_i \\
& = \Delta V_i - \Delta m_i - 1(\kappa_i<\bar{\kappa}(p^0_i))\kappa_i
\end{align}$$`



Note:  

they label the three components *misallocation*, *discrimination* and *search cost*. *Misallocation* and *search cost* account for loss induced by search friction. 



--- 

### Search costs decomposed


![](https://i.imgur.com/aGNIPxw.png)



---




### Distribution of margins

![](https://i.imgur.com/TCpEfVG.png)




---



### Incumbency advantage

- What is the relative importance of the first mover advantage and differentiation>
    - CF1: cost advantage of home bank set to zero
    - CF2: eliminate ability of screening high-search cost customers
    - CF3: both


Note:

CF1 is analogous to separating provision of mortgages and other banking services. CF2 is done by imposing uniform matching probabilities.

---

### Components


![](https://i.imgur.com/yMwuZut.png)



---


### 
