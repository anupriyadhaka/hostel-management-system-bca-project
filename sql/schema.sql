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
