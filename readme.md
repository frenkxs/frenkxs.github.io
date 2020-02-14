# Data Visualization: Olympic disciplines and gender
Premysl Velek 

## Summary
The data visualisation explores the history and development of olympic disciplines from the gender perspective. It looks at the numbers and proportions of women's and men's disciplines at summer olympics games from the very begining until the most recent Olympic games in Rio de Janeiro in 2016.
There are four sections - the first two focus on the total number of olympic disciplines by gender, the third section presents gender-exclusive disciplines, the last section explores disciplines open to both genders.

## Design - explain any design choices you made including changes to the visualization after collecting feedback

### Data
The bulk of the data comes from the Guardians' Data Blog ([Olympic medal winners: every one since 1896 as open data](https://www.theguardian.com/sport/datablog/2012/jun/25/olympic-medal-winner-list-data)) This dataset contains information about every discipline in the summer olympics since 1896 until 2008. I completed the data by manually compiling information about the number of disciplines in the 2012 and 2016 games, using wikipedia ( [London](https://en.wikipedia.org/wiki/2012_Summer_Olympics), [Rio](https://en.wikipedia.org/wiki/2016_Summer_Olympics)) .

I used R to explore and clean the dataset. The data wrangling and data exploration is documented in data-wrangling/data-wrangling.R.

### Design
When plotting the preliminary charts to see the proportion of men's and women's disciplines, I found several interesting trends that I wanted to focus on:

1. There has been a steady growth of women's disciplines, both in absolute numbers and in proportion to men's disciplines
2. The growth differed significantly when comparing individual sports
3. There are still relatively many gender-exclusive disciplines, although their number have been declining over the last 50-60 years
4. There are very few disciplines where men and women compete together, and they have been - for the most part - dominated by men

As there were four 'stories' I wanted to tell, I structured my visualisation into a sequence of four sections. Each of the sections shows one (or more) chart, conveying one primary and several secondary findings. Each of the sections is also complemented by a short introduction to 'sets the stage' for the data.

Sections 1 and 3 both show different statistics per Olympic games and gender, so a grouped bar chart was ideal to convey the results. Bar charts are easy to understand and very good for showing trends over time. The major feature of Section 2 is comparison of different sports. I experimented with different bar charts and area charts; in the end I picked area chart with incremental changes for each edition of Olympic games. In my view, this type of chart best represents the different 'shapes' of the trend lines.

For Section 4, I choose a combination of scatter plot and pie chart as it has one additional dimension. Besides year (x-axis) and discipline (y-axis), it also shows the number of gold medalists per year and disciplines (the size of the pies) and their gender proportion (pie segments).

Colour is used consistently throughout the visualisation to code for gender (red for female, black for male).



### Resources
- [Dimple library examples](http://dimplejs.org/examples_index.html)
- [Dimple.js API documentation](https://github.com/PMSI-AlignAlytics/dimple/wiki)
- [Udacity discussion forum](https://discussions.udacity.com/t/dimple-pie-chart/200048)
- [Smooth Vertical or Horizontal Page Scrolling with jQuery](https://tympanus.net/codrops/2010/06/02/smooth-vertical-or-horizontal-page-scrolling-with-jquery/)
