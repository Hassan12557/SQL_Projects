--  1 High-value transactions in a single day
SELECT account_id, DATE(transaction_date) AS txn_date, SUM(amount) AS total_debit
FROM transactions
WHERE transaction_type='Debit'
GROUP BY account_id, DATE(transaction_date)
HAVING SUM(amount) > 10000;
-- 2 Multiple high-value transactions per customer
SELECT a.customer_id, COUNT(t.transaction_id) AS high_txn_count
FROM accounts a
JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_type='Debit' AND t.amount > 5000
GROUP BY a.customer_id
HAVING high_txn_count > 1;
-- Sudden spikes using window function
SELECT account_id, transaction_date, amount,
       AVG(amount) OVER (PARTITION BY account_id ORDER BY transaction_date ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS avg_last_5,
       amount / (AVG(amount) OVER (PARTITION BY account_id ORDER BY transaction_date ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING)) AS spike_ratio
FROM transactions
WHERE transaction_type='Debit';
-- Potential fraud (transaction > 50% of account balance)
SELECT t.transaction_id, t.account_id, t.amount, t.transaction_date
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
WHERE t.amount > 0.5 * a.balance AND t.transaction_type='Debit';

-- Daily transaction trends
SELECT DATE(transaction_date) AS txn_date,
       SUM(CASE WHEN transaction_type='Debit' THEN amount ELSE 0 END) AS total_debit,
       SUM(CASE WHEN transaction_type='Credit' THEN amount ELSE 0 END) AS total_credit
FROM transactions
GROUP BY DATE(transaction_date)
ORDER BY txn_date;