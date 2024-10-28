StockWebApplication
spring boot 2.7.18
mybatis 2.3.2

build.gradle
web
lombok
devtools솔직히잘안씀

```
    implementation 'org.springframework.boot:spring-boot-starter-web'
    //implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:3.0.3'
    //implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.2'
    compileOnly 'org.projectlombok:lombok'
    developmentOnly 'org.springframework.boot:spring-boot-devtools'
    //runtimeOnly 'com.oracle.database.jdbc:ojdbc11'
    annotationProcessor 'org.projectlombok:lombok'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    //testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:3.0.3'
    //testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:2.3.2'
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
```
mybatis있으면 url입력하라함

```
    implementation 'org.springframework.boot:spring-boot-starter-web'
    compileOnly 'org.projectlombok:lombok'
    developmentOnly 'org.springframework.boot:spring-boot-devtools'
    annotationProcessor 'org.projectlombok:lombok'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
```

https://barbera.tistory.com/47

설정>고급 설정
Setting>Advanced Settings>

컴파일러
V 개발된 애플리케이션이 현재 실행 중인 경우에도 auto-make가 시작되도록 허용
Complier
Allow auto-make to start even if developed application is currently running

빌드, 실행, 배포 > 컴파일러
V 빌드 완료 시 알림 표시
Build, Execution, Deployment>Compiler
Build project automatically


데이터 소스 잡아줄때 gradle에 oracle 불러오고 나서 하기
+ runtimeOnly 'com.oracle.database.jdbc:ojdbc11'

spring.datasource.driver-class-name=oracle.jdbc.OracleDriver
spring.datasource.url=jdbc:oracle:thin;@localhost:1521/xe
spring.datasource.username=java
spring.datasource.password=java

자동 리로딩 설정
옵션 수정 > 'Update 작업 시' > 3. 클래스 및 리소스 업데이트
On 'Update' action > 3. Update classes and resources

자동으로 빌드와 배포


## Lombok을 테스트 환경에서도 사용하기 408
testCompileOnly 'org.projectlombok:lombok'
    testAnnotationProcessor 'org.projectlombok:lombok'

## 로그 레벨의 설정
기본적으로 Log4j2가 추가되어 있다


11g Express Edition 11.2.0.2.0

DBMS: Oracle(버전 Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production)
대/소문자 구분: 일반=upper, 구분자 추가=exact
드라이버: Oracle JDBC driver(버전 11.2.0.4.0, JDBC11.2)

Ping: 97ms

sqlplus

SQL*Plus: Release 11.2.0.2.0

