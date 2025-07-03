@echo off
echo 智能投顾系统启动脚本
echo ====================

echo 1. 启动后端服务...
cd /d %~dp0
start "后端服务" cmd /k "mvn spring-boot:run"

echo 2. 等待后端服务启动...
timeout /t 10 /nobreak

echo 3. 启动前端服务...
cd advisor-vue
start "前端服务" cmd /k "npm run dev"

echo 4. 系统启动完成！
echo 后端地址: http://localhost:8080
echo 前端地址: http://localhost:5173
echo 测试账号: admin / 123456

pause 