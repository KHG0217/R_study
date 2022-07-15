# ANN(Artifical Neural Net Work): 인공신경망

install.packages("nnet")
library(nnet)

# 논리 연산 

input <- matrix(c(0,0,1,1,0,1,0,1), ncol= 2)
input

# output <- matrix(c(0,0,0,1)) # 답지 and 연산자학습
# output <- matrix(c(0,1,1,1)) # 답지 or 연산자학습
output <- matrix(c(0,1,1,0)) #  답지 xor 연산자 두개숫자가 다를때 1
output

ann <- nnet::nnet(input, output, maxit=1000, size=2, decay=0.001)
ann #2-2-1 2개의 입력값이 들어와서 2개에 뉴런을 이용해서 1개의 확률 값을 반환 학습
#maxit 학습량, size 뉴런갯수 decay 학습률 / 
# maxit로 학습량을 늘려줘야 답을 맞춤
# 학습횟수를 많이 늘리게 하면 소비가 심해짐. / 적당한 학습횟수가 필요

result <- predict(ann, input)
result
ifelse(result >0.5,1,0)


#iris dataset

# train / test 분리작업
set.seed(12) # 매번 다르게 나오는것을 방지

idx <- sample(1:nrow(iris), nrow(iris) * 0.7) # 뺴내고 끝: 비복원 추출
idx # 366개중에 랜덤하게 70%를 뽑은것 (인덱스만)
length(idx)
train <- iris[idx, ] # 학습 데이터
test <- iris[-idx, ] # 검정(평가) 데이터

dim(train); dim(test) 
# 4-1-3 4개의 입력값이 들어가서 1나의 뉴런으로 3개의 확률 값을 반환
install.packages("devtools")
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')
model_ir <- nnet::nnet(Species ~.,maxit = 100, train, size = 1) # 뉴런(node) 1개
model_ir
summary(model_ir)
plot.nnet(summary(model_ir))

model_ir2 <- nnet::nnet(Species ~.,maxit = 100, train, size = 5) # 뉴런(node) 5개
model_ir2
summary(model_ir2)
plot.nnet(summary(model_ir2))


pred <- predict(model_ir2 , test ,type ="class") # 값이 3개니까 class
t <- table(pred,test$Species)
t
sum(diag(t)/nrow(test))
