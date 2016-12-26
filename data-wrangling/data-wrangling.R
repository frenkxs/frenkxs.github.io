# Data wrangling to prepare the data set for the visualisation

library(reshape2)
library(dplyr)
library(ggplot2)
library(tidyr)

# Complete and update dataset with data from the latest two olympic games (2012 nd 2016)
medals <- read.csv2('MEDALISTS.csv', sep = ',', stringsAsFactors = FALSE, fileEncoding= "UTF-8")
events_12_16 <- read.csv2('events2012-16.csv', sep = ',', stringsAsFactors = FALSE, fileEncoding= "UTF-8")

medals <- rbind(medals, events_12_16)

medals[] <- lapply(medals, tolower)
medals[] <- lapply(medals, factor)
medals <- medals[complete.cases(medals), ]

# The origninal dataset was missing a gold medalist in womens' 100 m sprint. - The original winner 
# (Marion Jones) was suspended after admitting to doping and the gold medal remained unassigned (See more at: 
# http://www.telegraph.co.uk/sport/othersports/athletics/6772973/IOC-withholds-Marion-Jones-Sydney-100m-gold-from-Katerina-Thanou.html.) 
# To keep the discipline in the list of all discipline, I added one more line to indicate the gold was unassigned.
# (Since we are not interested in individual athletes this won't affect the results.)
medals[medals$Athlete == 'unassigned, unassigned', 'Medal'] <- 'gold'



##### START total number of sporting events by edition, gender and sport START #########
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

# rename the factor levels for easy reading
levels(disciplines$Event_gender)[1] <- 'men'
levels(disciplines$Event_gender)[2] <- 'women'
levels(disciplines$Event_gender)[3] <- 'open/mixed'

############ control plots ############

ggplot(data = disciplines, aes(x = Edition, fill = Event_gender)) +
  geom_bar(position = 'dodge') +
  scale_fill_brewer(type = "seq", palette = 1)

############ control plots ############

# export into tsv
write.table(disciplines, "disciplines.tsv", sep="\t", row.names = F)

##### END total number of sporting events by edition, gender and sport END #########



##### START number of mixed or open events START #####
g <- medals[medals$Event_gender == 'x' & medals$Medal == 'gold',  ]

open <- g %>%
  group_by(Edition, Sport, Gender) %>%
  summarise(
    c = n()
  )

############ control plots ############

ggplot(data = g, aes(x = Edition, y = Sport)) +
  stat_sum(aes(colour = Gender), geom="point", 
           position = position_dodge(width = 1), alpha = 0.7) +
  scale_size(range = c(4, 24))
  
############ control plots ############

# export into tsv
write.table(open, "open.tsv", sep="\t", row.names = F)

##### END number of mixed or open events END #####

  
#####  START  number of disciplines open for men or women only  START #####    
exclusives <- medals[medals$Medal == 'gold', c('Edition', 'Discipline', 'Event', 'Event_gender')]

# All the disciplines where athletes compete in particular weight categories
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
  geom_bar(data = exclusives[exclusives$w == 0 & exclusives$x == 0, ],
           aes(x = Edition)) +
  geom_bar(data = exclusives[exclusives$m == 0 & exclusives$x == 0, ],
           aes(x = Edition), fill = 'red')

############ control plots ############


# add gender column
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

############ control plots ############

ggplot(data = exclusives_count) +
  geom_bar(aes(x = Edition, y = c, fill = Gender), stat = 'identity', position = 'dodge')

############ control plots ############

# final dataset to export into tsv
write.table(exclusives_count, "exclusives.tsv", sep="\t", row.names = F)

#####  END  number of disciplines open for men or women only  END #####    

