install.packages("usethis")
usethis::use_git_config(user.name = "Fizza Sattar")
usethis::create_github_token()
gitcreds::gitcreds_set()

squirrel <- read.csv("squirrel-data.csv")

library(gtsummary)
tbl_summary(squirrel,
						by = 'Park.Name',
						include = c('Primary.Fur.Color', 'Activities',
												'Interactions.With.Humans')
						)
