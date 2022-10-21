#delimit;    /* make it so the semicolon signals end of each line 
                    because we can't see where the return is  */     
set more 1;  /* makes it so stata does not stop at each screen of output */
drop _all ;  /* clear all the variables in memory, if any */
capture log close; /* close any open log files */

cd "C:\Users\Muyan Xie\Desktop\titanic prediction";
use train_titanic_1;

encode Sex, gen(Sex_1);
encode Ticket, gen(Ticket_1);
encode Cabin, gen(Cabin_1);
encode Embarked, gen(Embarked_1);
drop Sex Ticket Cabin Embarked;
replace Embarked_1 = 1 if Embarked_1 == .;
sum;


save processed_train.dta, replace;
clear;

use train_titanic_1;

encode Sex, gen(Sex_1);
encode Ticket, gen(Ticket_1);
encode Cabin, gen(Cabin_1);
encode Embarked, gen(Embarked_1);
drop Sex Ticket Cabin Embarked;
replace Embarked_1 = 1 if Embarked_1 == .;
sum;
gen Survived = 1;

save processed_test.dta, replace;
clear;

use processed_train;
append using processed_test;

save final_merged_titanic.dta, replace;

#delimit cr