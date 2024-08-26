SELECT 
   count( job_id) AS count_job,
    EXTRACT(MONTH from job_posted_date) AS month_extract
FROM job_postings_fact
WHERE job_title_short ='Data Analyst'
GROUP BY month_extract
order by count_job;

