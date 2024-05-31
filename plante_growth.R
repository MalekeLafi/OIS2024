# Charger les bibliothèques
library(ggplot2)
library(dplyr)

# Simuler des données pour l'expérience scientifique
set.seed(123)  # Pour la reproductibilité

# Nombre de plantes dans chaque groupe
n <- 100

# Hauteurs des plantes en cm (distribution normale)
height_control <- rnorm(n, mean = 50, sd = 10)  # Groupe témoin
height_treated <- rnorm(n, mean = 55, sd = 10)  # Groupe traité

# Créer un data frame
data <- data.frame(
  group = rep(c("Control", "Treated"), each = n),
  height = c(height_control, height_treated)
)

# Créer la visualisation
p <- ggplot(data, aes(x = group, y = height, fill = group)) +
  geom_violin(trim = FALSE, alpha = 0.5) +  # Graphique de distribution
  geom_boxplot(width = 0.2, position = position_dodge(0.9)) +  # Boxplots
  labs(
    title = "Effect of Treatment on Plant Growth",
    x = "Group",
    y = "Height (cm)"
  ) +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_fill_manual(values = c("Control" = "skyblue", "Treated" = "salmon"))

# Sauvegarder la visualisation
ggsave("plant_growth_visualization.png", plot = p)

# Afficher la visualisation
print(p)
