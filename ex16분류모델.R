# 로지스틱회귀 분류 분석 모델
# 날씨 관련 정보를 이용해 비 유무 판단 
weather <- read.csv("testdata/weather.csv")
head(weather, n=3)
dim(weather)
str(weather)

colnames(weather)
weather_df <- weather[, c(-1,-6,-8,-14)]
head(weather_df, n=3)

weather_df[!complete.cases(weather_df), ] # NA(결측값) 값에 있는지 확인
sum(is.na(weather_df)) 
weather_df <- na.omit(weather_df) # NA가 있는 행 제거

# 종속변수 대상인 RainTomorrow(명목척도 변수 ) 변수에 대해 더미변수 처리
# 더미변수 : 범주데이터를  0과 1의 숫자데이터를 부여한다.

weather_df$RainTomorrow[weather_df$RainTomorrow =="Yes"] <- 1
weather_df$RainTomorrow[weather_df$RainTomorrow =="No"] <- 0
head(weather_df, n=3)
unique(weather_df$RainTomorrow) # 중복제거?

str(weather_df) # RainTomorrow : chr -> 숫자로 바꿔줘야함

weather_df$RainTomorrow <- as.numeric(weather_df$RainTomorrow)
str(weather_df) #RainTomorrow : num

# train / test 분리작업
set.seed(12) # 매번 다르게 나오는것을 방지

idx <- sample(1:nrow(weather_df), nrow(weather_df) * 0.7) # 뺴내고 끝: 비복원 추출
idx # 366개중에 랜덤하게 70%를 뽑은것 (인덱스만)
length(idx)
train <- weather_df[idx, ] # 학습 데이터
test <- weather_df[-idx, ] # 검정(평가) 데이터

dim(train); dim(test)

# model
weather_model <- glm(RainTomorrow ~ ., data=train, family =  'binomial') 
summary(weather_model) #Number of Fisher Scoring iterations: 6 : 학습 6번 반복했습니다.

# 모델 성능 확인( 분류 정확도)
pred <- predict(weather_model, newdata = test, type='response')
#  type='response' <- 0~1값이 나오게 하기 위해
cat('예측값:', head(pred, 5))
cat('실제값:', head(test$RainTomorrow, 5))

result_pred <- ifelse(pred >= 0.5, 1, 0)
table(result_pred) # 예측값에대한 빈도표

# Confusion matrix 
a <- table(test$RainTomorrow,result_pred) # 실제값, 예측값으로 빈도표 표현 (실제값이 행)

# 정확도 구하기
(90 + 7) / nrow(test) # accuracy(분류정확도) 0.8807339
sum(diag(a)) /nrow(test) 

# 분류 모델 평가 : ROC curve

install.packages("ROCR")
library(ROCR)

pr <- prediction(pred, test$RainTomorrow) #예측값, 실제값
prf <- performance(pr, measure = 'tpr', x.measure = 'fpr')
plot(prf)

# AUC (Area Under a Roc Curve) : ROC curve의 밑면적을 계산한 값 (0~1)
auc <- performance(pr, measure = 'auc')
auc <- auc@y.values
auc # 0.8918495       0.9 ~ 1 : excellent  , 0.9 ~ 0.8 : good ...

# 새 값으로 예측
m <- train[c(1:3), ]
m <- edit(m)
m
new_pred <- predict(weather_model, newdata = m, type = 'response')
ifelse(new_pred >0.5,'비옴','맑음')

