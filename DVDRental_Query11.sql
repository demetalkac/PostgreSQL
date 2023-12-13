CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

--By using SERIAL ids will be auto-assigned to each row

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL

)

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)

INSERT INTO account (username, password, email, created_on) VALUES ('Jose', 'password', 'jose@mail.com', CURRENT_TIMESTAMP);
INSERT INTO job (job_name) VALUES ('Astronaut');
INSERT INTO job(job_name) VALUES ('President');
INSERT INTO account_job(user_id, job_id, hire_date) VALUES (1,1,CURRENT_TIMESTAMP);
INSERT INTO account_job(user_id, job_id, hire_date) VALUES (10,10,CURRENT_TIMESTAMP); -- Gives error because it does not exist in the parent table(foreign key)

SELECT * FROM account;
SELECT * FROM job;
SELECT * FROM account_job;

--UPDATE
-- 1. UPDATE AND SET A NEW VALUE
UPDATE account
SET last_login = CURRENT_TIMESTAMP;

-- 2. UPDATE AND SET A VALUE OF ANOTHER COLUMN
UPDATE account
SET last_login = created_on;

-- 3. UPDATE BY USING 2 TABLES
UPDATE account_job
SET hire_date = account.created_on
FROM account 
WHERE account_job.user_id = account.user_id;

UPDATE account 
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login;













