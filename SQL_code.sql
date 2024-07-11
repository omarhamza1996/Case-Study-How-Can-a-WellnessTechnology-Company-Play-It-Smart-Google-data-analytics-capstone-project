--1 Finding average steps based on days

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

--2. finding average steps taken per hour

select cast(activity_hour as time) as activity_time, avg(step_total) as average_steps
from hourly_activity
group by cast(activity_hour as time)
order by cast(activity_hour as time)


--3. calculating average steps vs calories

select id,round(avg(total_steps),0) as total_steps,round(avg(calories),0) total_calories from daily_activity
group by id

--4. Usage of the app by days 

select activity_date, count( distinct(id)) as usage_by_day
from daily_activity
group by activity_date

--5. User used the app in days

select id, count(id) as user_used,
case
when count(id) between 0 and 20 then 'Low'
when count(id) between 21 and 40 then 'Moderate'
when count(id) > 40 then 'High'
     END as usage_catagory
from daily_activity
group by id

--6. Average calories burned per day

select days, round(avg(calories),2) Average_calories_burned
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

--7. Active category based on user by steps  reference (https://pubmed.ncbi.nlm.nih.gov/14715035/)

select id ,avg(total_steps) as average_steps, 
case 
when avg(total_steps) < 5000 then 'Sedentary lifestyle'
when avg(total_steps) between 5000 and 7499 then 'Low active'
when avg(total_steps) between 7500 and 9999 then 'Somewhat active'
when avg(total_steps) between 10000 and 12500 then 'Active'
when avg(total_steps) > 12500 then 'Highly active'
end as steps_catagory
from daily_activity
group by id



--8. Active minutes category based on id 

select id, round(avg(very_active_minutes),3) as average_very_active_minutes,round(avg(fairly_active_minutes),2)as average_fairly_active_minutes,
round(avg(lightly_active_minutes),2) as average_lightly_active_minutes,round(avg(sedentary_minutes),2) as average_sedentary_minutes
from daily_activity
group by id


--9.Active minutes catagory based on days 

select days, round(avg(very_active_minutes),2) as average_very_active_minutes,round(avg(fairly_active_minutes),2)as average_fairly_active_minutes,
round(avg(lightly_active_minutes),2) as average_lightly_active_minutes,round(avg(sedentary_minutes),2) as average_sedentary_minutes
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


--10. Average total intensity by hour

select cast(activity_hour as time) , round(avg(total_intensity),2) as average_intensity from hourly_activity

group by cast(activity_hour as time)

--11. Total miutes of slep by day and total time in bed

select day as Day,sum(total_minutes_asleep) as Total_time_in_asleep,sum(total_time_in_bed) as Total_time_in_bed
from sleep_day
group by day 
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

--12. Heart rate based on different users

select Id,round(avg(Value),2) as average_heart_rate,
case 
when round(avg(Value),2) < 60 then 'Low'
when round(avg(Value),2) between 60 and 100 then 'Normal'
when round(avg(Value),2) > 100 then 'High' 
end as Heart_rate_catagory
from heart_rate
group by Id

/*13. Weight catagory based on different user
I executed the last loged date to find the last weight per user and saved the table as last logged weight */

WITH MaxDatePerId AS (
    SELECT Id, MAX(Date) AS MaxDate
    FROM weightLogInfo
    GROUP BY Id
)

-- Joining with the original table to get the entire row

SELECT wli.*
FROM weightLogInfo wli
INNER JOIN MaxDatePerId mdpi ON wli.Id = mdpi.Id AND wli.Date = mdpi.MaxDate


Then I calculated the weight catagory based on BMI based on https://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html

select id,
case 
when BMI < 18.5 then 'Underweight'
when BMI between 18.5 and 24.9 then 'Healthy weight'
when BMI between 25.0 and 29.9 then 'Over weight'
when BMI > 30 then 'Obesity'
end as Weight_catagory

from last_logged_weight

