$ErrorActionPreference = "Stop"
try {
    $localPath = "D:\a\testw\testw\windows-11-dark-mode.png"
    Add-Type @"
        using System.Runtime.InteropServices;
        public class WallpaperSetter {
            [DllImport("user32.dll", SetLastError = true)]
            public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        }
"@

    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -Value $localPath
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -Value 10
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -Value 0
    [WallpaperSetter]::SystemParametersInfo(0x0014, 0, $localPath, 0x0001 -bor 0x0002) | Out-Null
}
catch {
    Write-Error "Wallpaper setup failed: $_"
    exit 1
}
