# 获取分类列表失败问题诊断

## 问题描述
前端调用 `/api/factor/categories` 接口获取因子分类列表时失败。

## 可能的原因分析

### 1. 数据库表不存在或数据为空
- `factor_category` 表可能未创建
- 表中没有初始数据
- 数据库连接配置问题

### 2. MyBatis映射问题
- XML映射文件语法错误
- Mapper接口与XML不匹配
- 包扫描配置问题

### 3. 服务层异常
- Service实现类异常
- 事务配置问题
- 依赖注入失败

## 诊断步骤

### 步骤1：检查数据库连接和表结构
1. 确认数据库连接正常
2. 检查 `factor_category` 表是否存在
3. 验证表中是否有数据

**执行SQL检查：**
```sql
-- 检查表是否存在
SHOW TABLES LIKE 'factor_category';

-- 检查表结构
DESCRIBE factor_category;

-- 检查数据
SELECT COUNT(*) FROM factor_category;
SELECT * FROM factor_category LIMIT 5;
```

### 步骤2：执行数据初始化脚本
如果表不存在或数据为空，执行初始化脚本：

```sql
-- 执行 src/main/resources/sql/init_factor_data.sql
```

### 步骤3：测试数据库连接
访问测试接口验证数据库连接：
```
GET /api/test/db
```

### 步骤4：测试分类查询
访问分类测试接口：
```
GET /api/test/categories
```

## 解决方案

### 方案1：数据库初始化
1. 确保MySQL服务正常运行
2. 创建数据库（如果不存在）：
   ```sql
   CREATE DATABASE IF NOT EXISTS advisor_system;
   USE advisor_system;
   ```
3. 执行初始化脚本：
   ```sql
   -- 在MySQL客户端中执行
   SOURCE src/main/resources/sql/init_factor_data.sql;
   ```

### 方案2：检查配置文件
确认 `application.yml` 中的数据库配置正确：
```yaml
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/advisor_system?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
    username: root
    password: 12345678
```

### 方案3：检查MyBatis配置
确认MyBatis配置正确：
```yaml
mybatis:
  mapper-locations: classpath:mapper/*.xml
  type-aliases-package: com.advisorboot.entity
  configuration:
    map-underscore-to-camel-case: true
```

### 方案4：清理和重新编译
```bash
# 清理项目
mvn clean

# 重新编译
mvn compile

# 启动应用
mvn spring-boot:run
```

## 测试验证

### 1. 数据库连接测试
```bash
curl http://localhost:8080/api/test/db
```

预期响应：
```json
{
  "success": true,
  "message": "数据库连接正常",
  "categoryCount": 13,
  "categories": [...]
}
```

### 2. 分类查询测试
```bash
curl http://localhost:8080/api/test/categories
```

预期响应：
```json
{
  "success": true,
  "totalCount": 13,
  "rootCount": 4,
  "activeCount": 13,
  "allCategories": [...],
  "rootCategories": [...],
  "activeCategories": [...]
}
```

### 3. 正式接口测试
```bash
curl http://localhost:8080/api/factor/categories
```

预期响应：
```json
{
  "success": true,
  "data": [...],
  "message": "获取分类成功"
}
```

## 常见错误及解决方案

### 错误1：数据库连接失败
**错误信息：** `Communications link failure`
**解决方案：**
- 检查MySQL服务是否启动
- 验证数据库连接参数
- 确认防火墙设置

### 错误2：表不存在
**错误信息：** `Table 'advisor_system.factor_category' doesn't exist`
**解决方案：**
- 执行数据库初始化脚本
- 检查数据库名称是否正确

### 错误3：MyBatis映射错误
**错误信息：** `Invalid bound statement`
**解决方案：**
- 检查XML映射文件语法
- 确认Mapper接口与XML匹配
- 验证包扫描配置

### 错误4：数据为空
**错误信息：** 返回空列表
**解决方案：**
- 执行数据初始化脚本
- 检查数据插入是否成功

## 日志分析

### 启用详细日志
在 `application.yml` 中添加：
```yaml
logging:
  level:
    com.advisorboot.mapper: debug
    com.advisorboot.service: debug
    org.springframework.web: debug
```

### 关键日志信息
1. **数据库连接日志：** 查看连接是否成功
2. **SQL执行日志：** 查看实际执行的SQL语句
3. **异常堆栈：** 查看详细的错误信息

## 预防措施

1. **数据库备份：** 定期备份数据库
2. **配置验证：** 启动前验证配置文件
3. **单元测试：** 编写数据库访问的单元测试
4. **监控告警：** 设置数据库连接监控

## 总结

通过以上诊断步骤和解决方案，应该能够解决"获取分类列表失败"的问题。关键是要确保：
1. 数据库连接正常
2. 表结构正确
3. 数据存在
4. MyBatis配置正确
5. 服务层代码正常

如果问题仍然存在，请检查应用日志获取更详细的错误信息。 