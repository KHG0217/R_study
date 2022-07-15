# Logistic Regression : 분류 모델
# 독립변수 : 연속형, 종속변수 : 범주형
# 로직 변환을 한 후,시그모이드 함수를 사용해서 결과를 0 or 1로 출력한다.

# 연습문제 
mydata <- read.csv("testdata/logit_data.csv")
head(mydata, n=3)
# exam grade rank로 pass를 판정
str(mydata)
dim(mydata)
summary(mydata)



# pass에 대한 rank 빈도수
#       x             y
table(mydata$pass, mydata$rank)
xtabs(formula = ~pass + rank, data = mydata)

# 데이터 분리 : train/ test 보통: 7:3 = 모델의 과적합(overfitting) 방지
set.seed(1) # 매번 다르게 나오는것을 방지
idx <- sample(1:nrow(mydata), nrow(mydata) * 0.7) # 뺴내l고 끝: 비복원 추출
idx # 400개중에 랜덤하게 70%를 뽑은것 (인덱스만)
length(idx)
train <- mydata[idx, ] #열은 전부
test <- mydata[-idx, ] 
head(train, 10)
head(test, 10)
dim(train); dim(test) # 학습할땐 train 평가할떈 test = 분류모델에선 절대적으로 해야함

# 로지스틱 회귀 모델
lgmodel <- glm(formula = pass ~., data = train, family = binomial(link = 'logit')) #학습
# binomial(link = 'logit') 두가지로 분류할때?
lgmodel
summary(lgmodel)

# 모델 성능 파악
pred <- predict(lgmodel, newdata = test, type = 'response') # 검증할 데이터를 넣기
head(pred, n=10) # 0.5를 기준으로 넘은것은(1) 합격 아닌건(0) 불합격

cat('예측값: ', head(ifelse(pred > 0.5, 1, 0), 10))
cat('실제값 :', head(test$pass, n=10))

# 분류 정확도 계산 
result_pred <- ifelse(pred > 0.5, 1, 0)
t <- table(result_pred, test$pass) # 맞은것과 틀린것을 표로 알 수있다.  / 맞은것 주대각
t

# 정확도 구하기 3가지 방법
( 77 + 11)/ nrow(test) # 분류 정확도 맞은것/평가 데이터 총합
(t[1,1] + t[2,2]) / nrow(test)
sum(diag(t)) /nrow(test) # 주대각합을 /평가 테이터 총합으로 나눔

# 새로운 값으로 분류

new_data <- train[c(1:3), ]
new_data <- edit(new_data)
new_data


new_pred <- predict(lgmodel, newdata = new_data, type = 'response')
new_pred
ifelse(new_pred > 0.5, '합격', '불합격')
