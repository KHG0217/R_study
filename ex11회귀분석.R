# 단순 선형회귀 : cars sataset 사용 숫자,숫자 변수
head(cars)
str(cars)
summary(cars)

cor(cars$speed, cars$dist) #0.8068949 양의 상관관계 (공분산 표준화)

# 인과관계? 독립변수(x : speed) , 종속변수(y:dist)
model <- lm(formula =  dist ~ speed, data= cars)
model       # 수식 t = wx + b    y = 3.932  *  x + -17.579
cat('학습에 사용된 실제 dist 값 :', cars$dist[1:10]) # 답지
cat('speed로 모델이 예측한 dist값 출력:', round(fitted(model)[1:10]))
cat('잔차 확인: ', residuals(model)[1:10])
confint(model)
summary(model)
cat('모델의 성능(설명력):',summary(model)$r.squared) # Adjusted R-squared:  0.6438 

# 예측값 ---
new_x  <- 10
3.932  *  new_x + -17.579

new_x <- 100
3.932  *  new_x + -17.579

#예측값 함수
predict(model, newdata = data.frame(speed=100)) # data.frame(y값)
predict(model, newdata = data.frame(speed=c(5, 10, 15))) # data.frame(y값)
 