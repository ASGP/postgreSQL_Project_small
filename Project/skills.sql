---In demand skills to job

SELECT 
    skills,
    count(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOin skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim  ON skills_job_dim.skill_id=skills_dim.skill_id
where job_title_short IN ('Data Analyst','Data Science') AND job_location = 'Anywhere'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 12;

