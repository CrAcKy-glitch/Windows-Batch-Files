@echo off

set "audio_file=C:\Users\ansha\OneDrive\Desktop\personal\Recording.wav"
set BATTERY_LEVEL=85
echo Starting battery check loop...

:loop


for /f "tokens=1-2 delims==" %%a in ('wmic path Win32_Battery Get EstimatedChargeRemaining /value ^| findstr "="') do set "%%a=%%b"

set /a "CHARGE_LEVEL= %EstimatedChargeRemaining%"

echo Battery level is %CHARGE_LEVEL%%.
timeout /t 3 /nobreak > nul
::if WMIC Path Win32_Battery Get BatteryStatus(
echo "charging"
if %CHARGE_LEVEL% geq %BATTERY_LEVEL% (
echo Playing audio file: %audio_file%
start "" "%audio_file%"
timeout /t 3 /nobreak > nul
)
::)

timeout /t 30 /nobreak > nul

goto loop