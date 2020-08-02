@echo off
set file=images
if exist %file% (
    echo %file% found.
    for /f "tokens=1,2 delims==" %%i in (%file%) do (
        echo pulling %%j ...
        docker pull %%j
        docker tag %%j %%i
        docker rmi %%j
    )
) else (
    echo %file% not found.
)
pause
