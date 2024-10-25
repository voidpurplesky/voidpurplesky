스프링 관련: spring-jdbc, spring-tx
Mybatis 관련: mybatis 3.4.6(latest: 3.5.16), mybatis-spring 1.3.2(latest: 3.0.4)
`pom.xml`
```xml
        <dependency>
		    <groupId>org.mybatis</groupId>
		    <artifactId>mybatis</artifactId>
		    <version>3.4.6</version>
		</dependency>
		<dependency>
		    <groupId>org.mybatis</groupId>
		    <artifactId>mybatis-spring</artifactId>
		    <version>1.3.2</version>
		</dependency>
```
`root-context.xml`
Namespace V mybatis-spring
```xml
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="dataSource"></property>
	</bean>
```
`+ Interface : org.zerock.mapper.TimeMapper`
```java
package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface TimeMapper {

	@Select("select sysdate from dual")
	public String getTime();
}
```

