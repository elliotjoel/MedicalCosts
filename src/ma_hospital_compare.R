temp <- Medicare.Provider.Charge.Inpatient.DRG100.FY2011[Medicare.Provider.Charge.Inpatient.DRG100.FY2011$Provider.State == 'MA',]
temp <- temp[temp$pct <= 1,]

medians <- temp[, list(median.pct = median(pct)), by = list(Provider.Name)]
medians <- medians[order(medians$median.pct),]

ggplot(temp, aes(factor(Provider.Name, levels=medians$Provider.Name), pct)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))