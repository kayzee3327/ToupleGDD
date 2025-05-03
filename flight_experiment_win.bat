@echo off
setlocal enabledelayedexpansion

mkdir ans

for /l %%i in (1,1,20) do (
    echo 正在执行第 %%i 次循环...
    
    rem 创建目标文件夹
    mkdir "ans\ans_%%i" 2>nul
    
    rem 运行Python脚本
    python main.py --graph flight_delay_data --model Tripling --model_file tripling.ckpt --budget 150 --test --dismantle
    
    rem 复制CSV文件到目标文件夹
    if exist "ans\*.csv" (
        copy "ans\*.csv" "ans\ans_%%i\" >nul
    ) else (
        echo 警告：第%%i次循环未找到CSV文件
    )
    
    echo 完成第 %%i 次循环
    echo --------------------------
)

echo 所有20次循环执行完成！
endlocal