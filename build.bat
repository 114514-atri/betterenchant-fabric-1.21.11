@echo off
setlocal
REM Loom 1.18 needs JDK 25+ to run Gradle; the mod still targets Java 21 bytecode.
set "JAVA_HOME=%USERPROFILE%\AppData\Roaming\.minecraft\runtime\java-runtime-epsilon"
if not exist "%JAVA_HOME%\bin\java.exe" (
  echo Set JAVA_HOME to a JDK 25+ installation, then re-run.
  exit /b 1
)
set "PATH=%JAVA_HOME%\bin;%PATH%"
REM Isolate from machine GRADLE_USER_HOME that may pin an older JDK
set "GRADLE_USER_HOME=%~dp0.gradle-home"
if not exist "%GRADLE_USER_HOME%" mkdir "%GRADLE_USER_HOME%"
echo org.gradle.java.home=%JAVA_HOME:\=/% > "%GRADLE_USER_HOME%\gradle.properties"
call "%~dp0gradlew.bat" %*
exit /b %ERRORLEVEL%
