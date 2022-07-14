# 상관분석은 확률론과 통계학에서 
# 두 변수간에 어떤 선형적 관계를 갖고 있는 지를 분석하는 방법이다. 
# 두 변수는 서로 독립적인 관계로부터 서로 상관된 관계일 수 있으며 
# 이때 두 변수 간의 관계의 강도를 상관관계(Correlation)라 한다.


# 공분산(共分散, covariance)은 2개의 확률변수의 선형 관계를 나타내는 값이다.
# 공식 = 두개의 변수 전체편차의합을 구하고 각 변수의 합을 전체갯수로 나눔
# 공분산의 예


x <- 1:5
y <- 5:1
plot(x,y)

mean(1:5) #평균
var(1:5) #분산 :관측값에서 평균을 뺀 값을 제곱하고, 
#               그것을 모두 더한 후 전체 개수로 나눠서 구한다
#               평균으로 부터의 거리 
#편차를 모두 더하면 0 => 이유는 -부호도 있기 때문 ->
# 이런 상황을 회피하기위해 분산의 제곱을하여 양수로 바꾸고 모두 더한뒤
# 나온값을 사용 ->
# 그값이 너무 크기때문에 루트를 씌워주어서 사용 = 표준편차

sd(1:5) # 분산 제곱 나누기 루트 = 표준편차

#cov 공분산
cov(1:5, 2:6) # 상관관계: 2.5 /양의 관계가 있음을 알 수 있다./ 우상향
cov(1:5, c(3,3,3,3,3)) # 상관관계: 0 /관계가 없다. / 직선
cov(1:5, 5:1)# 상관관계: -2.5 / 음의 관계가 있음을 알 수 있다. 우하향
cov(1:5, c(50,40,30,20,10)) # -25 
cov(1:5, c(500,400,300,200,100)) # -250 단위가 다르기 때문에 표준화

# 공분산 값을 표준화 할 수있다. -1 ~ 0 ~ 1 사이의 값으로 표현하게 됨 = 상관계수

# 상관계수 = r ***중요 <- 공분산을 표준화 한것

# 공분산이 방향은 알려주지만 관계의 정도를 파악하긴 곤란 두 변수사이의
# 단위차이가 있을 수있기때문 (ex)x:cm , y:M)
# => 평균(0)을 기준으로 -1 ~ 1사이에 값으로 표준화 = 상관계수

# 공분산 분자 / 두 변수의 분산의 곱에 루트값을 분모로

cor(1:5, 2:6) #  1 = 편차가 전혀없음 완전 양의 상관관계
cor(1:5, 5:1) # -1 = 편차가 전혀없음
cor(1:5, c(50,40,30,20,10)) # -1
cor(1:5, c(500,400,300,200,100)) # -1 

# 아버지와 아들 키의 데이터로 상관분석
hf <- read.csv("testdata/galton.csv", header =T)
head(hf, 3)
str(hf)
dim(hf) # 총898의 6열
summary(hf)

hf_man <- subset(hf, sex=='M')
dim(hf_man) #총 456개의 6열
hf_man <- hf_man[c('father', 'height')]
dim(hf_man) #총 456개의 2열
head(hf_man, 3)

mean(hf_man$father) # 아빠키의 평균
sd(hf_man$father) # 아빠키의 표준편차

mean(hf_man$height)# 아들키의 평균
sd(hf_man$height) # 아들키의 표준편차 /데이터분석에선 분산을 많이씀 : 값이커서 극단적

# 두 변수의 관계를 파악 : 공분산

# 수식을 써서 공분산 구함 
# 공분산 수식 =두개의 변수 전체편차의합을 구하고 각 변수의 합을 전체갯수-1로 나눈것
# 편차 = 값 - 평균값
f_mean <- mean(hf_man$father) # 평균
s_mean <- mean(hf_man$height) # 평균
cov_sum <- sum((hf_man$father - f_mean) *(hf_man$height -s_mean)) #hf_man$father -f_mean =편차
cov_xy <- cov_sum / (nrow(hf_man) - 1)
cov_xy # 공분산

# 공분산 함수 사용
cov(hf_man$father, hf_man$height) # 공분산

# 두 변수의 관계를 파악 : 공분산을 표준화한 상관계수
# 표준화 공식: 공분산/ 표준편차x * 표준편차y
r_xy <- cov_xy / (sd(hf_man$father) * sd(hf_man$height))
r_xy
# 공분산 표준화 함수 사용
cor(hf_man$father, hf_man$height)

#아들의 키가 아버지의 영향이 있으므로 y 에 아들키 height
#    x ~ y  영향을 주는변수: 독립변수 x / 영향을 받는 변수 : 종속변수 y
plot(height ~ father, data=hf_man, xlab='아버지 키', ylab='아들 키')

# 평균 추세선 =회귀선 = y= wx +b/ w(기울기) x(x값) b(y절편)
# 최소 제곱법 = 절편과 기울기 구하기
abline(lm(height ~ father, data=hf_man), col='red', lwd=4)

# 상관계수 결정
cor.test(hf_man$father, hf_man$height, method = 'pearson')
# df = 자유도 ,  p-value < 2.2e-16 <0.05 
# [p-value가 0.05보다 낮으면 좋은거] ->회귀선이 의미가 있다. 
# -> 의미있는 상관분석이라 할 수있다.
# 95 percent confidence interval <- 95% 신뢰구간





    
