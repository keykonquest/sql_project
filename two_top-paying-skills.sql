/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_ten_jobs AS (
    SELECT
        job_id,
        company_dim.name,
        job_title,
        job_schedule_type,
        salary_year_avg,
        job_posted_date
    FROM 
        job_postings_fact,
        company_dim
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_ten_jobs.job_id,
    top_ten_jobs.name,
    top_ten_jobs.job_title,
    skills_dim.skills,
    top_ten_jobs.job_schedule_type,
    top_ten_jobs.salary_year_avg,
    top_ten_jobs.job_posted_date
FROM
    top_ten_jobs,
    skills_dim
ORDER BY name