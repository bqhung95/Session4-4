CREATE DATABASE Management_Table_Product;
CREATE SCHEMA Table_Product;
CREATE TABLE Table_Product.TBProducts(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    stock INT,
    manufacturer VARCHAR(30) NOT NULL

);

INSERT INTO Table_Product.TBProducts(product_name, category, price, stock, manufacturer)
Values ('Laptop Dell XPS 13','Laptop','25000000','12','Dell'),
       ('Chuột Logitech M90','Phụ kiện','150000','50','Logitech'),
       ('Bàn phím cơ Razer','Phụ kiện','2200000','0','Razer'),
       ('Macbook Air M2','Laptop','32000000','7','Apple'),
       ('Iphone 14 promax','Điện thoại','35000000','15','Apple'),
       ('Laptop Dell XPS 13','Laptop','25000000','12','Dell'),
       ('Tai nghe AirPods 3','Phụ kiện','4500000',NULL,'Apple');
SELECT * FROM Table_Product.TBProducts;

--- 1. Chèn dữ liệu mới Chuột không dây Logitech M170, Phụ kiện, 300000, 20, Logitech
INSERT INTO Table_Product.TBProducts(product_name, category, price, stock, manufacturer)
VALUES ('Chuột không dây Logitech M170','Phụ kiện','300000','20','Logitech');

--- 2. Tăng giá tất cả sản phẩm lên 10%
UPDATE Table_Product.TBProducts
SET price = price * 1.10
WHERE manufacturer = 'Apple';

--- 3. Xóa sản phẩm có stock = 0
DELETE FROM Table_Product.TBProducts WHERE stock = 0;

--- 4. Hiển thị sản phẩm có price BETWEEN 1000000 AND 30000000
SELECT product_id,product_name, category, price, stock, manufacturer
FROM Table_Product.TBProducts
WHERE price BETWEEN 1000000 AND 30000000;

--- 5. Hiển thị sản phẩm có stock IS NULL
SELECT product_id,product_name, category, price, stock, manufacturer
FROM Table_Product.TBProducts
WHERE stock IS NULL;

--- 6. Liệt kê dnah sách hãng sản xuất duy nhất
SELECT DISTINCT category FROM Table_Product.TBProducts;

--- 7. Hiển thị toàn bộ sản phẩm sắp xếp giảm dần theo giá, tăng dần theo tên
SELECT product_id,product_name, category, price, stock, manufacturer
FROM Table_Product.TBProducts
ORDER BY price ASC, product_name DESC;

--- 8. Tìm sản phẩm có tên chứa từ " laptop " ( Không phân biệt hoa thường )
SELECT product_id,product_name, category, price, stock, manufacturer
FROM Table_Product.TBProducts
WHERE product_name ILIKE '%laptop%';

--- 9. Lấy về 2 sản phẩm đầu tiên sau khi sắp xếp giá giảm dần
SELECT product_id,product_name, category, price, stock, manufacturer
FROM Table_Product.TBProducts
ORDER BY price DESC
LIMIT 2;
