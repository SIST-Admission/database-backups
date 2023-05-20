CREATE TABLE departments (
    department_code VARCHAR(4) PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

CREATE TABLE batches (
    batch_code VARCHAR(4) PRIMARY KEY,
    batch_name VARCHAR(255),
    department_code VARCHAR(4) NOT NULL,
    start_year INT NOT NULL,
    end_year INT NOT NULL,
    FOREIGN KEY (department_code) REFERENCES departments(department_code)
);

CREATE TABLE subjects (
    subject_code VARCHAR(4) PRIMARY KEY,
    subject_name VARCHAR(255) NOT NULL
);

CREATE SEQUENCE class_12_marks_id_seq;
CREATE TABLE class_12_marks(
    id INT PRIMARY KEY DEFAULT nextval('class_12_marks_id_seq'),
    school_id INT NOT NULL,
    subject_code VARCHAR(4) NOT NULL,
    marks_obtained INT NOT NULL,
    total_marks INT NOT NULL,
    is_passed BOOLEAN NOT NULL,
    FOREIGN KEY (subject_code) REFERENCES subjects(subject_code),
    FOREIGN KEY (school_id) REFERENCES school(id)
);

CREATE SEQUENCE documents_id_seq;
drop table if exists documents;
CREATE TABLE documents(
    id INT PRIMARY KEY DEFAULT nextval('documents_id_seq'),

    document_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(255) NOT NULL,
    key VARCHAR(255) NOT NULL,
    is_verified BOOLEAN NOT NULL
);

CREATE SEQUENCE basic_details_id_seq;
CREATE TABLE basic_details(
    id INT PRIMARY KEY DEFAULT nextval('basic_details_id_seq'),
    name VARCHAR(255) NOT NULL,
    dob date NOT NULL,
    gender CHAR(10) NOT NULL,
    category CHAR(10) NOT NULL,
    is_coi BOOLEAN NOT NULL,
    is_pwd BOOLEAN NOT NULL,
    father_name VARCHAR(255) NOT NULL,
    mother_name VARCHAR(255) NOT NULL,
    nationality VARCHAR(255) NOT NULL,
    identity_type VARCHAR(255) NOT NULL,
    identity_number VARCHAR(255) NOT NULL,
    identity_document_id INT NOT NULL,
    FOREIGN KEY (identity_document_id) REFERENCES documents(id)
);

CREATE SEQUENCE diploma_id_seq;
CREATE TABLE diploma(
    id INT PRIMARY KEY DEFAULT nextval('diploma_id_seq'),
    college_name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL,
    year_of_passing INT NOT NULL,
    merit_score INT
);

CREATE SEQUENCE diploma_marks_id_seq;
CREATE TABLE diploma_marks(
    id INT PRIMARY KEY DEFAULT nextval('diploma_marks_id_seq'),
    diploma_id INT NOT NULL,
    semester INT NOT NULL,
    cgpa FLOAT NOT NULL,
    merit_score INT,
    document_id INT NOT NULL,
    FOREIGN KEY (diploma_id) REFERENCES diploma(id),
    FOREIGN KEY (document_id) REFERENCES documents(id)
);

CREATE sequence school_id_seq;
CREATE TABLE school(
    id INT PRIMARY KEY DEFAULT nextval('school_id_seq'),
    board VARCHAR(255) NOT NULL,
    year_of_passing INT NOT NULL,
    roll_number VARCHAR(255) NOT NULL,
    percentage FLOAT NOT NULL,
    merit_score INT,
    document_id INT,
    FOREIGN KEY (document_id) REFERENCES documents(id)
);

CREATE SEQUENCE academic_details_id_seq;
CREATE TABLE academic_details (
    id INT PRIMARY KEY DEFAULT nextval('academic_details_id_seq'),
    class_10_school_id INT NOT NULL,
    class_12_school_id INT NOT NULL,
    diploma_id INT NOT NULL,
    jee_mains_rank INT DEFAULT 0,
    jee_mains_marks INT DEFAULT 0,
    jee_advanced_rank INT DEFAULT 0,
    jee_advanced_marks INT DEFAULT 0,
    cuet_rank INT DEFAULT 0,
    cuet_marks INT DEFAULT 0,
    merit_score INT,
    FOREIGN KEY (class_10_school_id) REFERENCES school(id),
    FOREIGN KEY (class_12_school_id) REFERENCES school(id),
    FOREIGN KEY (diploma_id) REFERENCES diploma(id)
);

CREATE SEQUENCE payments_id_seq;
CREATE TABLE payments(
    id INT PRIMARY KEY DEFAULT nextval('payments_id_seq'),
    amount INT NOT NULL,
    payment_date date NOT NULL DEFAULT CURRENT_DATE,
    payment_mode VARCHAR(255) NOT NULL DEFAULT 'online',
    is_paid BOOLEAN NOT NULL DEFAULT FALSE,
    rp_order_id VARCHAR(255) NOT NULL
);

CREATE SEQUENCE payment_transactions_id_seq;
CREATE TABLE payment_transactions(
    id INT PRIMARY KEY DEFAULT nextval('payment_transactions_id_seq'),
    payment_id INT NOT NULL,
    rp_payment_id VARCHAR(255) NOT NULL,
    amount INT NOT NULL,
    is_success BOOLEAN NOT NULL DEFAULT FALSE,
    status VARCHAR(255) NOT NULL,
    metadata TEXT,
    FOREIGN KEY (payment_id) REFERENCES payments(id)
);

CREATE SEQUENCE application_id_seq;
CREATE TABLE applications (
    id INT PRIMARY KEY DEFAULT nextval('application_id_seq'),
    basic_details_id INT NOT NULL,
    academic_details_id INT NOT NULL,
    payment_id INT NOT NULL,
    application_type VARCHAR(255) NOT NULL DEFAULT 'FRESHER',
    application_start_date date NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(255) NOT NULL DEFAULT 'NOT SUBMITTED',
    FOREIGN KEY (basic_details_id) REFERENCES basic_details(id),
    FOREIGN KEY (academic_details_id) REFERENCES academic_details(id),
    FOREIGN KEY (payment_id) REFERENCES payments(id)
);

CREATE SEQUENCE users_id_seq;
CREATE TABLE users (
    id INT PRIMARY KEY DEFAULT nextval('users_id_seq'),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    phone_verified BOOLEAN NOT NULL DEFAULT FALSE,
    role VARCHAR(255) NOT NULL DEFAULT 'STUDENT',
    application_id INT,
    FOREIGN KEY (application_id) REFERENCES applications(id)
);

alter table documents add column user_id int references users(id);

CREATE SEQUENCE submission_id_seq;
CREATE TABLE submissions (
    id INT PRIMARY KEY DEFAULT nextval('submission_id_seq'),
    user_id INT NOT NULL,
    department_code VARCHAR(4) NOT NULL,
    batch_code VARCHAR(4) NOT NULL,
    status VARCHAR(255) NOT NULL,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    is_admitted BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (department_code) REFERENCES departments(department_code),
    FOREIGN KEY (batch_code) REFERENCES batches(batch_code)
);

CREATE SEQUENCE merit_list_id_seq;
CREATE TABLE merit_lists (
    id INT PRIMARY KEY DEFAULT nextval('merit_list_id_seq'),
    department_code VARCHAR(4) NOT NULL,
    batch_code VARCHAR(4) NOT NULL,
    published_date date,
    last_payment_date date,
    is_published BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (department_code) REFERENCES departments(department_code),
    FOREIGN KEY (batch_code) REFERENCES batches(batch_code)
);

CREATE SEQUENCE merit_list_student_id_seq;
CREATE TABLE merit_list_students (
    id INT PRIMARY KEY DEFAULT nextval('merit_list_student_id_seq'),
    merit_list_id INT NOT NULL,
    user_id INT NOT NULL,
    submission_id INT NOT NULL,
    total_merit_score INT NOT NULL,
    FOREIGN KEY (merit_list_id) REFERENCES merit_lists(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
