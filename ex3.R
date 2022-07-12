# 도수분포표 작성 : 빈도수를 표로 출력
df <- utils::read.csv("testdata/ex_studentlist.csv") # utils 패키지에서 가져왔다고 정확히 작성 ::
df
head(df, n=2)
str(df)

# 명목형 (명목척도) 데이터로 빈도수 구하기
table(df$gender)
table(df$gender, df$bloodtype) # 성별, 혈액형 별 빈도 수 
freq <- table(df$bloodtype)
freq
class(freq)

rfreq <- prop.table(freq) # 상대도수(비율) 얻기
rfreq

rtable <- rbind(freq, rfreq) # 수와 퍼센트
rtable

rtable <- addmargins(rtable, margin = 2) # 합구하기/ margin =  1: 작업의바향 :열 방향 2(행방향)
rtable

# 연속형 (비율척도) 데이터로 빈도수 구하기
df$height
factorHeight <- cut(df$height, breaks = 4) # 4구간으로 자르기
factorHeight  #()포함 이상,이하, [] 포함하지 않는것 초과,미만

freqHeight <- table(factorHeight)
freqHeight

freqHeight <- rbind(freqHeight,prop.table(freqHeight)) # prop.tabe:테이블에 추가하/기 비율 구하기
freqHeight

rownames(freqHeight)[2] <- "realHeight" # rowname 바꾸기
freqHeight

cumfreq <- cumsum(freqHeight[2,]) # 누적 상대도수수 구하기
cumfreq

freqHeight <- rbind(freqHeight,cumfreq) # 비율 구하기
freqHeight
rownames(freqHeight) <- c('빈도수','상대도수','누적도수')
freqHeight

freqHeight <- addmargins(freqHeight, margin = 2)
freqHeight
