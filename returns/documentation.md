---
title: "Shiny app documentation"
author: "Sergey Bushmanov"
date: "08/19/2014"
output: html_document
---

## FAQ:

#### 1. What is this application about? 

- This is a basic financial application that allows interactive vizualization of 
historical performance of two asset classes: Stocks and Bonds

#### 2. What will I learn from this app?

- You will learn histroical performance of $1, invested in either Stocks or Bonds, over chosen investment horizon, "real" or "nominal"

#### 3. What are the user inputs to the app? 

- There are two user inputs in the greyed area under the title "User interactive inputs":

  - **Slider**, that allows to specify investment horizon in years  
  
  - **Tickbox**, that allows to choose between real, i.e. inflation adjusted returns, or
nominal returns (more on difference between real and nominal returns can be found at 
[this](http://en.wikipedia.org/wiki/Real_versus_nominal_value_%28economics%29) Wikipedia page)

#### 4. Where does the underlying data come from?

- 1871-2012 data for stocks (SP500), bonds (government 1 year bond), and CPI come from
Prof. Shiller's [website](http://www.econ.yale.edu/~shiller/data.htm)

#### 5. Apart from downloading data from Prof. Shiller's website and plotting it, what does the app do?

- The App calculates real prices and returns, subsets for the investment horizon of interest,
and ensures interactivity.

#### 6. How "returns" are defined?

- Total returns, i.e. price appreciation plus dividend reinvestment, are used for SP500.
Coupon income plus face vale repayment is used for 1 year government bonds. Inflation adjustment is applied when necessary.

#### 7. Is this app reproducible?

- Yes, it is fully reproducible. The code for running this app can be found at https://github.com/sbushmanov/shiny

