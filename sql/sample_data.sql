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
