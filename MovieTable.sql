
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

SELECT * FROM user;



/*  영화 정보 테이블
	mid = 영화 식별 번호
    mtitle = 영화 제목
    mgrade = 영화 등급
    mcountry = 영화 제작 국가
    mgenre = 영화 장르
    mtime = 영화 시간
    mpremiere = 영화 개봉일
    mdirector = 영화 감독
    mactor = 영화 배우
    mplot = 영화 줄거리
*/
CREATE TABLE movie(
	mid INT AUTO_INCREMENT PRIMARY KEY,
    mtitle VARCHAR(100) NOT NULL,
    mgrade INT(2) NOT NULL,
    mcountry VARCHAR(100) NOT NULL,
    mgenre VARCHAR(1000) NOT NULL,
    mtime VARCHAR(100) NOT NULL,
    mpremiere DATE NOT NULL,
    mdirector VARCHAR(100) NOT NULL,
    mactor VARCHAR(1000) NOT NULL,
    mplot VARCHAR(1000) NOT NULL
);
SELECT * FROM movie;

INSERT INTO movie (mtitle, mgrade, mcountry, mgenre, mtime, mpremiere, mdirector, mactor, mplot)
					VALUES ('카17', 1, '미국', '레이싱', '84분','2021-03-10', '김지우', '윤지우', '자동자 경주');
                    
DROP TABLE movie;


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
    mid INT,
    FOREIGN KEY (mid) REFERENCES movie(mid)
);

SELECT * FROM review where uid='qwer123' ORDER BY rdate DESC;

DROP TABLE review;


/*	영화 예고편 테이블
	mpid = 영화 예고편 식별 번호
	mid = 영화 식별 번호
    mpaddress = 영화 예고편 유튜브 주소
*/
CREATE TABLE moviepreview (
	mpid INT PRIMARY KEY AUTO_INCREMENT,
	mid INT,
    mpaddress VARCHAR(1000) NOT NULL,
    FOREIGN KEY (mid) REFERENCES movie(mid)
);

/*  찜한 영화 테이블
	mid = 영화 식별 번호
    uid = 유저 아이디
*/
CREATE TABLE userfavoritemovie (
	mid INT PRIMARY KEY,
    uid VARCHAR(20) NOT NULL,
    FOREIGN KEY (mid) REFERENCES movie(mid),
    FOREIGN KEY (uid) REFERENCES user(uid)
);
SELECT * FROM userfavoritemovie;
INSERT INTO userfavoritemovie VALUES (3, 'qwer123');
SELECT * FROM userfavoritemovie INNER JOIN movie ON userfavoritemovie.mid=movie.mid WHERE uid='qwer123';