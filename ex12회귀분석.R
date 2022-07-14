# 단순 선형회귀 : 원격 DB의 jikwon table 자료로 근무년수에 대한 연봉 예측용 모델 작성
install.packages("lubridate")
library(lubridate)

now_year <- year(Sys.time())
now_year
typeof(now_year)

library(RJDBC)        # DBI,rJava 같이 로딩 
drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver", 
            classPath = "C:/work/rsou/mariadb-java-client-2.6.2.jar")

conn <- dbConnect(drv = drv, "jdbc:mysql://127.0.01:3306/test","root","maria123")
dbListTables(conn)

# select date_format(now(),%Y) - date_format(jikwon_ibsail,%Y) + 1 as ibsa
query <- "select substr(jikwon_ibsail, 1, 4) as ibsa from jikwon"
jik_ibsail <-dbGetQuery(conn,query)
head(jik_ibsail, n=2)

typeof(jik_ibsail) # list

jik_ibsail <- as.numeric(unlist(jik_ibsail)) # list 해제, number로 변경
typeof(jik_ibsail) # double

jik_workyear <- now_year - jik_ibsail
jik_workyear    # 근무년수

query <- "select jikwon_pay from jikwon"
jik_pay <- dbGetQuery(conn, query)
typeof(jik_pay)

jik_pay <- as.numeric(unlist(jik_pay))
typeof(jik_pay)

jikwon_df <- data.frame(jik_workyear, jik_pay)
head(jikwon_df, n=2)

cor(jikwon_df$jik_workyear, jikwon_df$jik_pay) #0.9196725

# 종속변수 x:jikwon_df$jik_workyear , 독립변수 y:jikwon_df$jik_pay pay가 영향을 받음

model <- lm(formula = jik_pay ~ jik_workyear, data=jikwon_df )
summary(model) #p-value: 6.943e-13 <0.05 이므로 유의한 모델
# Multiple R-squared:  0.8458  설명력도 84%

plot(jikwon_df$jik_workyear, jikwon_df$jik_pay, xlim = c(0,20), ylim = c(100,150000))
abline(model, col='red', lwd=2)

jik_pay_func <- function(){
  cat('근무년수 입력')
  work_year <- scan() #키보드로 값을 받을때
  predpay <- predict(model,data.frame(jik_workyear = work_year))
  cat('근무년수 :', work_year, '\n')
  cat('예상연봉 :', round(predpay), '\n')
  
  plot(jikwon_df$jik_workyear, jikwon_df$jik_pay, xlim = c(0,20), ylim = c(100,150000))
  abline(model, col='red', lwd=2)
  points(work_year,round(predpay),col="blue", lwd=3, pch=23 )
}

jik_pay_func()
