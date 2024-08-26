---identify high paying jobs
SELECT job_id,
    job_location,
    job_title,
    job_country,
    salary_year_avg,
    job_posted_date::DATE,
    job_schedule_type,
    name AS comapny_name
FROM job_postings_fact p
LEFT JOIN company_dim ON p.company_id=company_dim.company_id
WHERE job_title_short IN('Data Analyst', 'Data Scientist')
AND job_location = 'Anywhere'
ORDER BY salary_year_avg ;

SELECT job_id,
    job_location,
    job_title,
    job_country,
    salary_year_avg,
    job_posted_date::DATE,
    job_schedule_type
FROM job_postings_fact 
WHERE job_location = 'Sri Lanka';

SELECT
    count(*)
FROM job_postings_fact
WHERE job_title_short IN('Data Analyst', 'Data Scientist')
AND job_location = 'Anywhere';



--NO job_title_short = data analyst or data scientist with job loaction remote
--No job_title_short = data analyst or data scientist with INternships in COUNTRY SRI LANKA
---Only 20 such jobs posted in location =SRI LANKA for above jobs
---27865 jobs for location = Anywhere
----75 all jobs posted with job loaction = Sri lanka