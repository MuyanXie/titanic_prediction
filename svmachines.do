#delimit;    /* make it so the semicolon signals end of each line 
                    because we can't see where the return is  */     
set more 1;  /* makes it so stata does not stop at each screen of output */
drop _all ;  /* clear all the variables in memory, if any */
capture log close; /* close any open log files */
cd "C:\Users\Muyan Xie\Desktop\titanic prediction";
use final_merged_titanic;
sum;


local split = floor(_N*891/1309);
local train = "1/`=`split'-1'";
local test = "`split'/`=_N'";
replace Fare = 16.1 if Fare == .;
svmachines Survived Pclass Age SibSp Parch Fare Sex_1 Ticket_1 Cabin_1 Embarked_1, verbose;


predict P in `test';

save results_titanic_2.dta, replace;

#delimit cr