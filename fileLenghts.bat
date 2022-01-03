@ECHO OFF

rem https://ss64.org/viewtopic.php?pid=6478

::Drive to scan. Modify as needed
SET drive=C:\
REM SET drive=%userprofile%\desktop\cnc_cpu

:: Maximum path length
SET maxlen=220

:: List all files and save to current user's desktop
REM dir /S/B %drive% >> %userprofile%\desktop\lengths.txt
FOR /F %%i in ('DIR %drive% /S /B') do (
    setlocal EnableDelayedExpansion
    CALL :strlen4 %%i strlen
    REM ECHO %%i !strlen! >> %userprofile%\desktop\lengths.txt
    if !strlen! GTR %maxlen% echo %%i !strlen! >> %userprofile%\desktop\lengths.txt
    ENDLOCAL
)

:strlen4  StrVar  [RtnVar]
  SETLOCAL EnableDelayedExpansion
  SET "tempFile=%temp%\strlen%random%.tmp"s
  ECHO(!%~1!>"%tempFile%"
  REM FOR %%F in ("%tempFile%") do SET /a len=%%~zF-2
  FOR %%F in ("%tempFile%") do SET /a len=%%~zF
  DEL "%tempFile%"
  ENDLOCAL&IF "%~2" neq "" (SET %~2=%len%) ELSE ECHO %len%
exit /b
