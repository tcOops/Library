#insert into grade(name, school_id) values("莘庄镇小学", 1);

#insert into admin(name, alias, password, generate_date, is_deleted) values("张三", "admin", "admin", now(), 0);

#insert into reader(name, sex, class_id, student_code, student_card_number, password, role_id, reader_status, generate_date, is_deleted)
#values("孙xiaobiu", "girl", 1, "22222", "1150339101", "123", 3, "使用中", now(), 0);

SELECT id, name, sex, class_id, student_code, student_card_number, role_id, reader_status, generate_date from reader where is_delted = 0