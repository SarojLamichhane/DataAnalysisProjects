# change the datatype of the table column issue date, last_credit pull_date, last_payment_date, next_payment_date


# issue_date
SELECT * from financial_loan;


ALTER TABLE financial_loan MODIFY COLUMN issue_date varchar(20);

DESC financial_loan;
#update financial_loan set issue_date = date_format(str_to_date(issue_date,'%d/%m/%Y'),'%Y-%m-%d');
ALTER TABLE financial_loan MODIFY COLUMN issue_date date;
SELECT * from financial_loan;

ALTER TABLE financial_loan MODIFY COLUMN last_credit_pull_date varchar(20);
ALTER TABLE financial_loan MODIFY COLUMN last_payment_date varchar(20);
ALTER TABLE financial_loan MODIFY COLUMN next_payment_date varchar(20);

#update financial_loan set last_credit_pull_date = date_format(str_to_date(last_credit_pull_date,'%d/%m/%Y'),'%Y-%m-%d');
#update financial_loan set last_payment_date = date_format(str_to_date(last_payment_date,'%d/%m/%Y'),'%Y-%m-%d');
#update financial_loan set next_payment_date = date_format(str_to_date(next_payment_date,'%d/%m/%Y'),'%Y-%m-%d');

ALTER TABLE financial_loan MODIFY COLUMN last_credit_pull_date date;
ALTER TABLE financial_loan MODIFY COLUMN last_payment_date date;
ALTER TABLE financial_loan MODIFY COLUMN next_payment_date date;

DESC financial_loan;
