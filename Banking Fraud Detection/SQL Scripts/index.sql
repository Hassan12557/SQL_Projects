-- Speed up queries
CREATE INDEX idx_trans_account ON transactions(account_id);
CREATE INDEX idx_trans_date ON transactions(transaction_date);
CREATE INDEX idx_acc_customer ON accounts(customer_id);