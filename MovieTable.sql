CREATE TABLE user (
	uid VARCHAR(20) PRIMARY KEY,
	upw VARCHAR(20) NOT NULL,
    uname VARCHAR(20) NOT NULL,
    uemail VARCHAR(20) NOT NULL,
    uage INT NOT NULL,
    uadmin TINYINT NOT NULL DEFAULT 0
);
/* 관리자 계정 생성 */
INSERT INTO user VALUES('adminid', 'adminpw', 'admin', 'admin@admin.com', 30, 1);


CREATE TABLE movie(
	mid INT AUTO_INCREMENT PRIMARY KEY,
    mtitle VARCHAR(100) NOT NULL,
    mgrade INT NOT NULL,
    mcountry VARCHAR(30) NOT NULL,
    mplot VARCHAR(1000) NOT NULL,
    FOREIGN KEY (mid) REFERENCES booking(mid)
);

CREATE TABLE review(
    rnum INT PRIMARY KEY,
	uid VARCHAR(20) NOT NULL,
	mtitle VARCHAR(30) NOT NULL,
    rrate INT(2) NOT NULL,
    rcontent VARCHAR(300) NOT NULL,
    FOREIGN KEY (uid) REFERENCES user(uid)
);

CREATE TABLE booking (
	uid VARCHAR(20) PRIMARY KEY,
    mid INT AUTO_INCREMENT,
    bprice INT NOT NULL,
    bpers INT NOT NULL,
    FOREIGN KEY (uid) REFERENCES user(uid)
);

CREATE TABLE moviedetail (
	mid INT AUTO_INCREMENT PRIMARY KEY,
    mlimit INT(3) NOT NULL,
    mtime TIMESTAMP NOT NULL
);
