# Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project
### Author: Omar Hamza
### Date: 11th July 2024
Hi. For this project, I've selected the Bellabeat case study, focusing on analyzing user behaviours with their smart health fitness trackers. My goal is to analyse smart device usage data to gain insight into how consumers use non-Bellabeat smart devices. To achieve this, I'll follow a structured data analysis process: Ask, Prepare, Process, Analyze, Share, and Act. This approach will ensure that our findings are not only insightful but also actionable, contributing to Bellabeat's growth in the competitive smart device market.

## Role Overview and Objectives
As a junior data analyst within Bellabeat's marketing analytics team, my primary focus is to analyze consumer usage patterns of one of Bellabeat’s smart devices. By delving into smart device data, I aim to uncover valuable insights into how consumers interact with these devices. These insights are pivotal in shaping Bellabeat’s marketing strategy, enhancing our market positioning in the global smart device industry.
## Project Scope and Approach

My task involves conducting a detailed analysis of consumer behaviour surrounding Bellabeat’s smart device. This entails examining data related to activity, sleep, stress, menstrual cycles, and mindfulness habits as captured by the Bellabeat app. Through systematic data analysis, I will identify usage trends, patterns, and preferences among our users.
Deliverables and Impact

Upon completion of the analysis, I will present my findings and high-level recommendations to Bellabeat's executive team. These insights will inform strategic decisions aimed at optimizing product offerings and enhancing consumer engagement. Ultimately, our goal is to strengthen Bellabeat’s market presence and competitiveness in the global arena of smart devices.
By leveraging data-driven insights, I am committed to providing actionable recommendations that align with Bellabeat’s mission to empower women through innovative health-focused technologies. This project represents an exciting opportunity to contribute to Bellabeat’s growth trajectory and reinforce our commitment to enhancing women's health and wellness globally.

# Ask

### Business Task: 

Analyze smart device usage data to gain insights into consumer habits and apply these insights to a Bellabeat product to guide marketing strategy.
### Key Stakeholders:
* Urška Sršen, Co-founder and Chief Creative Officer
* Sando Mur, Co-founder and key executive team member
* Bellabeat marketing analytics team
  
# Prepare

The dataset used in this analysis was compiled from responses to a survey distributed via Amazon Mechanical Turk between March 12, 2016, and May 12, 2016. It includes data from thirty eligible Fitbit users who consented to share their personal tracker data. This dataset provides minute-level details on physical activity, heart rate, and sleep monitoring.
The datasets I will be using are found [here](https://www.kaggle.com/datasets/arashnic/fitbit).

This Kaggle data set contains personal fitness tracker from thirty Fitbit users. These eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. It includes information about daily activity, steps, and heart rate that can be used to explore users’ habits. The datasets [licenced](https://creativecommons.org/publicdomain/zero/1.0/) by CC0: Public Domain, dataset made available through Mobius.

I also will be using external sources to measure the variable as standard, such as healthy steps for adults, healthy weight for adults etc.
There are 18 total datasets from which I will choose the needed datasets for my analysis.

![dataset](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/1.dataset.png)

# Process
For this analysis I will be using Microsoft Excel for cleaning and organizing data, Microsoft SQL server for analysing the findings and Tableau and Microsoft Power BI for creating visualization.

I have chosen daily activity, merged hourly calories, hourly intensities and hourly calories in Excel and named it hourly activities because they have the same rows and it is ordered by similar Id. Also, I chose Sleep Day to analyze sleeping patterns and Weight’s log info to analyze wright distribution patterns.

For cleaning data I used Microsoft Excel to find errors and duplicates. 
In daily activities I have found 114 results of 0 steps and excluded it because being active with 0 steps does not make sense.
I have also add day column to find the day for the log and I have used =TEXT(B2,”dddd”) formula to add day in the daily activity and in sleep day file.

![day_in_excel](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/2%20day.png)

Then I filtered the data to find missing values. In Weight log info most of the values in the fat column are null so I will not be using that column.
At last, I have chosen these data sets for my analysis
* Daily_activity
*	Hourly_activity
*	Sleep_day
*	Weight_log_info

# Analyze
For my analysis, I will be using Microsoft SQL server. I have loaded all the datasets in the database. I also changed all the columns to lowercase for easy using the SQL code.
![Loading in SQL](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/3.SQL%20load.png)

Now I am going to start analysing the data.

* Finding average steps based on days 
```sql
select days, AVG(total_steps) as average_steps
from daily_activity
group by days
order by 
case
when days = 'Sunday' then 1
when days = 'Monday' then 2  
when days = 'Tuesday' then 3  
when days = 'Wednesday' then 4
when days = 'Thursday' then 5
when days = 'Friday' then 6
when days = 'Saturday' then 7
     END
```

* Finding average steps per hour
![4.2](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/4.%20average%20steps%20by%20hour.png)

* I have found that the average steps for 35 users throughout the time of the data was 7283.43. I have decided to measure each user’s average steps into an ideal steps category based on the [National Library of Medicine](https://pubmed.ncbi.nlm.nih.gov/14715035/).

![5](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/5.ave%20steps%20catagory.png)
* Calculating total steps vs total calories burned based on user.

![6](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/6.%20total%20steps%20vs%20total%20calories.png)

* Finding users using the Fitbit app in days.

![7](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/7.%20Users%20using%20app%20in%20days.png)

* I have decided to categorize the usage by user into High, Moderate and Low use.

![8](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/8.Calagorising%20%20user%20using%20in%20days.png)

* Average calories burned per day.

![9](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/9.%20Average%20calories%20burned%20per%20day.png)

* Active minutes category based on id

![10](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/10.%20average%20minutes%20catagory%20in%20id.png)

* Heart rate based on user
![11](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/11.%20Heart%20rate%20based%20on%20catagory.png)

* To show weight categories based on different users, firstly I executed the last logged date to find the last weight per user and saved the table as the last logged weight.

![12](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/12.Weight_distrribution%20part%201.png)

Then I saved the table as the last logged weight. Then used that table to calculate the weight category based on BMI based on  [Centers for Disease Control and Prevention](https://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/).

![13](https://github.com/omarhamza1996/Case-Study-How-Can-a-WellnessTechnology-Company-Play-It-Smart-Google-data-analytics-capstone-project/blob/main/Pictures/13.%20Weight_distribution%20part%202.png)

# Share
After analyzing the data, I am going to share the insights which I have found during the analysis. The charts were generated in Microsoft Powe BI and Tabelue.
* Average steps based on days
![14]()





















































  






































