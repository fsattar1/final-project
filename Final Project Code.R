install.packages("usethis")
usethis::use_git_config(user.name = "Fizza Sattar")
usethis::create_github_token()
gitcreds::gitcreds_set()

squirrel <- read.csv("squirrel-data.csv")

library(gtsummary)
tbl_summary(squirrel,
						by = 'Area.Name',
						include = c(Primary.Fur.Color, Activities,
												Interactions.with.Humans)
						)

tbl_uvregression(squirrel,
								 x = 'Park.ID',
								 include = c(Park.ID, Above.Ground..Height.in.Feet.,
								 						Squirrel.Latitude..DD.DDDDDD.,
								 						Squirrel.Longitude...DD.DDDDDD.),
								 method = lm,
								 missing = "ml.x")

colnames(squirrel)

linear_model <- lm(Park.ID ~ Above.Ground..Height.in.Feet. +
									 Squirrel.Latitude..DD.DDDDDD. +
									 Squirrel.Longitude...DD.DDDDDD.,
									 data = squirrel)

tbl_regression(linear_model, intercept = TRUE,
							 label = list(
							 	Above.Ground..Height.in.Feet. ~ "Feet above ground",
							 	Squirrel.Latitude..DD.DDDDDD. ~ "Squirrel latitude",
							 	Squirrel.Longitude...DD.DDDDDD. ~ "Squirrel longitude"
							 ))


tbl_regression(squirrel,
								 x = 'Park.Name',
								 y = c('Primary.Fur.Color', 'Activities',
								 'Interactions.with.Humans'),
								 method = glm)





hist(squirrel$Squirrel.Latitude..DD.DDDDDD.)



#EPI 590R Final Project - Alone data set - Survivalists

install.packages("alone")

survivalists <- here
colnames(survivalists)

#1 - Table 1
library(gtsummary)
tbl_summary(survivalists,
						by = gender,
						include = c(age, days_lasted,
												result)
)

#2 - Regression table
tbl_uvregression(survivalists,
								 x = gender,
								 include = c(age, days_lasted, result),
								 label = list(
								 	age ~ "Age",
								 	days_lasted ~ "Days Lasted",
								 	result ~ "Result"),
								 method = lm)

#3 - Figure
hist(survivalists$days_lasted)

#4 - Function
mean(survivalists$age)
new_mean <- function(x) {
	n <- length(survivalists$age)
	x <- sum(survivalists$age)
	mean_val <- x/n
	return(mean_val)
}

#9 - here package
install.packages("here")
?here

#10 - renv package
install.packages("renv")
renv::init()
install.packages("other_package")
install.packages("github_user/github_package")
renv::snapshot()

#12 - README file
??readme



