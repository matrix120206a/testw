@echo off
setlocal

:: Tentukan path wallpaper
set wallpaperPath="D:\a\testw\testw\Scripts\windows-11-dark-mode.png"
:: Cek apakah file wallpaper ada
if exist %wallpaperPath% (
    echo Setting wallpaper...

    :: Mengubah registry untuk wallpaper
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d %wallpaperPath% /f
    reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "10" /f
    reg add "HKCU\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d "0" /f

    :: Memperbarui wallpaper dengan RUNDLL32
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

    echo Wallpaper set successfully.
) else (
    echo Wallpaper file not found: %wallpaperPath%.
)

endlocal
