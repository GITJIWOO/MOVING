CREATE TABLE user (
	uid VARCHAR(20) PRIMARY KEY,
	upw VARCHAR(20) NOT NULL,
    uname VARCHAR(20) NOT NULL,
    uemail VARCHAR(20) NOT NULL,
    uage INT NOT NULL
);

CREATE TABLE booking (
	uid VARCHAR(20) PRIMARY KEY,
    mid INT AUTO_INCREMENT,
    bprice INT NOT NULL,
    bpers INT NOT NULL,
    FOREIGN KEY (uid) REFERENCES user(uid)
);

CREATE TABLE movie(
	mid INT AUTO_INCREMENT PRIMARY KEY,
    mtitle VARCHAR(30) NOT NULL,
    mtime TIMESTAMP NOT NULL,
    mgrade INT NOT NULL,
    mlimit INT(3) NOT NULL,
    FOREIGN KEY (mid) REFERENCES booking(mid)
);

CREATE TABLE review(
	uid VARCHAR(20) PRIMARY KEY,
	mtitle VARCHAR(30) NOT NULL,
    rrate INT(2) NOT NULL,
    rcontent VARCHAR(300) NOT NULL,
    FOREIGN KEY (uid) REFERENCES user(uid)
);
/* asfsadsagd*/