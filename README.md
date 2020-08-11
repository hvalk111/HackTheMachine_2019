# Team 5 - Jumbos

## Team Contact Info
- Rachel Rotteveel, rachelrotteveel2@gmail.com, Etsy, US Citizen
- Colby Wilkinson, wilkinson.colby@gmail.com, NUWC, US Citizen
- Poornima Haridas, haridaspoornima@gmail.com, Student, not a US Citizen
- Jay Luther, james.m.luther@gmail.com, Engineer at NUWC Newport, US Citizen
- John Pomerat, sperek27@gmail.com, Student, US Citizen
- Henry Valk, henry.valk@nyu.edu, NYU, US Citizen
- Radhika Nikam, radhika23594@gmail.com, Student, not a US Citizen
- David Rubenstein, david.p.rubenstein@gmail.com, NUWC NPT, US Citizen
- Mayukh Ghosh, mayukhghosh9@gmail.com, Student, not a US Citizen

Our solutions to both challenges were created using data representation and processing techniques. We interpreted data in Pandas with Matplotlib, Tableau, Matlab, statistical techniques including regression and decision trees, and spreadsheet manipulation with excel.

## Presentation
You can access our presentation at: https://docs.google.com/presentation/d/1Lob0HOQgdJbPE2XbFj7oJOWUUJxwDhi3gmMu7HvgAXQ/edit?usp=sharing

## Challenge 1

Our approach was centered around labeling the 13 aircraft with wiring issues. To find these, we examined fluctuations in MSP readings over time for each aircraft, looked at cumulative wiring issues present on each aircraft controlled for time, considered a time series analysis on the number of wiring inspections performed, and investigated time series data of wiring related malfunction codes. Each of these methods produced a series of aircraft and intersecting the results of the methods yielded 13 clear aircraft.

## Challenge 2

### Compiling Data
We first compiled a dataset of the corrective actions (by job code) that pertained to corrosion by filtering whether the job included a flag for 'corrosion', 'bare metal' or 'corrosion prevention'.  Next we combined the maintenance data to the MSP code data on aircraft and the year of the job/error codes.  We then moved error codes that didn't occur within the window: 30 days prior the received data and 30 days after the completion date.  Error codes inside the maintenance window were removed to excluded error codes that were due to replicating the issue.  We used this dataset to estimate the frequency of MSP codes before and after the maintenance action that targeted some aspect of corrosion.  We then focused on the 20 codes that had the largest decrease in frequency after a corrosion corrective action.

Then we created a separate dataset of non-corrosive maintenance actions, and estimated the frequency of the 20 MSP codes of interest prior to the corrective action.  The dataset was constructed in the same way as the corrosion corrective actions.  The corrosion and non-corrosion maintenance actions were then combined to one data set: 20 features representing the frequency of the MSP codes on interest in the 30 days prior to the maintenance action, and a T/F variable that indicated whether the action was for corrosion.   

### Training the Models
We then trained four models to predict whether a corrosion corrective action was needed based on the MSP frequency: Penalized Logistic Regression, Random Forest, XGBoost, and Support Vector Machines.  Model performance on a variety of metrics varied, but overall Random Forest performed best (75% accuracy).  

### Future Work
Future work should focus on the construction of the dataset (we took a random sample of maintenance actions to ease computational burden), selection of relevant MSP codes, model selection and hyper parameter tuning, and generalizing this approach to predict other categories of maintenance actions.

