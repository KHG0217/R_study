# 분류모델 중 Random Forest  : 앙상블 학습기법 - DecisionTree를 복수개 사용
# 정확도가 우수

install.packages("randomForest")
library(randomForest)

set.seed(123) # 매번 다르게 나오는것을 방지

idx <- sample(1:nrow(iris), nrow(iris) * 0.7) # 뺴내고 끝: 비복원 추출
idx # 366개중에 랜덤하게 70%를 뽑은것 (인덱스만)
length(idx)
train <- iris[idx, ] # 학습 데이터
test <- iris[-idx, ] # 검정(평가) 데이터

dim(train); dim(test)

head(iris, 2)
model <- randomForest(Species ~ ., data = train)
model #Number of trees: 500 tree를 500개 사용하고 있다.

# 학습시 파라미터를 조정해서 모델 작성 
model2 <- randomForest(Species ~ ., data = train, ntree = 200, mtry = 3, 
                       na.action = na.omit) # tree = 200개 
model2

# 중요변수 알아내기
model3 <- randomForest(Species ~ ., data = train, na.action = na.omit,
                       importance = T) 
# importance = T
importance(model3) 
#MeanDecreaseGini: 가장큰 숫자일수록 중요변수임을 알 수 있다.

varImpPlot(model3)

# 모델평가
pred <- predict(model3, test)
t <- table(observed = test[,'Species'],predict=pred) #observed 관찰값 ,predict:실제값
t

prop.table(t, margin = 1) # 비율로 보기 

sum(diag(t)/nrow(test)) # 분류정확도 : 0.9777778


# 새값으로 분류
newf <- iris[1,]
newf
newf$Sepal.Length <- 7
newf$Sepal.Width <- 8
newf$Petal.Length <- 7
newf$Petal.Width <- 8

predict(model3, newf) # [1] virginica
