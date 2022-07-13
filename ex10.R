# 회귀분석 모델을 작성 
# 적정한 추세선을 만들기 위한 수식을 완성을 해줌. :) y = f(x)/ t =wx + b w:기울기,y:절편

# 미국 여성 데이터 (height, weight)를 사용해 회귀모델을 작성
# 미지의 경험하지 않은 height를 입력하여 몸무게를 예측하기.

str(women) 
dim(women)

#둘다 숫자,숫자 

#상관계수 이용 (공분산을 표준화한것)
cor(women$height, women$weight) # r:0.9954948
cor.test(women$height, women$weight) # 상관관계가 의미가 있는지 먼저 확인 p -value
plot(weight ~ height, data=women)

# 영향을 주는 변수(독립변수 = height) / 영향을 받는 변수 (종속변수 = weight)
# 인과관계는 있는지 확인 ? 개발자 판단 height가 weight에 영향을 주는것으로 판단.

#조건이 만족되었으므로 회귀 분석 모델을 작성을 한다.
# y = wx + b : 이 수식 얻기

#최소자승법 함수 사용하기
mfit <- lm(formula = weight ~ height, data=women) # 전통적 기계학습 알고리즘 모델을 이용하고 있다.
#  slope(기울기):3.45 / bias(절편): -87.52 y_hat(예측값) =3.45 * x + -87.52 x:예측할 값(여기선 weight)
mfit # <-model
abline(mfit, col='blue')
head(women)

pred1 <-3.45 * 58 + -87.52 # 실제값 115 예측결과값 :112.58
cat('예측 결과: ', pred1)

pred2 <-3.45 * 63 + -87.52 # 실제값 129 예측결과값 :129.83 
cat('예측 결과: ', pred2) 

#경험한적이 없는 새로운 hight값에 대한 weight?

# new_x <- 33
new_x <- 77
new_pred <- 3.45 * new_x + -87.52
cat('새예측 결과: ', new_pred)

summary(mfit) # 모델에 대한 요약 통계량 
#    최소  25~50   중간     50~75    최대
#    Min      1Q  Median      3Q     Max 
#-1.7333 -1.1333 -0.3833  0.7417  3.1167 

#p-value: 1.091e-14 <- 0.05보다 작으면 쓸수 o

# 독립변수 한개일때 R-squared : 결정계수(설명력) 
#Multiple R-squared:  0.991 : 독립변수 height 분산이 -> 종속변수 weight의 분산을 99%정도 설명할 수 있다.
# 독립변수 여러개일때 Adjusted R-squared




# 회귀분석모형의 적절성을 위한 조건 : 
# 아래의 조건 위배 시에는 변수 제거나 조정을 신중히 고려해야 함.

# 1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
# 2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다. (나이, 주민,학년 비슷함 x)
# 3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
# 4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
# 5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.


# 회귀분석모형의 적절성을 위한 조건을 시각화로 확인
par(mfrow = c(2,2))
plot(mfit)
# Residuals vs Fitted = 선형성을 알 수 있는 차트
# 패턴이 보임 좋은 차트 x

#Normal Q-Q = 정규성을 알 수 있는 차트 
#일부의 데이터가 바깥으로 빠져나가고 있다. 1번과 15번데이터 
# 좋은 차트x

# Scale-Location = 등분산성을 알 수있는 차트 (평평한차트일수록 좋은것)

#Residuals vs Levearage 
# Cook's didstance 이상치(아웃라이어)를 알려줌 
# 이상치(아웃라이어) : ex)우리반에 서장훈 한명 (평균에 지장을줌)
# 여기선 1과 15가 아웃라이어 인것 같다고 알려주고 있다.





