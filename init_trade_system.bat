@echo off
echo ========================================
echo 交易管理子系统初始化脚本
echo ========================================

echo.
echo 正在创建交易管理数据库表...
mysql -u root -p123456 advisor_boot < src/main/resources/sql/trade_management_tables.sql

if %errorlevel% neq 0 (
    echo 错误：创建数据库表失败！
    pause
    exit /b 1
)

echo.
echo 正在插入测试数据...
mysql -u root -p123456 advisor_boot < src/main/resources/sql/trade_management_data.sql

if %errorlevel% neq 0 (
    echo 错误：插入测试数据失败！
    pause
    exit /b 1
)

echo.
echo ========================================
echo 交易管理子系统初始化完成！
echo ========================================
echo.
echo 已创建以下功能模块：
echo - 交易账户管理
echo - 交易订单管理
echo - 交易成交管理
echo - 持仓管理
echo - 资金流水管理
echo - 风险控制管理
echo - 交易统计管理
echo.
echo 前端页面：
echo - /trade/accounts - 交易账户管理
echo - /trade/orders - 交易订单管理
echo.
echo 请启动后端和前端服务进行测试
echo.
pause 