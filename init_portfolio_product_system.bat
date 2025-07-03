@echo off
echo ========================================
echo 组合产品管理子系统初始化脚本
echo ========================================

echo.
echo 正在创建数据库表结构...
mysql -u root -p advisor_system < src/main/resources/sql/portfolio_product_tables.sql

echo.
echo 正在插入测试数据...
mysql -u root -p advisor_system < src/main/resources/sql/portfolio_product_data.sql

echo.
echo ========================================
echo 组合产品管理子系统初始化完成！
echo ========================================
echo.
echo 已创建以下表：
echo - portfolio_product (组合产品表)
echo - product_portfolio_config (产品组合配置表)
echo - product_strategy_config (产品策略配置表)
echo - product_performance (产品业绩表)
echo - product_transaction (产品申购赎回记录表)
echo - product_holding (产品持仓表)
echo - product_document (产品文档表)
echo.
echo 已插入测试数据：
echo - 3个组合产品
echo - 产品组合配置数据
echo - 产品策略配置数据
echo - 产品业绩数据
echo - 产品文档数据
echo.
echo 请启动后端服务进行测试：
echo mvn spring-boot:run
echo.
pause 