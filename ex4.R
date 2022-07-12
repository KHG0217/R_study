# 내장 함수 /사용자 정의 함수
# 주요 내장함수 경험하기 :)
seq(0, 5, by=1.5)
seq(length=10, from=5, by=.2) #5 부터 0.2씩 증가해서 10개 만듦

set.seed(123) #매번 같은 난수 만들기
rnorm(10, mean = 0, sd=1) # 평균은 0 표준편차 1인 난수 10개 /편차: 평균에서 떨어진 값
# rnorm : 정규분포를 따르는 난수 발생
hist(rnorm(500000, mean = 0, sd=1)) # 정규분포 차트: 대다수의 확률값은 정규분포를 따름 볼록한모양

runif(10, min=0, max=100)
hist(runif(1000000, min=0, max=100)) # 균등분포 차트 : 점점 차트가 균등해짐

x <- 1:10
min(x)
max(x)
range(x)
mean(x)
median(x) #가운데값 구하기
var(x) # 분산값값
sqrt(var(x)) # 루트
sd(x) #분산에 루트씌운 값 

#.....

#사용자 정의함수
func1 <- function(arg){
  print(arg)
  print('사용자 함수 만세!')
  return(arg+ 10)
}
func1(10)
result = func1(5)
result

# 구구단 (반복문 사용가능)
gugu_func <- function(dan){
  for(d in dan){
    for(i in 1:9){
      cat(d,'*',i,'=',d*i,'')
    }
    cat('\n')
  }
}
gugu_func(2:5)

# 윤년 체크 (if문 사용가능) 4의 배수이고 100의 배수가 아니거나 400의 배수
yun_func <- function(y){
  if(y %% 4 == 0 & y %% 100 !=0 | y %% 400 == 0){
    paste(y,'년은 윤년') # 문자열 더하기 함수
  }else{
    paste(y, '년은 평년')
  }
}

yun_func(2020)
yun_func(2022)

