@echo off
setlocal enabledelayedexpansion

:: Define folders to EXCLUDE
set "exclude_list=mpairraces mpbiker mpchristmas2 mpheist mplowrider mpluxe mpluxe2 mppatchesng mpspecialraces mpstunt"

echo Searching for and deleting folders that start with "mp" (excluding the defined ones)...
echo.

for /d %%d in (mp*) do (
    set "folder_name=%%d"
    set "excluded=false"
    for %%e in (%exclude_list%) do (
        if /i "!folder_name!"=="%%e" (
            set "excluded=true"
            goto :next_folder
        )
    )

    if "!excluded!"=="false" (
        echo Deleting folder: "%%d"
        rmdir /s /q "%%d"
    )
    :next_folder
)

echo.
echo Process completed.
pause
