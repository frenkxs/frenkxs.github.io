library(reshape2)
library(dplyr)
library(ggplot2)
library(tidyr)

medals <- read.csv2('MEDALISTS.csv', sep = ',', stringsAsFactors = FALSE, fileEncoding= "UTF-8")
events_12_16 <- read.csv2('events2012-16.csv', sep = ',', stringsAsFactors = FALSE, fileEncoding= "UTF-8")

medals <- rbind(medals, events_12_16)

sixteen <- medals[2, ]
sixteen[1, ] <- NA
sixteen[1, 2] <- 1916

forty <- medals[2, ]
forty[1, ] <- NA
forty[1, 2] <- 1940

fortyfour <- medals[2, ]
fortyfour[1, ] <- NA
fortyfour[1, 2] <- 1944

medals <- rbind(medals, sixteen, forty, fortyfour)
medals[] <- lapply(medals, tolower)
medals[] <- lapply(medals, factor)
medals <- medals[complete.cases(medals), ]

# the gold medalist was missing as the original winner (Marion Jones) was suspended 
# after admitting to doping. The gold medal remained unassigned. To keep the discipline in
# the list of all discipline, I assigned gold medal to the silver medalist. (Since we are not 
# interested in individual athletes this won't affect the results.)
medals[medals$Athlete == 'thanou, ekaterini', 'Medal'] <- 'gold'

# total number of sporting events by edition and gender START 
all <- medals[medals$Medal == 'gold',  ]

total <- all %>%
  group_by(Edition, Event, Event_gender) %>%
  summarise(
    c = n()
  )

total <- total %>%
  group_by(Edition, Event_gender) %>%
    summarise(
      c = n()
  )

total$Discipline <- as.factor('total')
total <- total[, c(1, 4, 2, 3)]

# number of sporting event by edition, discipline and gender
disciplines <- all %>%
  group_by(Edition, Discipline, Event, Event_gender) %>%
  summarise(
    c = n()
  )

disciplines <- disciplines %>%
  group_by(Edition, Discipline, Event_gender) %>%
  summarise(
    c = n()
  )

# merge total and disciplines together
disciplines <- rbind(disciplines, total)

# rename the factor levels for esy reading
levels(disciplines$Event_gender)[1] <- 'men'
levels(disciplines$Event_gender)[2] <- 'women'
levels(disciplines$Event_gender)[3] <- 'open/mixed'

# export
write.table(disciplines, "disciplines.tsv", sep="\t", row.names = F)

##### total number of sporting events by edition and gender END

##### plot in r to check the results 
ggplot(data = disciplines, aes(x = Edition, fill = Event_gender)) +
  geom_bar(position = 'dodge')
  
# it seems we don't need this function anymore !! Thank you for your service !
disciplines <- function(discipline) {
  filtered <- medals[medals$Discipline == discipline & medals$Medal == 'Gold',  ]
  
  number_disciplines <- filtered %>%
    group_by(Edition, Event, Event_gender) %>%
    summarise(
      c = n()
    )
  number_disciplines <- number_disciplines %>%
    group_by(Edition, Event_gender) %>%
    summarise(
      c = n()
    )
  
  editions <- c(1916, 1940, 1944)
  gender <- c('M', 'M', 'M')
  c <- c(0, 0, 0)
  
  missing_years <- data.frame(Edition = editions, Event_gender = gender, c = c)
  number_disciplines <- rbind(number_disciplines, missing_years)
  number_disciplines <- arrange(number_disciplines, Edition)
  
  name <- sprintf("%s.tsv", discipline)
  name <- tolower(name)
  
  ggplot() +
    geom_bar(data = number_disciplines, aes(x = Edition, fill = Event_gender), 
             colour = 'grey', position = 'dodge', width = 2) +
    #     geom_bar(data = best, aes(x = Edition, y = medals, fill = Event_gender), 
    #              stat = 'identity', colour = 'black', position = 'dodge', width = 2) +
    scale_fill_brewer(type = "seq", palette = 1)
  
  write.table(number_disciplines, name, sep="\t", row.names = F)
}

disciplines('Athletics')
disciplines('Swimming')
disciplines('Weightlifting')
disciplines('Artistic G.')
disciplines('Rhythmic G.')
disciplines('Rowing')
disciplines('Cycling Track')
disciplines('Shooting')

  plot <- ggplot() +
    geom_bar(data = number_diciplines, aes(x = Edition, fill = Event_gender), 
             colour = 'grey', position = 'dodge', width = 2) +
#     geom_bar(data = best, aes(x = Edition, y = medals, fill = Event_gender), 
#              stat = 'identity', colour = 'black', position = 'dodge', width = 2) +
    scale_fill_brewer(type = "seq", palette = 1)


# number of mixed or open events
g <- medals[medals$Event_gender == 'x' & medals$Medal == 'gold',  ]

open <- g %>%
  group_by(Edition, Sport, Gender) %>%
  summarise(
    c = n()
  )

editions <- c(1916, 1940, 1944)
gender <- c('men', 'men', 'men')
sport <- c(NA, NA, NA)
c <- c(0, 0, 0)

missing_years <- data.frame(Edition = editions, Sport = sport, Gender = gender, c = c)
open <- rbind(open, missing_years)
open <- arrange(open, Edition)

write.table(open, "open.tsv", sep="\t", row.names = F)


plot_2 <- ggplot() +
  geom_bar(data = open, aes(x = Edition), 
           colour = 'grey', width = 2)

# floating bar chart - mixed disciplines
ggplot(data = g, aes(x = Edition, y = Sport)) +
  stat_sum(aes(colour = Gender), geom="point", 
           position = position_dodge(width = 1), alpha = 0.7) +
  scale_size(range = c(4, 24)) +
  # scale_x_continuous(breaks = seq(1896, 2016, 4))
  
             geom_point(aes(colour = Sport), size = 5) +
  





write.table(number_diciplines, "athletics10.tsv", sep="\t")

best <- g %>% 
  group_by(Edition, Event_gender, Athlete) %>%
  summarise(
    medals = n()
  ) %>%
  slice(which.max(medals))
  
ggplot() +
  geom_bar(data = number_diciplines, aes(x = Edition, fill = Event_gender), 
           position = 'dodge', colour = 'grey', width = 2) +
  geom_bar(data = best, aes(x = Edition, y = medals, fill = Event_gender), 
           stat = 'identity', colour = 'black', position = 'dodge', width = 2) +
  scale_fill_brewer(type = "seq", palette = 4)

filtered <- medals[medals$Discipline == "Athletics" & medals$Medal == 'Gold',  ]

number_disciplines <- filtered %>%
  group_by(Edition, Event, Event_gender) %>%
  summarise(
    c = n()
)

b <- number_disciplines %>%
  group_by(Edition, Event_gender) %>%
  summarise(
    c = n()
  )



# number of disciplines open for men or women only

######## START ################
exclusives <- medals[medals$Medal == 'gold', c('Edition', 'Discipline', 'Event', 'Event_gender')]

# all the disciplines where athletes compete in particular weight categories
# are counted as 1 in calculating the number of exclusive male or female disciplines.
# The weight categories differ for men and women for obvious reasons, but this doesn't
# mean that the weight categories are completely exclusive disciplines 
# (in the sense that decathlon or baseball are).
kg <- grep("kg", exclusives$Event)

exclusives$Event <- factor(exclusives$Event, levels = c(levels(exclusives$Event), "category"))

exclusives$Event[kg] <- factor("category")

# casting the dataframe into wide format
exclusives <- dcast(exclusives, Edition + Discipline + Event ~ Event_gender)

exclusives$m[exclusives$m > 1] <- 1
exclusives$w[exclusives$w > 1] <- 1

############ control plots ############

ggplot() +
        geom_bar(data = exclusives[exclusives$Discipline == "athletics" & exclusives$w == 0, ],
                 aes(x = Edition)) +
        geom_bar(data = exclusives[exclusives$Discipline == "athletics" & exclusives$m == 0, ],
           aes(x = Edition), fill = 'red')

ggplot() +
  geom_bar(data = exclusives[exclusives$w == 0 & exclusives$x == 0, ],
           aes(x = Edition)) +
  geom_bar(data = exclusives[exclusives$m == 0 & exclusives$x == 0, ],
           aes(x = Edition), fill = 'red')

############ control plots ############

exclusives$Gender <- NA

# male exlusives
exclusives$Gender[exclusives$w == 0 & exclusives$x == 0] <- "men"

# female exlusives
exclusives$Gender[exclusives$m == 0 & exclusives$x == 0] <- "women"

# remove non-exclusives
exclusives <- exclusives[complete.cases(exclusives), ]


exclusives_count <- exclusives %>%
  group_by(Edition, Gender) %>%
  summarise(
    c = n()
  )

war_years <- exclusives_count[c(2:4), ]
war_years$Edition <- c(1916, 1940, 1944)
war_years$Gender <- "M"
war_years$c <- 0

exclusives_count <- rbind(exclusives_count, war_years)

# final dataset to export into tsv
write.table(exclusives_count, "exclusives.tsv", sep="\t", row.names = F)

############# EXCLUSIVES - END #################








ggplot(data = exclusives_count) +
  geom_bar(aes(x = Edition, y = c, fill = Gender), stat = 'identity', position = 'dodge')


ggplot(data = exclusives) +
  geom_bar(aes(x = Edition, fill = gender), position = 'dodge')

medals <- lapply(medals, tolower)

############ control plots ############

ggplot() +
  geom_bar(data = number_disciplines, aes(x = Edition, fill = Event_gender), 
           colour = 'grey', position = 'dodge', width = 2) +
  #     geom_bar(data = best, aes(x = Edition, y = medals, fill = Event_gender), 
  #              stat = 'identity', colour = 'black', position = 'dodge', width = 2) +
  scale_fill_brewer(type = "seq", palette = 1)

exclusives <- exclusives %>%
  group_by(Edition, Event, Event_gender) %>%
  summarise(c = n()
  )

############ control plots ############

f <- melt(f, Event_gender)