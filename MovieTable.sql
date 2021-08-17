
/*	유저 정보 테이블
	uid = 유저 아이디
    upw = 유저 비밀번호
    uname = 유저 이름
    uemail = 유저 이메일
    uage = 유저 나이
    uadmin = 관리자 권한 여부(1 = true, 0 = false)
*/
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


/*  영화 정보 테이블
	mid = 영화 식별 번호
    mposter = 영화 포스터
    mtitle = 영화 제목
    mgrade = 영화 등급
    mcountry = 영화 제작 국가
    mpremiere = 영화 개봉일
    mdirector = 영화 감독
    mactor = 영화 배우
    mplot = 영화 줄거리
*/
CREATE TABLE movie(
	mid INT AUTO_INCREMENT PRIMARY KEY,
	mposter MEDIUMBLOB NOT NULL,
    mtitle VARCHAR(100) NOT NULL,
    mgrade INT(2) NOT NULL,
    mcountry VARCHAR(30) NOT NULL,
    mpremiere DATETIME NOT NULL,
    mdirector VARCHAR(30) NOT NULL,
    mactor VARCHAR(30) NOT NULL,
    mplot VARCHAR(1000) NOT NULL,
    FOREIGN KEY (mid) REFERENCES booking(mid)
);

/*  리뷰 테이블
	rnum = 리뷰 식별 번호
    uid = 유저 아이디
    mtitle = 영화 제목
    rrate = 별점
    rcontent = 리뷰 내용
*/
CREATE TABLE review(
    rnum INT PRIMARY KEY AUTO_INCREMENT,
	uid VARCHAR(20) NOT NULL,
	mtitle VARCHAR(30) NOT NULL,
    rrate INT(2) NOT NULL,
    rcontent VARCHAR(300) NOT NULL,
    rdate TIMESTAMP,
    FOREIGN KEY (mid) REFERENCES movie(mid)
);

/*	영화 예매 정보 테이블
	modeid = 영화 디테일 식별 번호
	mid = 영화 식별 번호
    mlimit = 영화관 인원제한
    mtime = 영화 상영 시간
*/
CREATE TABLE moviedetail (
	modeid INT AUTO_INCREMENT PRIMARY KEY,
	mid INT,
    mlimit INT(3) NOT NULL,
    mtime DATETIME NOT NULL,
    FOREIGN KEY (mid) REFERENCES movie(mid)
);






/*  영화 예약 테이블
	uid = 유저 아이디
    mid = 영화 
    bprice = 영화 표 가격
	ppers = 감상 인원
*/
/*
CREATE TABLE booking (
	uid VARCHAR(20) PRIMARY KEY,
    mid INT,
    bprice INT NOT NULL,
    bpers INT NOT NULL,
    dtime TIMESTAMP
);
*/
