# Data Visualization: Olympic disciplines and gender
Premysl Velek | Udacity Data Visualisation Project

## Summary
The data visualisation explores the history and development of olympic disciplines from the gender perspective. It looks at the number and proportion of women's and men's disciplines at summer olympics games from the very begining until the most recent Olympic games in Rio de Janeiro in 2016.
There are four sections - the first two focus on the total number of olympic disciplines by gender, the third section presents gender-exclusive disciplines, and finaly the fourth section explores disciplines open to both genders.

## Design - explain any design choices you made including changes to the visualization after collecting feedback

### Data
The bulk of the data comes from the Guardians' Data Blog ([Olympic medal winners: every one since 1896 as open data](https://www.theguardian.com/sport/datablog/2012/jun/25/olympic-medal-winner-list-data)) This dataset contains information about every discipline in the summer olympics since 1896 until 2008. I completed the data by manually compiling information for the 2012 and 2016 games, using wikipedia entries on the [London](https://en.wikipedia.org/wiki/2012_Summer_Olympics) and [Rio](https://en.wikipedia.org/wiki/2016_Summer_Olympics) olympics.

I used R to explore the dataset and prepare it for dimple. The data wrangling and data exploration is documented in data-wrangling/data-wrangling.R.

### Design
When plotting preliminary charts showing the proportion of men's and women's disciplines, I found several interesting trends that I wanted to focus on in the visualisation:

1. There has been a steady growth of women's disciplines, both in absolute numbers and in proportion to men's disciplines.
2. The growth differed significantly when comparing individual sports
3. There are still relatively many gender-exclusive disciplines, although their number have been declining over the last 50-60 years.
4. There are very few disciplines where men and women compete together, and they have been - for the most part - dominated by men.

As there were four 'stories' I wanted to tell, I structured my visualisation into a sequence of four sections. Each of the section shows one (or more) chart that conveys one main (see above) and several secondary findings. Each of the sections is also complemented by a short introduction that 'sets the stage' for the chart(s).

Sections 1 and 3 both show different statistics per Olympic games and gender, so a grouped bar chart was ideal to convey the results. Bar charts are easy to understand and very good for showing trends over time. The major feature of Section 2 is comparison of different sports; I experimented with different bar charts, area charts and others and in the end picked area chart with incremental changes for each edition of Olympic games. In my view this type of chart best represents the different 'shapes' of the trend lines.

For Section 4 I choose a combination of scatter plot and pie chart. The main reason is that it can convey the data in one more dimension, besides year (x-axis) and discipline (y-axis), it also shows the number of gold medalists per year and disciplines (the size of the pies) and their gender proportion (pie segments).

Colour is used consistently throughout the visualisation to code gender (red for female, black for male). Red - the accent colour of the palette - codes for the 'main characters of the story', the female disciplines and female athletes. The palette thus visually highlights the main messages of the visualisation.

### Feedback
I collected feedback through Udacity discussion fora (2), and through participant observation (1). I reproduce feedback 1 and 2 in full below:

**Feedback 1:** *Wow, this is great visualization! The storyline is clear and engaging, the graphics are beautiful, the chart types suitable! How can I find out things to improve on though*

*Fix spelling and grammatical errors such as "The the first female athletes...", "another sport have seen..." etc.
For the 3rd tab, maybe you can consider using a stacked area chart1? It's very good right now, but just for the sake of variety...
Keep up the great work!*

**Feedback 2:** *Thank your for sharing your work! This is a compelling visualization, with a clear overall message. I hadn't realized the major changes in the gender composition of Olympic events until I saw this visualization. I like the multiple panels and enjoyed the narrative in each panel, this is a very effective way to communicate findings. I do have a few comments to help enhance the explanatory nature of the visualization and facilitate the reader's understanding. I break this down by panel:

  1. A bar chart is a good design choice. To help the reader absorb the information for each year when scanning from left to right,, it may be worth considering a stacked bar plot2

  2. There are clear differences in growth amongst groupings. Keeping in mind that I haven't had enough coffee this morning, :slight_smile: it did take me a few minutes to determine the meaning of the x-axis. It might be worth expanding the narrative a little to more clearly explain these plots and their meaning.

  3. My comments here are the same as 1.

  4. This panel is not as clear to me. I do think the plot supports the findings communicated in the narrative. I'm just wondering if there might be a more effective way to present this data. I'll give it some thought and post if I come up with anything. @georgeliu1998 [PV: aka feedback no 1] may have some ideas as well. One thing the viewer may wonder is what the circle areas represent.

On a technical note, the visualization is well rendered and working quite well except for one thing. When scrolling down each panel tile remains static, and ends up obscuring the narrative.*


Source: [Udacity discussion forum](https://discussions.udacity.com/t/feedback-on-visualisation-on-olympics-and-gender/202752/1)

**Feedback 3** was collected through observing one user viewing and interacting with the visualisation:
 - The navigation is not clear (it was not obvious from the landing page that there are four parts of the visualisation)
 - Section 4 hard to understand and digest, no 'guidelines' provided
 - The narrative was too short and didn't relate directly to the data

### Second iteration
Based on the feeback, I made a couple of changes to the visualisation (though the main storyline stayed the same):

1. I changed the narrative so it now refers more directly to the charts and corrected the typos
2. I added a help text to explain what's going on in the charts
3. I fixed the heading obscuring the narrative
4. I added colour to the navigation to indicate the current position and make the navigation stand out
5. I removed the 'mixed' category in the chart no.1 to make the male and female categories stand out.
6. I was experimenting with the different chart types for sections 1 and 3. Although stacked bar chart (as suggested in feedback 1 and 2) was easier to absorb by the user and visually more appealing, it also concealed absolute differences between categories (in this case male, female and mixed). Another possibility was to use 100 % bar plot which did a good job in showing the changing proportion of male and female disciplines over time, but hid the change in absolute numbers. In the end, I returned to the original version of grouped bar charts.

### Resources
- [Dimple library examples](http://dimplejs.org/examples_index.html)
- [Dimple.js API documentation](https://github.com/PMSI-AlignAlytics/dimple/wiki)
- [Smooth Vertical or Horizontal Page Scrolling with jQuery](https://tympanus.net/codrops/2010/06/02/smooth-vertical-or-horizontal-page-scrolling-with-jquery/)
