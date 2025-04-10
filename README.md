
# Hostel Management System by Anupriya Dhaka (23BCA1080)

## Overview
The **Hostel Management System** is a software application designed to automate and manage hostel operations like room allotments, payments, complaints, inventory tracking, and visitor logs. The system is built using SQL for database management and aims to replace manual operations with a digital platform.

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
   git clone https://github.com/yourusername/hostel-management-system.git


2. Set up the database using the schema provided:

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
-- [Include other table creation queries here as per your schema]
```


### Sample Data Insertion

```sql
-- Sample data for student 
INSERT INTO student VALUES  
(1, 'Aditi Rana', 'Female', '1998-05-12', 'BCA', '9876543210', '23bca10808@cuchd.in', '1234, Main Street, Chandigarh'),
(2, 'Ravi Kumar', 'Male', '1999-08-22', 'BBA', '9876501234', '23bca10809@cuchd.in', '4567, Sector 12, Mohali');
-- [Include other data insertion queries here]
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
-- [Include other queries like JOIN, DELETE, etc.]
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


