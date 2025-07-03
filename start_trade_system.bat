@echo off
echo ========================================
echo 交易管理子系统启动脚本
echo ========================================

echo.
echo 正在启动后端服务...
start "Spring Boot Backend" cmd /k "mvn spring-boot:run"

echo.
echo 等待后端服务启动...
timeout /t 10 /nobreak > nul

echo.
echo 正在启动前端服务...
cd advisor-vue
start "Vue Frontend" cmd /k "npm run dev"

echo.
echo ========================================
echo 交易管理子系统启动完成！
echo ========================================
echo.
echo 后端服务地址：http://localhost:8080
echo 前端服务地址：http://localhost:5173
echo.
echo 交易管理功能：
echo - 交易账户管理：http://localhost:5173/trade/accounts
echo - 交易订单管理：http://localhost:5173/trade/orders
echo.
echo 按任意键退出...
pause > nul 