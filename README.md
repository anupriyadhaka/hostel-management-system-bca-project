
# Hostel Management System by Anupriya Dhaka (23BCA10808)

## Overview 
The **Hostel Management System** is a project designed to automate and manage hostel operations like room allotments, payments, complaints, inventory tracking, and visitor logs. The system is built using SQL for database management and aims to replace manual operations with a digital platform.

## Features:
- Room allotment management
- Fee payment tracking
- Complaint registration and monitoring
- Inventory management
- Visitor log management
- Role-based access for admins, wardens, and students

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/anupriyadhaka/hostel-management-system-bca-project.git


2. Set up the database using the schema provided in files:

   - Import the schema from `sql/schema.sql` to create the necessary tables.

   - Insert sample data using `sql/sample_data.sql`.

3. Use the SQL queries in `queries.sql` to interact with the database.


## Database Structure

The system uses a relational database model with the following tables:

- `hostel_user`

- `student`

- `hostels`

- `rooms`

- `warden`

- `allotments`

- `payment`

- `complaints`

- `visitors`

- `inventory`

***


## **Database Tables:**

### **1. hostel\_user**

| Column Name | Data Type | Description             |
| ----------- | --------- | ----------------------- |
| user\_id    | INT (PK)  | Unique user ID          |
| username    | VARCHAR   | Login username          |
| password    | VARCHAR   | Hashed password         |
| role        | VARCHAR   | 'admin', 'warden', etc. |


### **2. student**

| Column Name | Data Type | Description         |
| ----------- | --------- | ------------------- |
| student\_id | INT (PK)  | Unique student ID   |
| name        | VARCHAR   | Full name           |
| gender      | VARCHAR   | Gender              |
| dob         | DATE      | Date of birth       |
| course      | VARCHAR   | Course of study     |
| phone       | VARCHAR   | Phone number        |
| email       | VARCHAR   | Email address       |
| address     | TEXT      | Residential address |


### **3. hostels**

| Column Name  | Data Type | Description           |
| ------------ | --------- | --------------------- |
| hostel\_id   | INT (PK)  | Unique hostel ID      |
| name         | VARCHAR   | Hostel name           |
| location     | VARCHAR   | Block or area         |
| total\_rooms | INT       | Total number of rooms |
| type         | VARCHAR   | 'Boys/Girls/Co-ed'    |


### **4. rooms**

| Column Name  | Data Type | Description                    |
| ------------ | --------- | ------------------------------ |
| room\_id     | INT (PK)  | Unique room ID                 |
| hostel\_id   | INT (FK)  | References hostels(hostel\_id) |
| room\_number | VARCHAR   | Room number                    |
| capacity     | INT       | Max number of students         |
| occupied     | INT       | Currently occupied             |
| type         | VARCHAR   | 'AC/Non-AC, Single/Shared'     |


### **5. warden**

| Column Name | Data Type | Description          |
| ----------- | --------- | -------------------- |
| warden\_id  | INT (PK)  | Unique ID            |
| name        | VARCHAR   | Full name            |
| phone       | VARCHAR   | Contact number       |
| email       | VARCHAR   | Email                |
| hostel\_id  | INT (FK)  | Manages which hostel |


### **6. allotments**

| Column Name   | Data Type | Description                     |
| ------------- | --------- | ------------------------------- |
| allotment\_id | INT (PK)  | Unique allotment ID             |
| student\_id   | INT (FK)  | References student(student\_id) |
| room\_id      | INT (FK)  | References rooms(room\_id)      |
| allot\_date   | DATE      | Date of allotment               |
| leave\_date   | DATE      | (Optional) Date of vacating     |


### **7. payment**

| Column Name | Data Type | Description                     |
| ----------- | --------- | ------------------------------- |
| payment\_id | INT (PK)  | Unique ID                       |
| student\_id | INT (FK)  | References student(student\_id) |
| amount      | DECIMAL   | Fee amount                      |
| date        | DATE      | Payment date                    |
| method      | VARCHAR   | UPI/Card/Cash etc.              |
| status      | VARCHAR   | Paid/Pending                    |


### **8. complaints**

| Column Name   | Data Type | Description             |
| ------------- | --------- | ----------------------- |
| complaint\_id | INT (PK)  | Unique complaint ID     |
| student\_id   | INT (FK)  | Complainer              |
| room\_id      | INT (FK)  | Affected room           |
| issue         | TEXT      | Complaint description   |
| date\_filed   | DATE      | When it was raised      |
| status        | VARCHAR   | Open/In Progress/Closed |


### **9. visitors**

| Column Name | Data Type | Description         |
| ----------- | --------- | ------------------- |
| visitor\_id | INT (PK)  | Unique ID           |
| student\_id | INT (FK)  | Who they came for   |
| name        | VARCHAR   | Visitor's name      |
| relation    | VARCHAR   | Relation to student |
| visit\_date | DATE      | Date of visit       |
| in\_time    | TIME      | Entry time          |
| out\_time   | TIME      | Exit time           |


### **10. inventory**

| Column Name | Data Type | Description                |
| ----------- | --------- | -------------------------- |
| item\_id    | INT (PK)  | Unique item ID             |
| hostel\_id  | INT (FK)  | Which hostel it belongs to |
| item\_name  | VARCHAR   | Bed, Table, Chair, etc.    |
| quantity    | INT       | Number available           |
| condition   | VARCHAR   | New, Good, Damaged         |

***


## **Coding & Query:**

### Table Creation

```sql
-- 1. hostel_user table 
CREATE TABLE hostel_user (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    role VARCHAR(20)
);

-- 2. student table 
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    course VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);

-- 3. hostels table 
CREATE TABLE hostels (
    hostel_id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(100),
    total_rooms INT,
    type VARCHAR(20)  -- 'Boys', 'Girls', or 'Co-ed'
);

-- 4. rooms table 
CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    hostel_id INT,
    room_number VARCHAR(10),
    capacity INT,
    occupied INT,
    type VARCHAR(20),  -- 'AC', 'Non-AC', 'Single', 'Shared'
    FOREIGN KEY (hostel_id) REFERENCES hostels(hostel_id)
);

-- 5. warden table 
CREATE TABLE warden (
    warden_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    hostel_id INT,
    FOREIGN KEY (hostel_id) REFERENCES hostels(hostel_id)
);

-- 6. allotments table 
CREATE TABLE allotments (
    allotment_id INT PRIMARY KEY,
    student_id INT,
    room_id INT,
    allot_date DATE,
    leave_date DATE,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- 7. payment table 
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    date DATE,
    method VARCHAR(20),  -- 'UPI', 'Card', 'Cash', etc.
    status VARCHAR(20),  -- 'Paid', 'Pending'
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

-- 8. complaints table 
CREATE TABLE complaints (
    complaint_id INT PRIMARY KEY,
    student_id INT,
    room_id INT,
    issue TEXT,
    date_filed DATE,
    status VARCHAR(20),  -- 'Open', 'In Progress', 'Closed'
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- 9. visitors table 
CREATE TABLE visitors (
    visitor_id INT PRIMARY KEY,
    student_id INT,
    name VARCHAR(50),
    relation VARCHAR(50),
    visit_date DATE,
    in_time TIME,
    out_time TIME,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

-- 10. inventory table 
CREATE TABLE inventory (
    item_id INT PRIMARY KEY,
    hostel_id INT,
    item_name VARCHAR(50),
    quantity INT,
    condition VARCHAR(20),  -- 'New', 'Good', 'Damaged'
    FOREIGN KEY (hostel_id) REFERENCES hostels(hostel_id)
);
```


### Sample Data Insertion

```sql
-- Sample data for student 
INSERT INTO student VALUES  
(1, 'Aditi Rana', 'Female', '1998-05-12', 'BCA', '9876543210', '23bca10808@cuchd.in', '1234, Main Street, Chandigarh'), 
(2, 'Ravi Kumar', 'Male', '1999-08-22', 'BBA', '9876501234', '23bca10809@cuchd.in', '4567, Sector 12, Mohali'), 
(3, 'Nikita Singh', 'Female', '1997-11-30', 'MBA', '9845623412', '23bca10810@cuchd.in', '7890, Chandigarh Road, Panchkula');

-- Sample data for hostels 
INSERT INTO hostels VALUES  
(1, 'Sukhna Tagore', 'Block A', 50, 'Girls'), 
(2, 'Ganga Bhawan', 'Block B', 80, 'Boys'), 
(3, 'Saraswati Bhawan', 'Block C', 60, 'Co-ed');

-- Sample data for rooms 
INSERT INTO rooms VALUES  
(101, 1, 'A101', 2, 1, 'AC'), 
(102, 1, 'A102', 2, 1, 'Non-AC'), 
(201, 2, 'B101', 3, 2, 'AC'),
(202, 2, 'B102', 3, 1, 'Shared'),
(301, 3, 'C101', 2, 1, 'AC');

-- Sample data for warden 
INSERT INTO warden VALUES  
(1, 'Mr. Sharma', '9876543210', 'warden1@cuchd.in', 1), 
(2, 'Mrs. Mehta', '9876501234', 'warden2@cuchd.in', 2);

-- Sample data for allotments 
INSERT INTO allotments VALUES  
(1, 1, 101, '2024-07-01', NULL), 
(2, 2, 201, '2024-07-01', NULL), 
(3, 3, 301, '2024-07-02', NULL);

-- Sample data for payment 
INSERT INTO payment VALUES  
(1, 1, 12000, '2024-07-01', 'UPI', 'Paid'), 
(2, 2, 10000, '2024-07-01', 'Cash', 'Paid'), 
(3, 3, 15000, '2024-07-02', 'Card', 'Pending');

-- Sample data for complaints 
INSERT INTO complaints VALUES  
(1, 1, 101, 'Leaking tap', '2024-07-05', 'Open'), 
(2, 2, 201, 'Fan not working', '2024-07-06', 'Closed'), 
(3, 3, 301, 'Lights not working', '2024-07-07', 'Open');

-- Sample data for visitors 
INSERT INTO visitors VALUES  
(1, 1, 'Priya Rana', 'Sister', '2024-07-05', '10:00:00', '12:00:00'), 
(2, 2, 'Mohan Kumar', 'Father', '2024-07-06', '09:00:00', '11:00:00');

-- Sample data for inventory 
INSERT INTO inventory VALUES  
(1, 1, 'Bed', 50, 'Good'), 
(2, 2, 'Table', 30, 'Damaged'), 
(3, 3, 'Chair', 40, 'Good');

```


### Example Queries

```sql
-- Example SELECT query
SELECT s.name AS student_name, r.room_number, h.name AS hostel_name
FROM student s
JOIN allotments a ON s.student_id = a.student_id
JOIN rooms r ON a.room_id = r.room_id
JOIN hostels h ON r.hostel_id = h.hostel_id;

-- Example UPDATE query
UPDATE payment
SET status = 'Paid'
WHERE student_id = 3;

-- Example DELETE query
DELETE FROM complaints
WHERE complaint_id = 5;

-- Example JOIN with ASC (Ascending Order)
SELECT s.name, r.room_number
FROM student s
JOIN allotments a ON s.student_id = a.student_id
JOIN rooms r ON a.room_id = r.room_id
ORDER BY r.room_number ASC;

-- Example JOIN with DESC (Descending Order)
SELECT s.name, r.room_number
FROM student s
JOIN allotments a ON s.student_id = a.student_id
JOIN rooms r ON a.room_id = r.room_id
ORDER BY r.room_number DESC;

-- Example GROUP BY query
SELECT h.name AS hostel_name, COUNT(s.student_id) AS total_students
FROM hostels h
JOIN rooms r ON h.hostel_id = r.hostel_id
JOIN allotments a ON r.room_id = a.room_id
JOIN student s ON a.student_id = s.student_id
GROUP BY h.name;

-- Example SELECT BETWEEN query
SELECT name, dob
FROM student
WHERE dob BETWEEN '1998-01-01' AND '2000-01-01';

-- Example UNION query
SELECT name FROM student WHERE course = 'BCA'
UNION
SELECT name FROM student WHERE course = 'BBA';

-- Example LIKE query
SELECT name
FROM student
WHERE name LIKE 'A%';

-- Example LIMIT query
SELECT s.name, p.amount, p.status
FROM student s
JOIN payment p ON s.student_id = p.student_id
WHERE p.status = 'Pending'
LIMIT 5;

```

***


## **Result:**

The **Hostel Management System** was successfully developed and implemented using a relational database structure and SQL queries to manage hostel-related operations. The system allows seamless interaction between students, wardens, and administrators through a centralized platform.

After entering sample data into each table, several queries were executed to verify the functionality and correctness of the system. These queries demonstrate how efficiently the system can handle real-time hostel scenarios such as room allotment, complaint tracking, payment status, and inventory management.

**Examples of operations and their results:**

- **UPDATE Operation**: Updates the payment status for `student_id = 3`.

- **DELETE Operation**: Removes a complaint with `complaint_id = 5`.

- **JOIN Operation**: Retrieves data with sorting and joining various tables.

- **GROUP BY**: Groups students by hostel and counts them.

- **LIMIT**: Retrieves the first 5 pending payments.

***


## Contribution

Feel free to contribute to this project by creating issues and submitting pull requests.


## License

This project is licensed under the MIT License - see the [LICENSE](https://chatgpt.com/c/LICENSE) file for details.


