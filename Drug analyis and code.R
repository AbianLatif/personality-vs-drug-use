install.packages("dplyr")
install.packages("tidyverse")
library(dplyr)
library(tidyverse)

Drug_Consumption_Q_filtered <- Drug_Consumption_Q %>% +
select(Nscore, Escore, Oscore, AScore, Cscore, Impulsive, SS, Cannabis)

Drug_Consumption_Q_filtered <- Drug_Consumption_Q %>%
  + select(Nscore, Escore, Oscore, AScore, Cscore, Impulsive, SS, Cannabis)

head(Drug_Consumption_Q_filtered)

Drug_Consumption_Q_drugs <- Drug_Consumption_Q %>%
  +     select(Cannabis, Ecstasy, Coke, LSD, Mushrooms, Nicotine)

Drug_Consumption_Q_filtered <- Drug_Consumption_Q %>%
  +     select(Nscore, Escore, Oscore, AScore, Cscore, Impulsive, SS,
               +            Cannabis, Ecstasy, Coke, LSD, Mushrooms, Nicotine) %>%
  +     mutate(Cannabis_binary = ifelse(Cannabis == "CL0", 0, 1),
               +         Ecstasy_binary = ifelse(Ecstasy == "CL0", 0, 1),
               +         Coke_binary = ifelse(Coke == "CL0", 0, 1),
               +         LSD_binary = ifelse(LSD == "CL0", 0, 1),
               +         Mushrooms_binary = ifelse(Mushrooms == "CL0", 0, 1),
               +         Nicotine_binary = ifelse(Nicotine == "CL0", 0, 1))

> head(Drug_Consumption_Q_filtered)
Nscore   Escore   Oscore   AScore   Cscore Impulsive       SS Cannabis Ecstasy Coke
1 -0.67825  1.93886  1.43533  0.76096 -0.14277  -0.71126 -0.21575      CL4     CL4  CL3
2 -0.46725  0.80523 -0.84732 -1.62090 -1.01450  -1.37983  0.40148      CL3     CL0  CL0
3 -0.14882 -0.80615 -0.01928  0.59042  0.58489  -1.37983 -1.18084      CL2     CL0  CL2
4  0.73545 -1.63340 -0.45174 -0.30172  1.30612  -0.21712 -0.21575      CL3     CL1  CL0
5 -0.67825 -0.30033 -1.55521  2.03972  1.63088  -1.37983 -1.54858      CL0     CL0  CL0
6 -0.46725 -1.09207 -0.45174 -0.30172  0.93949  -0.21712  0.07987      CL1     CL0  CL0
LSD Mushrooms Nicotine Cannabis_binary Ecstasy_binary Coke_binary LSD_binary
1 CL2       CL0      CL4               1              1           1          1
2 CL0       CL1      CL0               1              0           0          0
3 CL0       CL0      CL2               1              0           1          0
4 CL0       CL2      CL2               1              1           0          0
5 CL0       CL0      CL6               0              0           0          0
6 CL0       CL0      CL6               1              0           0          0
Mushrooms_binary Nicotine_binary
1                0               1
2                1               0
3                0               1
4                1               1
5                0               1
6                0               1
> Drug_Consumption_Q_filtered <- Drug_Consumption_Q_filtered %>%
  +     mutate(AnyDrugUser = ifelse(Cannabis_binary + Ecstasy_binary + Coke_binary + LSD_binary + Mushrooms_binary + Nicotine_binary > 0, 1, 0))
> 
  > users <- Drug_Consumption_Q_filtered %>% filter(AnyDrugUser == 1)
> non_users <- Drug_Consumption_Q_filtered %>% filter(AnyDrugUser == 0)
> 
  > mean(users$Nscore)
[1] 0.02706406
> mean(non_users$Nscore)
[1] -0.1794429
> 
  > #this means that non users have a below average neuroticism which is saying they more emotionally stable and calm where as a larger neuroticism means more prone to anxiety, mood swings and worrying
  > t.test(users$Nscore, non_users$Nscore)

Welch Two Sample t-test

data:  users$Nscore and non_users$Nscore
t = 3.2029, df = 339.08, p-value = 0.001489
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  0.07968709 0.33332677
sample estimates:
  mean of x   mean of y 
0.02706406 -0.17944286 

> 
  > # p-value = 0.001489 which less than 0.5 so this data is significant
  > 
  > # Define the list of traits to analyze
  > traits <- c("Nscore", "Escore", "Oscore", "AScore", "Cscore", "Impulsive", "SS")
> 
  > # Loop through each trait
  > for (trait in traits) {
    +     cat("===== Trait:", trait, "=====\n")
    +     
      +     # Calculate group means
      +     mean_users <- mean(users[[trait]], na.rm = TRUE)
      +     mean_non_users <- mean(non_users[[trait]], na.rm = TRUE)
      +     
        +     # Run t-test
        +     test_result <- t.test(users[[trait]], non_users[[trait]])
        +     
          +     # Print results
          +     cat("Mean (Users):", round(mean_users, 3), "\n")
        +     cat("Mean (Non-Users):", round(mean_non_users, 3), "\n")
        +     cat("p-value:", round(test_result$p.value, 4), "\n")
        +     cat("95% CI:", round(test_result$conf.int[1], 3), "to", round(test_result$conf.int[2], 3), "\n\n")
        + }
===== Trait: Nscore =====
  Mean (Users): 0.027 
Mean (Non-Users): -0.179 
p-value: 0.0015 
95% CI: 0.08 to 0.333 

===== Trait: Escore =====
  Mean (Users): -0.009 
Mean (Non-Users): 0.058 
p-value: 0.2941 
95% CI: -0.19 to 0.058 

===== Trait: Oscore =====
  Mean (Users): 0.076 
Mean (Non-Users): -0.502 
p-value: 0 
95% CI: 0.464 to 0.692 

===== Trait: AScore =====
  Mean (Users): -0.054 
Mean (Non-Users): 0.36 
p-value: 0 
95% CI: -0.542 to -0.287 

===== Trait: Cscore =====
  Mean (Users): -0.08 
Mean (Non-Users): 0.522 
p-value: 0 
95% CI: -0.719 to -0.484 

===== Trait: Impulsive =====
  Mean (Users): 0.086 
Mean (Non-Users): -0.512 
p-value: 0 
95% CI: 0.481 to 0.716 

===== Trait: SS =====
  Mean (Users): 0.101 
Mean (Non-Users): -0.687 
p-value: 0 
95% CI: 0.676 to 0.9 

> 
  > #all but e score is relvent due to p score values
  > # Calculate group means
  > library(dplyr)
> traits <- c("Nscore", "Escore", "Oscore", "AScore", "Cscore", "Impulsive", "SS")
> 
  > group_means <- Drug_Consumption_Q_filtered %>%
  +     group_by(AnyDrugUser) %>%
  +     summarise(across(all_of(traits), mean, na.rm = TRUE)) %>%
  +     pivot_longer(-AnyDrugUser, names_to = "Trait", values_to = "Mean")
> 
  > # Calculate group means
  > library(dplyr)
> traits <- c("Nscore", "Escore", "Oscore", "AScore", "Cscore", "Impulsive", "SS")
> 
  > group_means <- Drug_Consumption_Q_filtered %>%
  +     group_by(AnyDrugUser) %>%
  +     summarise(across(all_of(traits), mean, na.rm = TRUE)) %>%
  +     pivot_longer(-AnyDrugUser, names_to = "Trait", values_to = "Mean")
Warning message:
  There was 1 warning in `summarise()`.
ℹ In argument: `across(all_of(traits), mean, na.rm = TRUE)`.
ℹ In group 1: `AnyDrugUser = 0`.
Caused by warning:
  ! The `...` argument of `across()` is deprecated as of dplyr 1.1.0.
Supply arguments directly to `.fns` through an anonymous function instead.

# Previously
across(a:b, mean, na.rm = TRUE)

# Now
across(a:b, \(x) mean(x, na.rm = TRUE))
This warning is displayed once every 8 hours.
Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated. 
> 
  > # Label group names
  > group_means$Group <- ifelse(group_means$AnyDrugUser == 1, "User", "Non-User")
> 
  > # Plot
  > ggplot(group_means, aes(x = Trait, y = Mean, fill = Group)) +
  +     geom_bar(stat = "identity", position = "dodge") +
  +     labs(title = "Average Personality Trait Scores by Drug Use",
             +          x = "Personality Trait", y = "Mean Score") +
  +     scale_fill_manual(values = c("skyblue", "salmon")) +
  +     theme_minimal()

  > # Calculate group means
  > library(dplyr)
> traits <- c("Nscore", "Escore", "Oscore", "AScore", "Cscore", "Impulsive", "SS")
> 
  > group_means <- Drug_Consumption_Q_filtered %>%
  +     group_by(AnyDrugUser) %>%
  +     summarise(across(all_of(traits), mean, na.rm = TRUE)) %>%
  +     pivot_longer(-AnyDrugUser, names_to = "Trait", values_to = "Mean")

# Previously
across(a:b, mean, na.rm = TRUE)

# Now
across(a:b, \(x) mean(x, na.rm = TRUE))
This warning is displayed once every 8 hours.
Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated. 
> 
  > # Label group names
  > group_means$Group <- ifelse(group_means$AnyDrugUser == 1, "User", "Non-User")
> 
  > # Plot
  > ggplot(group_means, aes(x = Trait, y = Mean, fill = Group)) +
  +     geom_bar(stat = "identity", position = "dodge") +
  +     labs(title = "Average Personality Trait Scores by Drug Use",
             +          x = "Personality Trait", y = "Mean Score") +
  +     scale_fill_manual(values = c("skyblue", "salmon")) +
  +     theme_minimal()
> 
  > save.image("~/Downloads/First R-project Drugs.RData")
> 

