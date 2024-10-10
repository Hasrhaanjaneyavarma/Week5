create database task;
use task;
create database task;
use task
CREATE TABLE customers (
  customer_id INT,
  name VARCHAR(50)
);
CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  product_name VARCHAR(50)
);
INSERT INTO customers (customer_id, name) 
VALUES 
(1, "Harsha"), 
(2, "Pavan"), 
(3, "NMR");
INSERT INTO orders (order_id, customer_id, product_name) 
VALUES 
(1, 1, "apple"), 
(2, 2, "orange"), 
(3, 3, "grapes");
SELECT c.name, o.product_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
SELECT c.name, o.product_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.name;
CREATE TABLE products (
  product_id INT,
  product_name VARCHAR(50)
);
CREATE TABLE suppliers (
  supplier_id INT,
  supplier_name VARCHAR(50)
);
CREATE TABLE products_suppliers (
  product_id INT,
  supplier_id INT
);
INSERT INTO products (product_id, product_name)
VALUES
(1, "Apple"),
(2, "Berry"),
(3, "Cherry"),
(4, "Orange"),
(5, "Grapes");
INSERT INTO suppliers (supplier_id, supplier_name)
VALUES
(1, "Supplier 1"),
(2, "Supplier 2"),
(3, "Supplier 3"),
(4, "Supplier 4");
INSERT INTO products_suppliers (product_id, supplier_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 1),
(4, 4);

SELECT p.product_name, s.supplier_name
FROM products p
RIGHT JOIN products_suppliers ps
ON p.product_id = ps.product_id
RIGHT JOIN suppliers s
ON ps.supplier_id = s.supplier_id;

#Full outer join
-- Create Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
-- Insert data into Departments Table
INSERT INTO departments (department_id, department_name) VALUES
(101, 'Human Resources'),
(102, 'IT'),
(103, 'Marketing');

-- Insert data into Employees Table
INSERT INTO employees (employee_id, employee_name, department_id) VALUES
(1, 'Harsha', 101),
(2, 'Pavan', 102),
(3, 'NMR', 101),
(4, 'VR', 103);
Select * From departments;
Select * From employees;
SELECT e.employee_id,e.employee_name,d.department_id,d.department_name
FROM employees e
LEFT JOIN 
    departments d ON e.department_id = d.department_id
UNION
SELECT e.employee_id,e.employee_name,d.department_id,d.department_name
FROM 
    employees e
RIGHT JOIN 
    departments d ON e.department_id = d.department_id;
drop database task; 

-- Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id) 
);
-- Insert data into Employees Table
INSERT INTO employees (employee_id, employee_name, manager_id) VALUES
(1, 'Alice Smith', NULL),  
(2, 'Bob Johnson', 1),     
(3, 'Carol White', 1),  
(4, 'David Brown', 2),     
(5, 'Eve Davis', 2);    

SELECT 
    e1.employee_id AS Employee_ID,
    e1.employee_name AS Employee_Name,
    e2.employee_id AS Manager_ID,
    e2.employee_name AS Manager_Name
FROM 
    employees e1
LEFT JOIN 
    employees e2 ON e1.manager_id = e2.employee_id;

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL
);

-- Insert data into Products Table
INSERT INTO products (product_id, product_name) VALUES
(1, 'Product A'),
(2, 'Product B'),
(3, 'Product C');

-- Insert data into Customers Table
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Customer X'),
(2, 'Customer Y'),
(3, 'Customer Z');

SELECT 
    p.product_id,
    p.product_name,
    c.customer_id,
    c.customer_name
FROM 
    products p
CROSS JOIN 
    customers c;

drop database task;
create database task;
use task;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'NMR'),
(2, 'Jackie'),
(3, 'Brown');

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(101, 1, '2024-01-15'),
(102, 1, '2024-02-10'),
(103, 2, '2024-03-20'),
(104, 3, '2024-04-05'),
(105, 2, '2024-05-15');

SELECT *
FROM customers
NATURAL JOIN orders;
SELECT customer_name, order_id, order_date
FROM customers
NATURAL JOIN orders;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alex'),
(2, 'Bobby'),
(3, 'Camron');

INSERT INTO orders (order_id, customer_id, product_id) VALUES
(101, 1, 1001),
(102, 1, 1002),
(103, 2, 1003),
(104, 3, 1004),
(105, 2, 1005),
(106, 1, 1006);
SELECT c.customer_name, COUNT(o.product_id) AS total_products_ordered
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
   ); 

-- Insert sample values into customers
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alice Smith'),
(2, 'Bob Johnson'),
(3, 'Charlie Brown');

-- Insert sample values into products
INSERT INTO products (product_id, product_name) VALUES
(1001, 'Laptop'),
(1002, 'Smartphone'),
(1003, 'Tablet');

-- Insert sample values into orders
INSERT INTO orders (order_id, customer_id, product_id, order_date) VALUES
(101, 1, 1001, '2024-01-15'),
(102, 1, 1002, '2024-02-10'),
(103, 2, 1003, '2024-03-20'),
(104, 3, 1001, '2024-04-05'),
(105, 2, 1002, '2024-05-15');

SELECT 
    c.customer_name,
    p.product_name,
    o.order_date
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    products p ON o.product_id = p.product_id;
    
#Foreign keys
-- Create authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100)
);

-- Create books table with a foreign key referencing authors
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(200),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Insert sample values into authors
INSERT INTO authors (author_id, author_name) VALUES
(1, 'J.K. Rowling'),
(2, 'George R.R. Martin'),
(3, 'J.R.R. Tolkien');

-- Insert sample values into books
INSERT INTO books (book_id, book_title, author_id) VALUES
(101, 'Harry Potter and the Sorcerer\'s Stone', 1),
(102, 'The Hobbit', 3),
(103, 'Harry Potter and the Chamber of Secrets', 1),
(104, 'A Clash of Kings', 2);
Select * from authors;
Select * from books;
drop database task
create database task;
use task;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing');
INSERT INTO products (product_id, product_name, category_id) VALUES
(1, 'Smartphone', 1),
(2, 'Laptop', 1),
(3, 'Novel', 2),
(4, 'T-Shirt', 3);
SELECT * FROM categories;
SELECT * FROM products;

#violating foreign
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
Select * from customers;
select * from orders;

#unique constraint
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);
select * from users;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) CHECK (price > 0)
);

CREATE TABLE courses (
    course_id INT,
    course_name VARCHAR(255) NOT NULL,
    department_id INT,
    PRIMARY KEY (course_id, department_id)
);
INSERT INTO courses (course_id, course_name, department_id) VALUES
(101, 'Introduction to Programming', 1),
(102, 'Data Structures', 1),
(201, 'Calculus I', 2),
(202, 'Linear Algebra', 2),
(301, 'Organic Chemistry', 3),
(302, 'Biochemistry', 3);


drop database task;
create database task;
use task;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL
);
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);
ALTER TABLE employees
ADD CONSTRAINT chk_salary CHECK (salary > 0);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL
);
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
































 





