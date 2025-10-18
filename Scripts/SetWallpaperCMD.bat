@echo off
echo Mengubah wallpaper menggunakan RUNDLL32...

rem Set wallpaper lewat registry
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\testw\Scripts\windows-11-dark-mode.png" /f

rem Refresh wallpaper
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

rem Jika perlu, tambahkan delay supaya wallpaper diterapkan sebelum lanjut
timeout /t 0 /nobreak >nul

echo Wallpaper berhasil diubah.
