-- Drop the schema if it exists and create a new one
DROP DATABASE IF EXISTS baby_names_db;
CREATE DATABASE baby_names_db;

-- Table structure for `names`
CREATE TABLE names (
  state CHAR(2),
  gender CHAR(1),
  year INT,
  name VARCHAR(45),
  births INT
);

-- Table structure for `regions`
CREATE TABLE regions (
  state CHAR(2) PRIMARY KEY,
  region VARCHAR(45)
);

ALTER TABLE "names" ADD FOREIGN KEY ("state") REFERENCES "regions" ("state");

alter table "names" drop constraint names_state_fkey1;

INSERT INTO public.regions (state, region) VALUES
('AL', 'South'),
('AK', 'Pacific'),
('AZ', 'Mountain'),
('AR', 'South'),
('CA', 'Pacific'),
('CO', 'Mountain'),
('CT', 'New_England'),
('DC', 'Mid_Atlantic'),
('DE', 'South'),
('FL', 'South'),
('GA', 'South'),
('HI', 'Pacific'),
('ID', 'Mountain'),
('IL', 'Midwest'),
('IN', 'Midwest'),
('IA', 'Midwest'),
('KS', 'Midwest'),
('KY', 'South'),
('LA', 'South'),
('ME', 'New_England'),
('MD', 'South'),
('MA', 'New_England'),
('MN', 'Midwest'),
('MS', 'South'),
('MO', 'Midwest'),
('MT', 'Mountain'),
('NE', 'Midwest'),
('NV', 'Mountain'),
('NH', 'New_England'),
('NJ', 'Mid_Atlantic'),
('NM', 'Mountain'),
('NY', 'Mid_Atlantic'),
('NC', 'South'),
('ND', 'Midwest'),
('OH', 'Midwest'),
('OK', 'South'),
('OR', 'Pacific'),
('PA', 'Mid_Atlantic'),
('RI', 'New_England'),
('SC', 'South'),
('SD', 'Midwest'),
('TN', 'South'),
('TX', 'South'),
('UT', 'Mountain'),
('VT', 'New_England'),
('VA', 'South'),
('WA', 'Pacific'),
('WV', 'South'),
('WI', 'Midwest'),
('WY', 'Mountain');

insert into regions(state,region)
values ('MI','North');

('WY', 'M', 2009, 'River', 5),
('WY', 'M', 2009, 'Talon', 5),
('WY', 'M', 2009, 'Tate', 5),
('WY', 'M', 2009, 'Timothy', 5),
('WY', 'M', 2009, 'Xavier', 5);


---Question 1
---10 top popular names
select name,
sum(births) AS total_count
from names
group by name
order by total_count DESC
limit 10;
__ANSWER
___MICHAEL       1382856
___CHRISTOPHER   1122213
___MATTHEW       1034494
___JOSHUA         960170
___JESSICA        865046
___DANIEL         824208
___DAVID          819479
___ASHLEY         792865
___JAMES          766789
___ANDREW         761824


--Question 2
--NUMBER OF MALE AND FEMALE NAMES
SELECT GENDER, COUNT(*)
from names
group by gender;

--ANSWER
--we have 1245104 females and 967257 males


-- Question 3
--STATES WITH HIGHEST NUMBER OF NAMES
select state, count(*) AS names_count
from names
group by state
order by names_count DESC
LIMIT 5;

--ANSWER
--CA  178427
--TX  136850
--NY  119020
--FL   92823
--IL   88340

--Question 4
--SHOW TOTAL GENDER EVERY YEAR
SELECT YEAR,GENDER, COUNT(*) AS TOTAL
FROM NAMES
GROUP BY YEAR, GENDER
ORDER BY YEAR, GENDER;

--ANSWER
--1980  F  34552
--1980  M  25021
--1981  F  34504
--1981  M  24880
--1982  F  34714
--1982  M  25172
--1983  F  33712
--1983  M  24676
--1984  F  34078
--1984  M  24858
--1985  F  35015
--1985  M  25537
--1986  F  35316
--1986  M  25884
--1987  F  35713
--1987  M  26430
--1988  F  36786
--1988  M  27430
--1989  F  38026
--1989  M  29003
--1990  F  39336
--1990  M  29809
--1991  F  39641
--1991  M  30110
--1992  F  40135
--1992  M  30749
--1993  F  39757
--1993  M  31010
--1994  F  39903
--1994  M  31475
--1995  F  39842
--1995  M  31622
--1996  F  40327
--1996  M  32010
--1997  F  40912
--1997  M  32795
--1998  F  42293
--1998  M  33747
--1999  F  43048
--1999  M  34320
--2000  F  44568
--2000  M  35430
--2001  F  45267
--2001  M  35816
--2002  F  45603
--2002  M  36379
--2003  F  47020
--2003  M  37313
--2004  F  48101
--2004  M  38346
--2005  F  49208
--2005  M  39306
--2006  F  50868
--2006  M  40962
--2007  F  52260
--2007  M  42113
--2008  F  52589
--2008  M  42415
--2009  F  52010
--2009  M  42639