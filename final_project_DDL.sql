create table university(
    university_name     varchar(35),
    city                varchar(25),
    state               varchar(25),

    primary key (university_name)
);

create table department(
    dept_name           varchar(25),
    university_name     varchar(35),
    funding             int,
    number_professor    int,

    primary key(dept_name, university_name),
    foreign key (university_name) references university(university_name)
        on delete cascade
);

create table professor(
    email               varchar(35),
    university_name     varchar(35),
    first_name          varchar(35),
    last_name           varchar(35),
    pronounce           ENUM('He/him', 'She/her'),
    dept_name           varchar(35),
    password            varchar(40),
    permanent_address   varchar(100),

    primary key(email,university_name),
    foreign key (dept_name,university_name) references department(dept_name,university_name)
        on delete cascade
);

create table student(
    email               varchar(35),
    first_name          varchar(35),
    last_name           varchar(35),
    date_of_birth       date,
    university          varchar(35),
    password            varchar(40),
    pronounce           ENUM('He/him', 'She/her'),
    major               varchar(40),
    GPA                 float,
    AnticipateGrad      year,
    permanent_address   varchar(100),

    primary key(email),
    foreign key(university) references university(university_name)
        on delete cascade,
    foreign key(major) references department(dept_name)
        on delete cascade
);

create table advising(
    prof_email          varchar(35),
    student_email       varchar(35),

    primary key(prof_email, student_email),
    foreign key(prof_email) references professor(email),
    foreign key(student_email) references student(email)
);

create table course(
    course_code         varchar(35),
    dept_name          varchar(25),
    description         varchar(1024),

    primary key(course_code),
    foreign key(dept_name) references department(dept_name)
        on delete cascade
);

create table section(
    course_code         varchar(35),
    section_id          varchar(8),
    section_time        time,
    room                varchar(35),
    building            varchar(35),

    primary key(course_code, section_id),
    foreign key(course_code) references course(course_code)
        on delete cascade
);

create table teaching(
    prof_email          varchar(35),
    course_code         varchar(35),
    section_id          varchar(8),

    primary key(prof_email, course_code, section_id),
    foreign key(prof_email) references professor(email)
        on delete cascade,
    foreign key(course_code, section_id) references section(course_code, section_id)
        on delete cascade
);

create table taking(
    student_email       varchar(35),
    course_code         varchar(35),
    section_id          varchar(8),
    overall_grade       varchar(2),

    primary key(student_email, course_code),
    foreign key(student_email) references student(email),
    foreign key(course_code, section_id) references section(course_code, section_id)
);

create table assignment(
    course_code         varchar(35),
    section_id          varchar(8),
    assignment_num      int,
    student_email       varchar(35),
    deadline            date,
    grade               varchar(2),

    primary key(course_code,section_id,assignment_num,student_email),
    foreign key(course_code, section_id) references section(course_code, section_id),
    foreign key(student_email) references taking(student_email)
);