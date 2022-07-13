# R 객체 타입 (vector, matrix, array, list, dataframe)
# scala는 지원하지 않는다.

#Vector : 1차원 배열 형태의 자료구조 (동일한 형태의 자료만 저장됨)
# - 벡터는 같은 자료형의 데이터를 정해진 갯수만큼 모아놓은 것이다. 
# - 생성 함수 : c(), seq(), rep()
# - 처리 함수 : setdiff(), intersect(), union()

y <- 2022
is.vector(y)
is(y)
typeof(y)
y <- as.integer(y)
typeof(y) # integer가 연산속도 더 빠름

rank(y) # 차원 보기
y[1]

seq(1, 5)
seq(1:5)
seq(1, 10, 2)
seq(1,10, length.out=3) # 수열의 갯수를 정하여(3) 갯수만큼 출력, 증가값도 자동으로 

rep(1:3, 3) # 패턴을 가진 수열을 생성 1~3 을 3번 반복함  1 2 3 1 2 3 1 2 3
rep(1:3, each=3)# 1 1 1 2 2 2 3 3 3 반복이 조금 다름

c(2,5,1, 10:15, 17) # 여러값을 할당할 수 있다.
x <- c(1,3,5)
y <- c(1:3, 1:3)
x; y # 명령을 이어쓸때 ;
print(x)
print(x,y)

cat(x,y)

age <- c(27,28,30)
age
names(age) <- c('오공','팔계','오정') # 백터에 칼럼명 지정
age
age[1]
age["오공"]
age[1:2]
age
age <- c(age, 40) # age에 백터 값 추가
age
age[10] <- 50 # age 10번째에 50을 넣어줌
age
age2 <- append(age, 50, after = 6) #6 이후
age2
age <- NULL
age

v1 <- c(13, -3, 20:23, 12, -2:3)
v1
v1[1]
v1[1:5]
v1[c(1:5, 8)]
v1[-1] # 여집합 첫번째 값만 빼고 
v1[-c(1,3, 6:9)] # 이값들만 빼고 출력

a<- 1:30
a
b <- a %% 3 # 3의 배수만 얻기 / %% : 나머지 연산
b; b==0 # 나머지가 0인 경우만 TRUE
a[b==0] # 3의 배수인 수만 나옴

length(a)
nrow(a) # matrix(행렬)만 가능 
NROW(a) # vector, matrix 가능

a <- 1:5
a + 5
a - 5
a * 5 
a / 5
a ^ 2 #a 제곱
a ** 2 #a 2제곱

sqrt(a) # 제곱근값 루트
sqrt(a) ^ 2

a <- 1:3
b <- 4:6
a; b

a * b # 열단위로 계산
a + b
a + 10
a[4] <-2
a; b

union(a,b) #합집합 /중복 x 
c(a,b) # 백터의 결합 /중복 o
b[4] <- 2
a; b
setdiff(a, b) # 차집합 a에는 있지만 b에는 없는것
intersect(a,b)# 교지합 a와 b가 함께 가지고 있는 것

# Matrices(Matrix) : 2차원의 dataset 이다. 이는 매트릭스 함수에 벡터를 제공함으로써 만들 수 있다.

# 동일 데이터 타입을 갖는 2차원 배열(행렬 구조).
# - 생성 함수 : dim(), matrix(), rbind(), cbind()
# : matrix: 긴 벡터를 잘라서 행렬로 변환
# : cbind: 여러 개의 벡터를 좌우로 붙여서 행렬로 변환
# : rbind: 여러 개의 벡터를 위아래로 붙여서 행렬로 변환
# - 처리함수 : apply()

a <- 1:8

dim(a) <- c(2,4) #2열 4행을 만듬 열부터 채움
dim(a) #2열 4행행
a
class(a) #  "matrix" "array" 

matrix(c(1:5)) # 1,2,3,4,5 1행 5열짜리 열 우선으로 5개 생김
matrix(1:9, nrow = 3) # 1행 9열짜리 -> 행을 3개 만들고 열을 채워 넣음  1 4 7(열부터 채워줌)
matrix(1:9, nrow = 3, byrow = T) # byrow = T:행을 우선으로 채우기  1 2 3 (행부터 채워줌)
matrix(1:10, 2) #2행 을 만들어서 2행 5열로 딱 만듬
m <- matrix(1:10, 3) #오류지만 1,2를 추가해서 만듬
m
dim(m) # 3행 4열 이라는 뜻
class(m)
m
m[1,] #1 행만 나옴
m[,3] #3 열만 나옴
m[2,3] # 2행의 3열
m[1, c(2:4)]
m[, -1] # 1열만 뺴고
m[-1, -1] # 1열 1행만 뺴고

matrix(c(1,2,3.5,'4')) # 마지막 '4'로 모두 문자가 됨
a <- matrix(1:9, nrow = 3, ncol = 3) # 1~9까지의 숫자로 3열 3행
a
rownames(a) <- c('r1','r2', 'r3') # 열 이름
colnames(a) <- c('one','two','three') # 행 이름
a
length(a) 
ncol(a) # 행 갯수
nrow(a) # 열 갯수
NROW(a)

a <- matrix(c(1,2,3,4), 2, 2) # nrow =2, ncol=2
a
b <- matrix(5:8, 2)
b

a+b # 각각 지점끼리 사칙연산
a-b
a*b # 하다마다 곱 그냥 지접끼리 곱
a/b

a %*% b # 행렬곱/행렬곱만 유효하다/ 행과열이 같아야 계산 가능  딥러닝에서 사용

diag(3) # 주대각이 1인 3x3행렬이 만들어짐 ( 가운데 \ 값만 1)
a
t(a) # 행과 열이 바뀜

x1 <- c(5, 40, 50:52) # 1차원의 백터를 만듬
x2 <- c(30, 5, 6:8)
x1; x2

mr <- rbind(x1,x2) #x1,x2 열로 합쳐짐
mr
mc <- cbind(x1, x2) # x1,x2 행으로 합쳐짐
mc 


# apply(변수, 행렬, 함수) 함수를 실행하는 함수
x <- matrix(1:9, nrow=3)
x
apply(x,1, max) # 행 기준 가장 큰 값 구하기
apply(x,2, max) # 열 기준 가장 큰 값 구하기
apply(x,2, mean) # 열 기준 평균 구하기


# Arrays : matrix는 2차원에 한정되지만 arrays는 어떠한 차원으로도 만들 수 있다. 
# 
# 동일 데이터 타입을 갖는 다차원 배열. (활용도는 다소 낮다)
# - matrix는 행과 열을 갖는 2차원 자료구조다.
# - Array는 행과 열, page를 갖는 3차원 자료구조다.
# - 생성 함수 : array(data, dim)
d <- 1:12
class(d)
arr1 <- array(d) # d 와 값은 같음
class(arr1) # 타입이 array
dim(arr1) #12열 짜리 1차원 배열
arr2 <- array(1:12, dim=c(6,2))
arr2
dim(arr2) # 6행 2열 짜리 2차원 배열

arr3 <- array(1:12, dim=c(3,2,2))
arr3
dim(arr3) # 3행 2열 2면짜리 3차원 배열
arr3[,,1] # 1면보기기
arr3[,,2] # 2면 보기
arr3[1,1,1] # 1행 1열 1면 요소값 반환


# List : 서로 다른 타입의 데이터를 기억할 수 있다.
# 
# - 성격이 다른 데이터(벡터, 행렬, 데이터프레임 등 모든 데이터)의 기억이 가능,
# c의 구조체, java의 레코드형 기억장소와 유사 dto
# - 생성 함수 : list()
# 
# - 처리 함수 : unlist(), lapply(), sapply()

li <- list('1','홍길동',55,'2','고길동',75)
class(li) # list
li # [1],[2]...key로 values 로 들어감
li[1]
li[[1]][1]

li2 <- list(x=1:5, y=6:10) #x,y라는 키값으로 values 가 들어감
li2
li2$x # $킷명 으로 values 를 불러올 수있다.
li2$y




# Data Frames : 구조화된 데이터 오브젝트다. 
# 
# 데이터베이스의 테이블 구조와 유사, 칼럼 단위로 type이 달라도 됨
# - 가장 많이 사용되는 객체 타입
# - 데이터프레임과 행렬은 모두 2차원 데이터이지만 다음과 같은 점이 다르다.
# 데이터프레임의 각 열은 서로 다른 자료형이 될 수 있다.
# 데이터프레임은 열 이름, 행 이름을 가질 수 있다.
# - 생성 함수 : data.frame(열이름1=요소, 열이름2=요소, …)
# - 처리 함수 : apply(), str(), ncol(), nrow(), summary()


# 작성1 : vector로 Data Frames 작성
no <- c(1,2,3) # no라는 칼럼으로 열 1, 2 ,3
name <- c("홍","김","이") # name이라는 칼럼으로 열 홍,김 ,이
pay <- c(500,550,400) # pay이라는 칼럼으로 열 500,550 ,400
# df <- data.frame(no, name, pay)
df <- data.frame(bunno=no, irum=name, imkum=pay) # 칼럼명을 바꿀 수있다.
df
class(df) # "data.frame"
str(df) # 구조 파악가능
summary(df)
head(df,n=2) # 앞에서부터 2열
tail(df,n=2) # 뒤에서부터 2열
class(iris)
head(iris, n=3)
tail(iris, n=3)


# 작성2 : matrix로 Data Frames 작성
m <- matrix(c(1, "홍길동", 300, 2, "신길동", 400, 3, "고길동", 350),3, by=T)
m
mdf <- data.frame(m)
mdf
class(mdf)

# 작성3 : data.frame로 Data Frames 작성
df <- data.frame(irum=c('james','oscar','tom'), nai=c(34,28,26))
df
df$irum
df$nai
df$nai[1]
df['addr'] = c('서울','인천','수원') #addr이라는 칼럼으로 values 추가
df['imsi'] = ifelse(df$nai >= 30, "good", "nice") # TRUE면 good, FALSE면 nice
df

df[, 2] #2열만 보기
df[, 1]
df[1,] # 1행만 보기
df[1, c(1,3)]

# 조건 지장
df
df[df$addr =='서울',1]
df[df$addr =='서울',2]
df[df$addr =="서울",3]
subset(df, addr =='서울')
subset(df, addr =='서울',select = c(1, 2)) # 서울이 있는 행에 1,2

df[,'addr'] <- NULL # 열 삭제
df 

# file i/o
getwd()
#header = T를 넣어줘야 사번,이름,급여가 칼럼으로 들어감
txtdf <- read.table('testdata/emp.txt', encoding = 'utf-8', header = T)
txtdf
class(txtdf)
summary(txtdf)
str(txtdf)


csvdf <- read.csv('testdata/emp.csv', encoding = 'utf-8' ,header = T)
csvdf

df
write.csv(df, 'mydf.csv', row.names = T) #''경로 안써주면 현재경로에 저장
csvdf2 =read.csv('mydf.csv', encoding = 'utf-8' ,header = T)
csvdf2
