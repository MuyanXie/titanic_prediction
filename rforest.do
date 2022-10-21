#delimit;    /* make it so the semicolon signals end of each line 
                    because we can't see where the return is  */     
set more 1;  /* makes it so stata does not stop at each screen of output */
drop _all ;  /* clear all the variables in memory, if any */
capture log close; /* close any open log files */

cd "C:\Users\Muyan Xie\Desktop\titanic prediction";
use final_merged_titanic;
sum;


rforest Survived Pclass Age SibSp Parch Fare Sex_1 Ticket_1 Cabin_1 Embarked_1 in 1/891, type(class) iter(500);

ereturn list;


predict P in 892/1309;



list P in 892/897;

ereturn list;

save results_titanic_1.dta, replace;

#delimit cr