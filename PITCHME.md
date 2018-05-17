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

Table 1 about right here 

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

### The Model: assumptions

Consumers valuation

$$\upsilon_j = 
\begin{cases}
\bar{\upsilon} + \lambda, & \text{if } j=h \\
\bar{\upsilon}, & \text{if else} \\
\end{cases}
$$

Banks cost of lending

$$c_j = 
\begin{cases}
c - \Delta, & \text{if } j=h \\
c + \omega_j, & \text{if } j \ne h \\
\end{cases}
$$
