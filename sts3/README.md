# sts3

STS.ini
```
-vm
C:\Program Files\Java\jdk-11.0.24\bin\javaw.exe
-Dfile.encoding=utf-8
```
추가
```
-startup
plugins/org.eclipse.equinox.launcher_1.6.300.v20210813-1054.jar
--launcher.library
plugins/org.eclipse.equinox.launcher.win32.win32.x86_64_1.2.300.v20210828-0802
-product
org.springsource.sts.ide
--launcher.defaultAction
openFile
-vm
C:\Program Files\Java\jdk-11.0.24\bin\javaw.exe
-vmargs
-Dosgi.requiredJavaVersion=11
-Dosgi.dataAreaRequiresExplicitInit=true
-Xms256m
-Xmx2048m
--add-modules=ALL-SYSTEM
-Dosgi.module.lock.timeout=10
-Dfile.encoding=utf-8
```
- STS3
- Spring legacy: 5.0.7
- JDK: 11
- Tomcat: 9
- Maven(pom.xml)

- Servlet 2.5

- Port: 80
Run/Debug > Console > Console buffer size (characters): 80000 -> 1000000

## lombok
java -jar lombok.jar
- STS.ini
`-javaagent:C:\sts3\lombok.jar`


root-context.xml
- beans
- context 


