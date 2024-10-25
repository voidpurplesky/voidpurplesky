```
<!-- 	<logger name="jdbc.audit">
		<level value="warn" />
	</logger>
	<logger name="jdbc.connection">
		<level value="warn" />
	</logger>
	<logger name="jdbc.resultset">
		<level value="warn" />
	</logger> -->
	<!-- Root Logger -->
```

```
	<logger name="jdbc.sqlonly" additivity="false"> 
		<level value="info"/> 
		<appender-ref ref="console"/> 
	</logger>
	<logger name="jdbc.sqltiming" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/> 
	</logger>
	<logger name="jdbc.audit" additivity="false"> 
		<level value="warn"/>  
		<appender-ref ref="console"/> 
	</logger> 

	<logger name="jdbc.resultset" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/> 
	</logger>

	<logger name="jdbc.resultsettable" additivity="false"> 
		<level value="info"/>  
		<appender-ref ref="console"/> 
	</logger> 
```

# sql관련
sqlonly와 sqltiming은 sql로그를 찍는 공통적인 기능을 하며 sqltiming이 sqlonly를 포함하고 있습니다.

#{id} 등 파라미터로 넣어준 값도 모두 치환하여 출력해줍니다.

둘다 찍도록 하면 sql문이 두번 찍히니 하나만 찍어줍니다.
- jdbc.sqlonly : SQL문을 로그로 남깁니다.
- jdbc.sqltiming : SQL문과 수행된 시간을 로그로 남깁니다.
```
INFO : jdbc.sqlonly - select rno, no, content, id, writedate, name from ( select rownum rnum, rno, no, content, id, 
writedate, name from ( select b.rno, b.no, b.content, b.id, b.writedate, m.name from board_reply 
b, member m where m.id = b.id and b.no = 61 order by rno desc ) ) where rnum between 1 and 
10 
```

# TABLE관련
- jdbc.resultsettable : SQL 결과 조회된 데이터를 table 형식으로 만들어줍니다.
```
INFO : jdbc.resultsettable - 
|----|---|--------------|----|----------------------|------|
|rno |no |content       |id  |writedate             |name  |
|----|---|--------------|----|----------------------|------|
|28  |61 |5555555555555 |id1 |2024-10-15 12:33:23.0 |name1 |
|27  |61 |cvxvxcv       |id1 |2024-10-15 12:30:09.0 |name1 |
|26  |61 |dfdffd        |id1 |2024-10-15 12:28:19.0 |name1 |
|25  |61 |dgz           |id1 |2024-10-15 11:23:59.0 |name1 |
|2   |61 |질문있습니다.2      |id1 |2024-10-14 11:28:47.0 |name1 |
|1   |61 |질문있습니다.       |id2 |2024-10-14 09:47:38.0 |name2 |
|----|---|--------------|----|----------------------|------|

```

```
INFO : jdbc.connection - 3. Connection closed
INFO : jdbc.connection - 11. Connection opened
INFO : jdbc.connection - 9. Connection closed
INFO : jdbc.connection - 12. Connection opened
```

# JDBC호출관련
일반적으로 킬 필요가 없는 설정, ResultSet을 포함하느냐 않느냐의 차이
- jdbc.audit : ResultSet을 제외한 JDBC 호출 정보를 로그로 남긴다. 
 - jdbc.resultset : ResultSet을 포함한JDBC 호출 정보를 로그로 남깁니다.