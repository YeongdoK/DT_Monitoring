CREATE DATABASE samsung_shipyard;
USE samsung_shipyard;

CREATE TABLE users (
    id VARCHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    department VARCHAR(50) NOT NULL,
    phone VARCHAR(13),
    isAdmin TINYINT(1) DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

alter table users discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table users import tablespace;

CREATE TABLE friends (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(8) NOT NULL,      -- 친구를 추가한 사용자 ID (varchar(8)로 수정)
    friend_id VARCHAR(8) NOT NULL,    -- 친구로 추가된 사용자 ID (varchar(8)로 수정)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (friend_id) REFERENCES users(id)
);

alter table friends discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table friends import tablespace;

CREATE TABLE IF NOT EXISTS messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id VARCHAR(255) NOT NULL,
    receiver_id VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

alter table messages discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table messages import tablespace;

CREATE TABLE status_revised_drawing(
	id INT,
    project_number varchar(50),
    release_department varchar(50),
    task_number varchar(50),
    drawing_name varchar(50),
    release_date DATE,
    release_number varchar(100),
    origin_department varchar(50),
    cause_code varchar(50),
    code_name varchar(50)
);

alter table status_revised_drawing discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table status_revised_drawing import tablespace;

CREATE TABLE request_design_change(
	registration_type varchar(50),
    status_ongoing varchar(50),
    ecn_number varchar(100),
    project_number varchar(50),
    urgency_level varchar(50),
    importance_level varchar(50),
    registration_date DATE,
    request_department varchar(50),
    planned_date DATE,
    completed_date DATE,
    partner_code varchar(50)
);

alter table request_design_change discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table request_design_change import tablespace;

CREATE TABLE status_structure_design(
	id INT,
	project_number varchar(50),
    dpbom_code varchar(100),
    dpbom_details varchar(50),
    design_function varchar(50),
    drawing_type varchar(50),
    partner_code varchar(50),
    direct_department varchar(50),
    release_planned_date DATE,
    release_completed_date DATE
);

alter table status_structure_design discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table status_structure_design import tablespace;

CREATE TABLE status_outfitting_design(
	id INT,
    dpbom_code varchar(100),
    dpbom_details varchar(50),
    design_function varchar(50),
    partner_code varchar(50),
    direct_department varchar(50),
    release_planned_date DATE,
    release_completed_date DATE
);

alter table status_outfitting_design discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table status_outfitting_design import tablespace;

CREATE TABLE welding_defect_rate(
	project_number varchar(50),
    vessel_type_long varchar(50),
    vessel_type_short varchar(50),
    company_type varchar(50),
    inspection_length FLOAT,
    defect_length FLOAT,
    inspection_method varchar(50),
    inspection_id varchar(100),
    department_code varchar(50),
    inspection_record_date DATE,
    nde_code varchar(50),
    usage_decision varchar(50),
    reason_code varchar(50),
    reason_details varchar(100),
    manager_number varchar(100),
    manager_name varchar(50),
    manager_code varchar(50),
    welder_number varchar(100),
    welder_name varchar(50),
    welding_completed_date DATE,
    welding_method TEXT
);

ALTER TABLE welding_defect_rate
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

alter table welding_defect_rate discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table welding_defect_rate import tablespace;

CREATE TABLE cargo_volume_data(
	material_code varchar(50),
    material_name varchar(100),
    incoming_volume FLOAT,
    outcoming_volume FLOAT,
    storage_location varchar(50),
    vessel_id varchar(100),
    storage_date DATE,
    storage_time TIME
);

alter table cargo_volume_data discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table cargo_volume_data import tablespace;

CREATE TABLE storage_capabilities_data(
	storage_location varchar(50),
    material_code varchar(50),
    material_name varchar(100),
    maximum_storage_volume FLOAT
);

alter table storage_capabilities_data discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table storage_capabilities_data import tablespace;

CREATE TABLE shipbuilding_process_data(
	process_date DATETIME,
    process_name text,
    detailed_process_name text,
    vessel_id text,
    planned_process_rate float,
    actual_process_rate float,
    number_of_worker INT,
    operating_hours INT,
    downtime_hours INT,
    remarks_note TEXT
);

alter table shipbuilding_process_data discard tablespace;
-- 주어진 samsung_shipyard의 ibd 삽입
alter table shipbuilding_process_data import tablespace;