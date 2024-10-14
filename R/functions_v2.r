# This function shows the relationship between bill length and bill depth with a scatterplot.
# The function expects 2 arguments to target a specific species.

# plot function
create_scatterplot <- function(data, selected_species, color) {
  # Filter the data for the specified species
  filtered_data <- data %>%
    na.omit() %>%
    filter(species == selected_species)
  
  # Create the scatterplot
  plot <- ggplot(
    filtered_data,
    aes(x = bill_length_mm, y = bill_depth_mm)
  ) +
    geom_point(color=color) +
    labs(
      x = "Bill Length (mm)",
      y = "Bill Depth (mm)",
      title = selected_species
    ) +
    theme(legend.position = "none")
  
  return(plot)
}