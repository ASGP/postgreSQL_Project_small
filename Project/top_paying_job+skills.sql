WITH top_pay_jobs AS (
    SELECT job_id,
        job_location,
        job_title,
        job_country,
        salary_year_avg,
        job_posted_date::DATE,
        job_schedule_type,
        name AS comapny_name
    FROM job_postings_fact p
        LEFT JOIN company_dim ON p.company_id = company_dim.company_id
    WHERE job_title_short IN('Data Analyst', 'Data Scientist')
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
)

SELECT 
    top_pay_jobs.*,
    skills_dim.skills
FROM top_pay_jobs
INNER JOIN skills_job_dim ON top_pay_jobs.job_id=skills_job_dim.job_id
INNER JOin skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id;

--get high paying jobs with skills for the job