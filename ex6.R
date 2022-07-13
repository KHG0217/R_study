# 데이터 전처리 (Data Preperocessing)
# 수집 후 가공 : 직접 입력, 파일 , DB, log data ...

stu <- read.csv("testdata/ex_studentlist.csv", fileEncoding = 'utf-8')
head(stu, n=3)
names(stu)

install.packages("dplyr")
library(dplyr)

# 조건에 의해 데이터 추출 dplyr:: 출처
# dplyr::filter(df, 조건1, 조건2)
filter(stu, gender=='남', grade==2)  # and 조건
filter(stu, gender=='남'| grade==2)  # or 조건
length(filter(stu, gender=='남'| grade==2)) # 건수 8개

# select()
select(stu,name,age)
select(stu,name:age) # name ~ age 
select(stu,-(name:age)) # name ~ age 칼럼 빼고고

# arrange()
arrange(stu, age) # 나이가 어린순으로, 기본 오름차순
arrange(stu, desc(age)) # 나이가 많은순, desc 내림차순으로 만들어 준다.
arrange(stu, gender,grade) # 성별 (사전순), 학급 낮은순 = 정렬 복수 가능

# 함수 연속적으로 사용하기 (파이프 연산자 사용 %>%  컨트롤+쉬프트+m) 
stu %>% filter(grade ==1)
stu %>% filter(grade !=1)
stu %>% filter(height >=170.0 & grade ==2 ) # and
stu %>% filter(height >=170.0 | grade ==2) # or
stu %>% filter(grade %in% c(1,2) ) # grade가 1,2 만 출력력 

stu %>% select(name, bloodtype)
stu %>% select(-name, -bloodtype)

stu %>% filter(grade ==1) %>%  select(gender,name) %>% head(2) # 조건 연달아 작성 가능




