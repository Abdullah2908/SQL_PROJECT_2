
        ---project 2-------

-- question 1:  Select all columns from the database
-- Display only the first ten rows

select top(10)* from schools_modified

-----qn 2:-- Count rows with percent_tested missing and total number of schools

select count(*)-count(percent_tested) as percent_tested_missing,count(*) as total_school from schools_modified

--qn 3:-- Count the number of unique building_code values
select count(distinct building_code) as no_of_unique_building_code from schools_modified


---qn 4:-- Select school and average_math
-- Filter for average_math 640 or higher
-- Display from largest to smallest average_math

select school_name,average_math from schools_modified
where average_math>=640
order by average_math desc 


---qn 5:-- Find lowest average_reading


select top(1)* from schools_modified
where 1=1
order by average_reading asc

--qn 6:-- Find the top score for average_writing
-- Group the results by school
-- Sort by max_writing in descending order
-- Reduce output to one school


select top(1)school_name,average_writing as max_writing from schools_modified
order by max_writing desc


-- qn 7:-- Calculate average_sat
-- Group by school_name
-- Sort by average_sat in descending order
-- Display the top ten results

select top(10)school_name,sum(average_math+average_reading+average_writing) as average_sat  from schools_modified
group by school_name
order by average_sat desc

-- qn 8: -- Select borough and a count of all schools, aliased as num_schools
-- Calculate the sum of average_math, average_reading, and average_writing, divided by a count of all schools, aliased as average_borough_sat
-- Organize results by borough
-- Display by average_borough_sat in descending order

select borough ,count(school_name)  as num_schools,sum(average_math+average_reading+average_writing)/count(school_name) as 
average_borough_sat from schools_modified
group by borough
order by average_borough_sat desc 

--qn 9:-- Select school and average_math
-- Filter for schools in Brooklyn
-- Aggregate on school_name
-- Display results from highest average_math and restrict output to five rows

select top(5)school_name,average_math from schools_modified
where borough='brooklyn'
group by school_name,average_math
order by average_math desc






