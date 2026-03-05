-- Index on orders for fast customer lookup
CREATE INDEX idx_orders_customer ON orders(customer_id);

-- Index on orders for order_date filtering
CREATE INDEX idx_orders_date ON orders(order_date);

-- Index on order_items for product queries
CREATE INDEX idx_order_items_product ON order_items(product_id);