#  데이터 유형
#  숫자형 : numberic: integer, double(r에서는 기본형)
#  문자형 : character
#  논리형 : logical
#  결측데이터 : NA(관측되지 않은값), NAN(not a number), NULL
#  Factor : 문자 ==> 숫자처럼 순서를 가짐
#  함수 : closure

kbs <- 9 
object.size(kbs)
typeof(kbs) # double 형
is(kbs) # Vactor (기본값) 1차형 배열 is:데이터유형 확인 함수
kbs[1] #  r은 index 1부터 출발

# mbc = kbs # 함수를 치환할때 사용
mbc <- as.integer(kbs) # <-: 하나하나 값을 넣을때 사용/ 형변환
# kbs -> mbc #가능은 하나 잘 쓰지 않음.
is(mbc)
sbs <- 5L # 형변환
is(sbs)

is(mbc)

ss <- "홍길동"
typeof(ss) # "character"
is.character(ss) # True

bb <- TRUE
bb <- T # TRUE 를 T로 써도 됨
typeof(bb) # "logical"

aa <- NA # 결측 데이터 ( 값이 입력되지 않은 상태)
tyepof(aa)

sum(2,3)
sum(2,3,aa) # NA가 연산에 참여하면 전체가 NA가 됨
sum(2,3,aa, na.rm = T) # na.rm = T: NA 값 연산에 참여시키지 마
typeof(NA) # "logical" 결측 데이터 ( 값이 입력되지 않은 상태)
typeof(NULL) # "NULL" 데이터 값이 없음.
typeof (NaN) # "double" Not a Number : 수학적으로 정의되지 않았다.

2 / 3
0 / 0 # NaN
0 * Inf # Inf:무한대 값 NaN
Inf + -Inf # NaN
Inf - Inf # NaN

5.4 - 3i
typeof(5.4 - 3i) # "complex" 복소수(실수와 허수로 구성되있는 수)
Re(5.4 - 3i) # 실수만
Im(5.4 - 3i) # 허수만

f <- function(){
  return('good')
}
f()
typeof(f) # "closure"

x <- FALSE
print(x)
cat(x)

print(1,2) # print 하나만 찍어줌 1

cat(1,2) # cat 다 찍어줌 1 2

class(x)
typeof(x)
mode(x)

# class() : R 객체지향 관점에서의 자료형
# typeof() : 원시 자료형 (R 에서의)
# mode() : 원시 자료형 (S1 에서의)

strOptions(x) # 객체의 구조 확인 함수 
ls() # 현재 사용중인 객체변수 목록
ls.str() # 현재 사용중인 객체변수 목록과 값
rm(aa) # aa 객체 지우기
rm(list=ls()) # 사용중인 모든 객체 지우기 # console 지우기 컨트롤+l

# --------------------------------------------
# package : 데이터 + 기능 + 알고리즘 덩어리
available.packages() # 현재 사용가능한 package를 알려줌
dim(available.packages()) # 현재 사용가능한 package 수를 알려줌 18323
installed.packages() # 내 컴퓨터에 설치된 package를 알려줌
length(installed.packages()) # 내 컴퓨터에 깔려있는 packages수

# 패키지 설치
install.packages("plyr")

# 패키지 로딩
library(plyr) # 메모리로 로딩하기 (내 컴퓨터에 설치는 됬지만 로딩이 안되있음)

help("plyr") # 패키지 도움말 보기
search() # 현재 로딩된 패키지
ls("package:plyr") # plyr 이 지원하는 함수들
data(package="plyr") # plyr에 넣어놓은 data들
head(ozone,3)

remove.packages("plyr") #  plyr 패키지 지우기
data() # 현재 지원되는 dataset 목록
head(iris)

?sum #warrning은 신경쓸 필요 x
help("mean")

x <- c(0:10, 50) # 0  1  2  3  4  5  6  7  8  9 10 50
xm <- mean(x) # 평균 8.75
c(xm, mean(x, trim = 0.10)) # 10% 뺀 절사평균 값 구하기 5.50

hist(iris$Sepal.Length) # Histogram 구간이 그려짐

getwd() # 내가 현재 작업하고있는 경로 보기
setwd("c:/work") # 작업경로 바꾸기
setwd("c:/work/rsou/pro1")



