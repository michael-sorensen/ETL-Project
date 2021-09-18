CREATE TABLE april (

State VARCHAR,
Month date,
adh_APRavg dec,
tot_cases_Apr int,
strictAprPol int,
maskAPR75 int,
Wk_case_rate_Apr dec,
MaskAprPol int,
Wk_AprHI int,
case_rate_Apr dec,
);






CREATE TABLE may (
State VARCHAR,
Month date,
tot_cases_May int,
case_rate_May dec,
Wk_case_rate_May dec,
Wk_MayHI int,
adh_MAYavg dec,
MaskMayPol int,
maskMAY75 int,
strictAugPol int,
);


CREATE TABLE june (
State VARCHAR,
Month date,
adh_JUNEavg dec,
tot_cases_Jun int,
case_rate_Jun dec,
MaskJunPol int,
Wk_case_rate_Jun dec,
Wk_JunHI int,
maskGT75 int,
strictJunPol int,
);

CREATE TABLE july (
State VARCHAR,
Month date,
adh_JULavg dec,
tot_Cases_Jul int,
case_rate_Jul dec,
MaskJulPol int,
Wk_case_rate_Jul dec,
Wk_JulHI int,
maskJUL75 int,
strictJulPol int,
);

CREATE TABLE august (
State VARCHAR,
Month date, 
adh_AUGavg dec,
tot_cases_Aug int,
case_rate_Aug dec,
MaskAugPol int,
Wk_case_rate_Aug dec,
Wk_AugHI int,
maskAUG75 int,
strictAugPol int,
);

CREATE TABLE september (
State VARCHAR,
Month date,
AdhSEPavg dec,
tot_cases_Sep int,
case_rate_Sep dec,
MaskSepPol int,
Wk_case_rate_Sep dec,
Wk_SepHI int,
maskSEP75 int,
strictSepPol int,
);

CREATE TABLE october (
State VARCHAR,
Month date,
tot_cases_Oct int,
case_rate_Oct dec,
Wk_case_rate_Oct dec,
Wk_OctHI int,
strictOctPol int,
maskOCT75 int,
maskOctPol int,
adh_OCTavg dec,
);