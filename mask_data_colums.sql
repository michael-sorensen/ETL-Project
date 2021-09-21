CREATE TABLE april (

"State" VARCHAR,
"Month" VARCHAR,
Primary Key ("State", "Month"),
"adh_APRavg" dec,
"tot_cases_Apr" int,
"case_rate_Apr" dec,
"Wk_case_rate_Apr" dec,
"strictAprPol" int,
"maskAPR75" int,
"MaskAprPol" int,
"Wk_AprHI" int
);






CREATE TABLE may (
"State" VARCHAR,
"Month" VARCHAR,
Primary Key ("State", "Month"),
"adh_MAYavg" dec,
"tot_cases_May" int,
"case_rate_May" dec,
"Wk_case_rate_May" dec,
"strictMayPol" int,
"maskMAY75" int,
"MaskMayPol" int,
"Wk_MayHI" int
);

CREATE TABLE june (
"State" VARCHAR,
"Month" VARCHAR,
Primary Key ("State", "Month"),
"adh_JUNEavg" dec,
"tot_cases_Jun" int,
"case_rate_Jun" dec,
"Wk_case_rate_Jun" dec,
"strictJunPol" int,
"maskGT75" int,
"MaskJunPol" int,
"Wk_JunHI" int
);

CREATE TABLE july (
"State" VARCHAR,
"Month" VARCHAR,
Primary Key ("State", "Month"),
"adh_JULavg" dec,
"tot_Cases_Jul" int,
"case_rate_Jul" dec,
"Wk_case_rate_Jul" dec,
"strictJulPol" int,
"maskJUL75" int,
"MaskJulPol" int,
"Wk_JulHI" int
);

CREATE TABLE august (
"State" VARCHAR,
"Month" VARCHAR, 
Primary Key ("State", "Month"),
"adh_AUGavg" dec,
"tot_cases_Aug" int,
"case_rate_Aug" dec,
"Wk_case_rate_Aug" dec,
"strictAugPol" int,
"maskAUG75" int,
"MaskAugPol" int,
"Wk_AugHI" int
);

CREATE TABLE september (
"State" VARCHAR,
"Month" VARCHAR,
Primary Key ("State", "Month"),	
"AdhSEPavg" dec,
"tot_cases_Sep" int,
"case_rate_Sep" dec,
"Wk_case_rate_Sep" dec,
"strictSepPol" int,
"maskSEP75" int,
"MaskSepPol" int,
"Wk_SepHI" int
);

CREATE TABLE october (
"State" VARCHAR,
"Month" VARCHAR,
Primary Key ("State", "Month"),
"adh_OCTavg" dec,
"tot_cases_Oct" int,
"case_rate_Oct" dec,
"Wk_case_rate_Oct" dec,
"strictOctpol" int,
"maskOCT75" int,
"maskOctPol" int,
"Wk_OctHI" int
);


CREATE TABLE tweets (
"Unnamed: 0" VARCHAR,
"tweet.id" VARCHAR,
"tweet.date" date,
"content" text,
"tweet.username" varchar,
"user.location" varchar,
"user.id" varchar,
"month" varchar,
"state" varchar,
"Month" varchar,
Primary Key ("state", "Month"),
"Positive" dec,
"Negative" dec,
"Neutral" dec,
"Compound" dec
);

