@echo off
echo ========================================
echo 组合产品管理子系统快速启动脚本
echo ========================================

echo.
echo 1. 检查数据库连接...
echo 请确保MySQL服务已启动，并已创建advisor_system数据库

echo.
echo 2. 初始化数据库表结构...
echo 如果尚未初始化，请运行：init_portfolio_product_system.bat

echo.
echo 3. 启动后端服务...
echo 正在启动Spring Boot应用...
start "后端服务" cmd /k "mvn spring-boot:run"

echo.
echo 4. 等待后端服务启动...
timeout /t 10 /nobreak > nul

echo.
echo 5. 启动前端服务...
echo 正在启动Vue开发服务器...
cd advisor-vue
start "前端服务" cmd /k "npm run dev"

echo.
echo ========================================
echo 组合产品管理子系统启动完成！
echo ========================================
echo.
echo 服务地址：
echo - 后端API: http://localhost:8080
echo - 前端页面: http://localhost:5173
echo.
echo 功能模块：
echo - 组合产品列表: http://localhost:5173/portfolio-product
echo - 产品创建和编辑
echo - 产品业绩管理
echo - 产品文档管理
echo.
echo 测试账号：
echo - 用户名: admin
echo - 密码: 123456
echo.
pause 