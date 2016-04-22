# Project Title: Sports stats

### Statement 
Our project will take any two teams in the NHL and try to predict who will win when they play together. The project will pull stats from website www.hockeyanalysis.com and organize them into objects for each of the 30 teams in the league. We will then compare these stats to generate a number representing the probability of victory for each team. It will also give a breakdown about how we arrived at these numbers.

### Analysis
Some of the ideas from class that we plan on implementing into our project include recursion and Higher Order procedures such as map/filter/reduce.

We plan on using recursion by recovering the information from a gigantic statistics table and reorganizing them. There is a website with data on certain sports team that we plan on using for the data analysis. Since extracting all of the information at once is somewhat complex, we plan on using recursion to extract small bits at a time until the whole table has been obtained. Later on, we will also be using recursion with implementing the predictions part since those require some sort of statistical analysis.

Higher Order procedures will be used in our project in only the predictions and analysis part. Certain pieces of information such as outlier data can be removed from the list by using filter. As another example, the map function can be used to perform a certain statistical equation on certain categories of information such as winning and losing streaks.

### Data set or other source materials 
The data will be pulled from http://stats.hockeyanalysis.com/teamstats.php?disp=1&db=201516&sit=5v5&sort=PDO&sortdir=DESC. It will be pulled using the net library.


### Deliverable and Demonstration

At the end of the project people should be able to pick any two teams and have them be compared. The program will run on data from http://stats.hockeyanalysis.com/ but the regexes could be modified to pull from multiple sources.

The live demo can be interactive, allowing users to selet any team.


### Evaluation of Results
We will know that the program is working if the a very good team will have a high chance of victory against and a bad team or if the probability of victory matches up with the standings.

## Architecture Diagram

![alt tag](https://github.com/oplS16projects/Sports-Stats-David-and-Connor/blob/master/architecture_diagram.png)

First Connor will extract all of the information from the website containing the giant spreadsheet of numbers in certain categories. While this may sound simple, it has actually been rather difficult and will take some extra effort. Then he will reorganize it into specific ways for David to make his statistical analysis on. Once all of the data has been reorganized, David will proceed to do all of the mathematical calculations that will be used to predict future outcomes and results. In addition, he will make comparisons between the teams and how they are all performing relative to each other. Finally, Connor and David will both be making changes to the code along the way simultaneously to debug any errors.

## Schedule


Sunday April 10: Establish most important statistics to pull from website, weight, etc. First draft of forumla. [DONE]

Wednesday April 13: Have code to pull stats from website. [DONE]

Friday April 15: Have those stats organized into a data structure [DONE]

Monday April 18: Apply those stats to the forumla. The formula may need revising at this point [DONE]

Wednesday April 20: Have all files need to pull from for GUI (team logos, etc.)

Friday April 22: Finalize Forumla, start to put GUI together.

Sunday April 24: Finalize GUI

### First Milestone (Fri Apr 15)
For the first milestone we should have pulled the data from the website and organize it into team data structures.

Milestone 1 Update: We have pulled data from the site and organized it according to schedule. David worked out a formula that will be implemented in the final project.

### Second Milestone (Fri Apr 22)
For the second milestone we should have pulled from the numbers from the objects and applied them to a formula. We start to create a GUI for the program. 

Milestone 2 Update: We have used the data we pull from milestone 1 and applied it to the formula we devoloped. The we started work on the GUI as per schedule
### Final Presentation (last week of semester)
During our last week in the semester, we will be going through and knocking out all of the smallest bugs within our code that may exist. By then, we should have already dealt with all of the really major defects within our code. All that should be left is to remove discrepancies with edge cases and outliers. Also, we will try to come up with final questions that should be responded to when doing our project presentations in the hallway.

## Group Responsibilities

### David Bui @buidavid16
will write the code during the statistical analysis and predictions part of the project. He will figure out the formulas and provide mathematical analysis on how the extracted information can be used in certain ways. In addition, David will also assist Connor with figuring out any problems with the code on how to extract all of the numbers from the data table for various teams.

### Connor McLaughlin @CJMcLaughlin
I will extract the stats from the website using Regex statements and organize it into a data structure. I will also assist in picking the most important statistics to devolope the formula. I will then work on the GUI for the end of the program.
