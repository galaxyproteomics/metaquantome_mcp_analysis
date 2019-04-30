---
title: "Mock Microbial Comparison Results"
author: "Caleb Easterly"
date: "October 30, 2018"
output: html_document
---


```r
knitr::opts_chunk$set(echo=FALSE, message=FALSE, warning=FALSE)
```

# Get True Results
The true protein amounts were expanded with metaQuantome. 


# Estimate Intensity With Summarization



# Estimate Intensity with metaQuantome






### Scale the dataframe

The true abundances and the estimated abundances are all on different scales, so I use `scale` to ensure they all have a mean of 0 and an standard deviation of 1.



### Mean of Squared Errors

Now that I've scaled the result, I calculate the average distance from the true abundances. I use average because there is a different number of non-missing intensities for spectral counts and precursor intensities.

Intensity:


Original Intensity:


<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> analysis </th>
   <th style="text-align:right;"> ntaxa </th>
   <th style="text-align:left;"> mse </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> metaquantome </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> 0.64039640517965 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> lca (intensity) </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:left;"> 0.953673214076277 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> true </td>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> - </td>
  </tr>
</tbody>
</table>


<!-- ### Plotting -->

<!-- ```{r} -->
<!-- library(ggplot2) -->
<!-- ms1 <- "Precursor Intensity" -->
<!-- spec <- "Spectral Counting" -->
<!-- lca_sum <- "Sum on LCA" -->
<!-- ggplot(scaled) + -->
<!-- 	geom_point(aes(x = true_abund, y = int_abund, col = ms1)) + -->
<!-- 	geom_point(aes(x = true_abund, y = mq_sc_abund, col=spec)) + -->
<!-- 	geom_abline(intercept = 0, slope = 1) + -->
<!-- 	geom_smooth(aes(x = true_abund, y = int_abund, col = ms1), method = "lm", se=FALSE) + -->
<!-- 	geom_smooth(aes(x = true_abund, y = mq_sc_abund, col = spec), method = "lm", se=FALSE) + -->
<!-- 	geom_smooth(aes(x = true_abund, y = lca_sum_abund, col = lca_sum), method = "lm", se=FALSE) + -->
<!-- 	theme_bw() + -->
<!-- 	labs(x = "Scaled True Abundance", y = "Scaled Estimated Abundance") -->
<!-- ``` -->
