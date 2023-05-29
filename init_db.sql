CREATE DATABASE exam_module_3;
USE exam_module_3;
CREATE TABLE employee (
                          employee_id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255),
                          email VARCHAR(50),
                          address VARCHAR(255),
                          phone_number VARCHAR(20),
                          salary DOUBLE,
                          department_id INT,
                          FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE department (
                            department_id INT AUTO_INCREMENT PRIMARY KEY ,
                            department_name VARCHAR(255)
);

INSERT INTO department values (default, 'R&D'),
                              (default,'HR');

INSERT INTO employee values (default,'Son','son@gmail','Ha Nam','123',100000,1),
                            (default,'Nam','nam@gmail','Ha Noi','123',100000,1),
                            (default,'Dua','dua@gmail','Bac Ninh','123',100000,2),
                            (default,'Uyen','uyen@gmail','Ha Noi','123',100000,2);