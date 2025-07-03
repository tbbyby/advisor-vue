@echo off
echo ========================================
echo 策略管理子系统初始化脚本
echo ========================================
echo.

echo 1. 执行数据库初始化脚本...
echo 请确保MySQL服务已启动，然后执行以下命令：
echo mysql -u root -p advisor_boot ^< src/main/resources/sql/strategy_management_tables.sql
echo.

echo 2. 启动后端服务...
echo mvn spring-boot:run
echo.

echo 3. 启动前端服务...
echo cd advisor-vue
echo npm run dev
echo.

echo 4. 访问策略管理页面...
echo http://localhost:5173/strategy
echo.

echo ========================================
echo 初始化完成！
echo ========================================
echo.
echo 策略管理子系统功能包括：
echo - 策略创建和编辑
echo - 策略列表展示
echo - 策略详情查看
echo - 策略参数配置
echo - 策略统计信息
echo - 策略搜索和筛选
echo.
pause 