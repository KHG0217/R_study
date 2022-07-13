# 친밀도, 적절성, 만족도, 변수로 상관분석하기

data <- read.csv("testdata/drinking_water.csv")

head(data, 3)
str(data)

#cov 상관관계 공분산
cov(data$친밀도, data$적절성) #0.4164218 양의 관계
plot(data$친밀도, data$적절성)
cov(data)

#cor 공분산 표준화:상관계수 값

cor(data$친밀도, data$적절성) # 0.4992086 약한 상관관계
cor(data, method = 'pearson')

symnum(cor(data, method = 'pearson')) # 상관계수를 시각화

install.packages("corrgram")
library(corrgram)

corrgram(data) # 생의 농도로 상관관계가 강한지 약한지 보여줌
corrgram(data, upper.panel = panel.conf) # 주대각을 기준으로 위쪽을 수치로 보여줌
corrgram(data, lower.panel = panel.conf) # 주대각을 기준으로 아래쪽을 수치로 보여줌

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(data, histogram = , pch='+') 

