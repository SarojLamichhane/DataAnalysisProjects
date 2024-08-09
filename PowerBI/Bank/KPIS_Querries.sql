#1. Total loan applications
SELECT COUNT(id) AS Total_Application
FROM financial_loan;
#ANS- 38576

SELECT COUNT(id) AS Total_Application FROM financial_loan
WHERE MONTH(issue_date) = 12 AND year(issue_date)= 2021;
#4314



SELECT COUNT(id) AS Total_Application FROM financial_loan
WHERE MONTH(issue_date) = 11 AND year(issue_date)= 2021;
#4035

#2 Total funded amount
SELECT SUM(loan_amount) AS Total_Loan_Amount
FROM financial_loan;
#435757075

SELECT SUM(loan_amount) AS Total_Loan_Amount
FROM financial_loan 
WHERE MONTH(issue_date)= 12 AND year(issue_date)= 2021;
#53981425

SELECT SUM(loan_amount) AS Total_Loan_Amount
FROM financial_loan 
WHERE MONTH(issue_date)= 11 AND year(issue_date)= 2021;
#47754825

#3 Total Amount Received
SELECT SUM(total_payment) AS Total_Loan_Received
FROM financial_loan ;
#473070933

SELECT SUM(total_payment) AS Total_Loan_Amount
FROM financial_loan 
WHERE MONTH(issue_date)= 12 AND year(issue_date)= 2021;
#58074380

SELECT SUM(total_payment) AS Total_Loan_Amount
FROM financial_loan 
WHERE MONTH(issue_date)= 11 AND year(issue_date)= 2021;
#50132030

#4. AVERGE INTEREST RATE
SELECT ROUND(AVG(int_rate)*100, 2) AS AVERAGE_INTEREST_RATE
FROM financial_loan;
#12.05

SELECT ROUND(AVG(int_rate)*100, 2) AS AVERAGE_INTEREST_RATE
FROM financial_loan
WHERE MONTH(issue_date)= 12 AND year(issue_date)= 2021;
#12.36


SELECT ROUND(AVG(int_rate)*100, 2) AS AVERAGE_INTEREST_RATE
FROM financial_loan
WHERE MONTH(issue_date)= 11 AND year(issue_date)= 2021;
#11.95

#5 Debt to income ratio
SELECT ROUND(avg(dti)*100,2) AS AVERAGE_DEBT
FROM financial_loan;
#13.33

SELECT ROUND(avg(dti)*100,2) AS AVERAGE_DEBT
FROM financial_loan
WHERE MONTH(issue_date)= 12 AND year(issue_date)= 2021;
#13.67

SELECT ROUND(avg(dti)*100,2) AS AVERAGE_DEBT
FROM financial_loan
WHERE MONTH(issue_date)= 11 AND year(issue_date)= 2021;
#13.3

# GOOD LOANS VS BAD LOAN KPIS COMPARISON
#PERCENTAGE of good loan
SELECT 
	ROUND(COUNT(CASE WHEN loan_status = 'Current' OR loan_status = 'Fully Paid' THEN id END)*100
	/
    COUNT(id)) AS Good_loan_percentage
FROM financial_loan;
#86

# Bad loan applicatio percentage
SELECT 
	ROUND(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100
	/
    COUNT(id)) AS Good_loan_percentage
FROM financial_loan;
#14

#LOAN APPLICATION
#good loan
SELECT COUNT(id) AS Total_Good_Loan_Application
FROM financial_loan
WHERE loan_status = 'Current' OR loan_status = 'Fully Paid';
#33243

#bad loan
SELECT COUNT(id) AS Total_Bad_Loan_Application
FROM financial_loan
WHERE loan_status = 'Charged Off';
#5333

#FUNDED AMOUNT GOOD LOAN VS BAD LOANS
#GOOD LOANS
SELECT SUM(loan_amount) AS Total_Good_Loan_Funded
FROM financial_loan
WHERE loan_status = 'Current' OR loan_status = 'Fully Paid';
#370224850

#BAD LOANS
SELECT SUM(loan_amount) AS Total_Bad_Loan_Funded
FROM financial_loan
WHERE loan_status = 'Charged Off';
#65532225


    

#TOTAL RECEIVED AMOUNT GOOD LOANS VS BAD LOANS
#GOOD LOAN
SELECT SUM(total_payment) AS Total_Good_Loan_Received
FROM financial_loan
WHERE loan_status = 'Current' OR loan_status = 'Fully Paid';
#435786170

#FROM BAD LOAN
SELECT SUM(total_payment) AS Total_Bad_Loan_Received
FROM financial_loan
WHERE loan_status = 'Charged Off';
#37284763


#GRIDVIEW
SELECT 
	loan_status,
    SUM(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received,
    ROUND(AVG(int_rate)*100) AS Average_Interest_Rate,
    ROUND(AVG(DTI)*100) AS Averagge_DTI
FROM financial_loan
GROUP BY loan_status;
#Charged Off	3710416130	65532225	37284763	14	14
#Fully Paid	21560434276	351358350	411586256	12	13
#Current	1000835274	18866500	24199914	15	15


//////
#Month to date funded amount and received amount
#for good loan
SELECT
	loan_status, 
	SUM(loan_amount) AS Total_Good_Loan_Amount,
	SUM(total_payment) AS Total_Good_Loan_Received
FROM financial_loan
WHERE MONTH(issue_date)= 12 AND year(issue_date)= 2021
GROUP BY loan_status;
#for bad loan




#Second DASHBOARD 
#MONTHLY TREND
SELECT
	Month(issue_date),
	monthname(issue_date) AS Months,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Loan_amount,
    SUM(total_payment) AS Total_Loan_Received
FROM financial_loan
group by Month(issue_date), monthname(issue_date)
ORDER BY Month(issue_date);
#RESULT
/**
1	January	2332	25031650	27578836
2	February	2279	24647825	27717745
3	March	2627	28875700	32264400
4	April	2755	29800800	32495533
5	May	2911	31738350	33750523
6	June	3184	34161475	36164533
7	July	3366	35813900	38827220
8	August	3441	38149600	42682218
9	September	3536	40907725	43983948
10	October	3796	44893800	49399567
11	November	4035	47754825	50132030
12	December	4314	53981425	58074380
**/

#TREND BY STATE ANALYSIS
SELECT
	address_state,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Loan_amount,
    SUM(total_payment) AS Total_Loan_Received
FROM financial_loan
group by address_state;

/**
GA	1355	15480325	16728040
CA	6894	78484125	83901234
TX	2664	31236650	34392715
IL	1486	17124225	18875941
PA	1482	15826525	17462908
FL	2773	30046125	31601905
MI	685	7829900	8543660
RI	196	1883025	2001774
NY	3701	42077050	46108181
MD	1027	11911400	12985170
WI	446	5070450	5485161
NV	482	5307375	5451443
UT	252	2849225	2952412
WA	805	8855525	9531739
NH	161	1917900	2101386
HI	170	1850525	2080184
MA	1310	15051000	16676279
OK	293	3365725	3712649
NJ	1822	21657475	23425159
OH	1188	12991375	14330148
AZ	833	9206000	10041986
CT	730	8435575	9357612
MN	592	6302600	6750746
CO	770	8976000	9845810
TN	17	162175	141522
VA	1375	15982650	17711443
MO	660	7151175	7692732
DE	110	1138100	1269136
NM	183	1916775	2084485
LA	426	4498900	5001160
AR	236	2529700	2777875
KY	320	3504100	3792530
NC	759	8787575	9534813
SC	464	5080475	5462458
WV	167	1830525	1991936
KS	260	2872325	3247394
WY	79	890750	1046050
OR	436	4720150	4966903
AL	432	4949225	5492272
VT	54	504100	534973
MS	19	139125	149342
DC	214	2652350	2921854
MT	79	829525	892047
SD	63	606150	656514
AK	78	1031800	1108570
IN	9	86225	85521
ME	3	9200	10808
ID	6	59750	65329
NE	5	31700	24542
IA	5	56450	64482
**/

#LOAN TERM ANALYSIS
SELECT
	term,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Loan_amount,
    SUM(total_payment) AS Total_Loan_Received
FROM financial_loan
group by term;

#result
/**
 60 months	10339	162715850	178361475
 36 months	28237	273041225	294709458
**/

#employee length Analysis
SELECT
	emp_length AS Employee_Length,
	COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Tptal_loan_amount,
    SUM(total_payment) AS Total_loan_Received
From financial_loan
GROUP BY emp_length;
#Result
/**
< 1 year	4575	44210625	47545011
9 years	1255	15084225	16516173
4 years	3428	37600375	40964850
10+ years	8870	116115950	125871616
3 years	4088	43937850	47551832
5 years	3273	36973625	40397571
1 year	3229	32883125	35498348
6 years	2228	25612650	27908658
2 years	4382	44967975	49206961
7 years	1772	20811725	22584136
8 years	1476	17558950	19025777
**/

#Loan purpose Breakdown
SELECT
	purpose AS Loan_purpose,
	COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Tptal_loan_amount,
    SUM(total_payment) AS Total_loan_Received
From financial_loan
GROUP BY purpose;
/**
car	1497	10223575	11324914
credit card	4998	58885175	65214084
Debt consolidation	18214	232459675	253801871
educational	315	2161650	2248380
home improvement	2876	33350775	36380930
house	366	4824925	5185538
major purchase	2110	17251600	18676927
medical	667	5533225	5851372
moving	559	3748125	3999899
other	3824	31155750	33289676
renewable_energy	94	845750	898931
small business	1776	24123100	23814817
vacation	352	1967950	2116738
wedding	928	9225800	10266856
**/

#HOME OWNERSHIP BREAKDOWN
SELECT
	home_ownership AS HOME_OWNERSHIP,
	COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Tptal_loan_amount,
    SUM(total_payment) AS Total_loan_Received
From financial_loan
GROUP BY home_ownership;

/**
RENT	18439	185768475	201823056
MORTGAGE	17198	219329150	238474438
OWN	2838	29597675	31729129
OTHER	98	1044975	1025257
NONE	3	16800	19053
**/


