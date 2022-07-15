# 분류분석 모델 중 의사결정나무(DecisionTree)
# 입력 변수 중에서 영향력이 큰 변수를 기준으로 이진분류하여 
# 나무구조 형태의 분류결과를 얻을 수 있다.

# 독립변수, 종속변수는 범주형과 연속형 모두 가능
install.packages("party")
library(party) 

head(airquality, 3) # 뉴욕 지역의 대기질 관련 정보
str(airquality)

#Temp : 종속변수 
air_tree <- ctree(Temp ~ Solar.R + Wind + Ozone, data = airquality)
air_tree # 독립변수 중 가장 처음에 나오는게 가장 영향을 많이 준는 것  Ozone

plot(air_tree)

# iris dataset
head(iris, 3)
summary(iris)

#train/ test split
set.seed(123) # 매번 다르게 나오는것을 방지

idx <- sample(1:nrow(iris), nrow(iris) * 0.7) # 뺴내고 끝: 비복원 추출
idx # 366개중에 랜덤하게 70%를 뽑은것 (인덱스만)
length(idx)
train <- iris[idx, ] # 학습 데이터
test <- iris[-idx, ] # 검정(평가) 데이터

dim(train); dim(test)

# 독립변수를 Species(범주형 데이터)
iris_ctree <- ctree(formula =  Species ~ ., data = train)
iris_ctree

plot(iris_ctree, type='simple')
plot(iris_ctree)

# 성능 파악
pred <- predict(iris_ctree, test)
pred 

t <- table(pred,test$Species)
t

sum(diag(t)/nrow(test))

install.packages("caret")
library(caret)

confusionMatrix(pred, test$Species) # 예측값, 실제값값

# 새값으로 분류
newf <- iris[1,]
newf
newf$Sepal.Length <- 7
newf$Sepal.Width <- 8
newf$Petal.Length <- 7
newf$Petal.Width <- 8

newf

predict(iris_ctree, newf) # [1] virginica
