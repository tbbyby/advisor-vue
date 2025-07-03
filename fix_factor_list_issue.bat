@echo off
echo ========================================
echo 因子列表问题快速修复脚本
echo ========================================
echo.

echo 1. 检查数据库连接...
curl -s http://localhost:8080/api/test/db
echo.
echo.

echo 2. 检查分类数据...
curl -s http://localhost:8080/api/test/categories
echo.
echo.

echo 3. 检查因子数据...
curl -s http://localhost:8080/api/test/factors
echo.
echo.

echo 4. 测试因子列表接口...
curl -s http://localhost:8080/api/factor/list
echo.
echo.

echo 5. 测试分类因子接口...
curl -s http://localhost:8080/api/factor/list/category/5
echo.
echo.

echo ========================================
echo 诊断完成！
echo ========================================
echo.
echo 如果数据为空，请执行以下SQL：
echo.
echo -- 插入测试因子数据
echo INSERT INTO factor ^(
echo     factor_code, factor_name, factor_short_name, category_id, 
echo     factor_type, description, formula, data_source, 
echo     update_frequency, risk_level, is_public, creator_id, status
echo ^) VALUES 
echo ('F001', '动量因子', 'Momentum', 5, '技术因子', '价格动量指标', 'CLOSE/CLOSE[20]', '市场数据', 'daily', '中等', 1, 1, 1^),
echo ('F002', '价值因子', 'Value', 5, '基本面因子', '估值指标', 'P/E', '财务数据', 'daily', '低', 1, 1, 1^),
echo ('F003', '质量因子', 'Quality', 5, '基本面因子', '财务质量指标', 'ROE', '财务数据', 'daily', '低', 1, 1, 1^);
echo.
echo 详细诊断信息请查看：docs/factor_list_issue_diagnosis.md
pause 