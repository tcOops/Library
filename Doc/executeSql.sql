use library_atm;

-- drop table book;
create table if not exists book(
       id int(10) not null primary key auto_increment,
       ISBN varchar(60) not null default "",
       signal_code varchar(60),
       name varchar(200) not null default "",
       author varchar(60) not null default "",
       publisher_name varchar(200),
       publisher_id int(10) not null default 0,
       publish_date Date,
       price double,
       language varchar(50),
       status varchar(60),
       location_id int(10)  
);

-- drop table bookstoreLocation;
create table if not exists bookstoreLocation(
       id int(10) not null primary key auto_increment,
       location varchar(200),
       door_ip varchar(60),
       door_port int(6),
       RFID_ip varchar(60),
       RFID_port int(6),
       code varchar(20)
);

-- drop table circulation;
create table if not exists circulation(
      id int(10) not null primary key auto_increment,
      reader_id int(10) not null default 0,
      book_id int(10) not null default 0,
      signal_code varchar(60),
      action_time Date,
      action_type varchar(60),
      is_deleted boolean
);

-- drop table class;
create table if not exists class(
        id int(4) not null primary key auto_increment,
        name varchar(150),
        grade_id int(4),
        code_number varchar(20)
);

-- drop table doorRecord;
create table if not exists doorRecord(
        id int(10) not null primary key auto_increment,
        action varchar(60),
        action_date Date,
        door_ip varchar(60),
        generate_date Date,
        is_deleted boolean
);

-- drop table grade;
create table if not exists grade(
        id int(10) not null primary key auto_increment,
        name varchar(150),
        school_id int(10)
);

-- drop table publisher;
create table if not exists publisher(
        id int(10) not null primary key auto_increment,
        name varchar(200),
        location varchar(200),
        shortcut varchar(60),
        generate_date Date
);

-- drop table reader;
create table if not exists reader(
        id int(10) not null primary key auto_increment,
        name varchar(60),
        sex varchar(20),
        class_id int(4),
        student_code varchar(60),
        student_card_number varchar(60),
        password varchar(60),
        role_id int(4) not null default 1,
        reader_status varchar(60),
        generate_date Date,
        is_deleted boolean
);

-- drop table RFIDRecord;
create table if not exists RFIDRecord(
        id int(10) not null primary key auto_increment,
        action_date Date,
        signal_code varchar(60),
        ip varchar(60),
        is_deleted boolean
);

-- drop table school;
create table if not exists school(
        id int(10) not null primary key auto_increment,
        name varchar(200),
        address varchar(200),
        contacter varchar(60),
        phone_number varchar(50)
);

-- drop table admin;
create table if not exists admin(
       id int(4) not null primary key auto_increment,
       name varchar(60),
       alias varchar(60),
       password varchar(60),
       generate_date Date,
       is_deleted boolean
);
