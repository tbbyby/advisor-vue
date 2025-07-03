# FundPortfolioMapper 完善总结

## 概述
已完善 `FundPortfolioMapper.java` 接口和对应的 `FundPortfolioMapper.xml` 文件，提供了完整的基金投资组合数据访问功能。

## 完善内容

### 1. Mapper接口方法 (FundPortfolioMapper.java)

#### 基础查询方法
- `findByUserId(Long userId)` - 根据用户ID查询投资组合列表
- `findById(Long id)` - 根据ID查询投资组合详情
- `findByPortfolioName(String portfolioName)` - 根据组合名称查询
- `findByUserIdAndName(Long userId, String portfolioName)` - 根据用户ID和组合名称查询
- `findByPortfolioType(String portfolioType)` - 根据组合类型查询
- `findByStatus(Integer status)` - 根据状态查询
- `findByUserIdAndStatus(Long userId, Integer status)` - 根据用户ID和状态查询

#### 高级查询方法
- `findByCondition()` - 条件查询（支持多条件组合）
- `searchByKeyword(String keyword)` - 模糊搜索
- `selectAll()` - 查询所有投资组合
- `selectByPage()` - 分页查询
- `selectRecentPortfolios()` - 获取最近创建的投资组合
- `selectActivePortfolios()` - 获取活跃的投资组合（有持仓的）

#### 统计方法
- `countByUserId(Long userId)` - 统计用户投资组合数量
- `countAll()` - 统计投资组合总数
- `countByCondition()` - 条件统计
- `selectPortfolioStats()` - 获取投资组合统计信息
- `selectPortfolioCountByType()` - 按类型统计投资组合数量

#### 数据操作方法
- `insert(FundPortfolio portfolio)` - 插入投资组合
- `update(FundPortfolio portfolio)` - 更新投资组合
- `updateStatus(Long id, Integer status)` - 更新状态
- `deleteById(Long id)` - 删除投资组合
- `batchDelete(List<Long> ids)` - 批量删除
- `deleteByUserId(Long userId)` - 根据用户ID删除所有投资组合

#### 验证方法
- `checkPortfolioNameExists()` - 检查组合名称是否存在

### 2. XML映射文件 (FundPortfolioMapper.xml)

#### 结果映射
- 定义了完整的 `BaseResultMap`，包含所有字段映射
- 支持关联查询，自动获取用户名信息

#### SQL片段
- `Base_Column_List` - 基础字段列表
- `Base_Join` - 基础关联查询

#### 查询特性
- 支持动态SQL条件查询
- 支持模糊搜索
- 支持分页查询
- 支持关联查询（与用户表关联）
- 支持统计查询
- 支持批量操作

#### 性能优化
- 合理的索引使用
- 高效的关联查询
- 支持分页查询避免大数据量问题

## 使用示例

### 1. 基础查询
```java
// 查询用户的所有投资组合
List<FundPortfolio> portfolios = fundPortfolioMapper.findByUserId(userId);

// 根据ID查询详情
FundPortfolio portfolio = fundPortfolioMapper.findById(portfolioId);
```

### 2. 条件查询
```java
// 多条件查询
List<FundPortfolio> portfolios = fundPortfolioMapper.findByCondition(
    userId, "股票型", 1, "价值投资"
);
```

### 3. 分页查询
```java
// 分页查询
List<FundPortfolio> portfolios = fundPortfolioMapper.selectByPage(
    0, 10, userId, null, 1
);
```

### 4. 统计查询
```java
// 获取统计信息
Map<String, Object> stats = fundPortfolioMapper.selectPortfolioStats(userId);

// 按类型统计
List<Map<String, Object>> typeStats = fundPortfolioMapper.selectPortfolioCountByType(userId);
```

### 5. 数据操作
```java
// 插入新投资组合
FundPortfolio portfolio = new FundPortfolio();
portfolio.setPortfolioName("我的投资组合");
portfolio.setUserId(userId);
fundPortfolioMapper.insert(portfolio);

// 更新投资组合
portfolio.setDescription("更新描述");
fundPortfolioMapper.update(portfolio);

// 删除投资组合
fundPortfolioMapper.deleteById(portfolioId);
```

## 数据库表结构要求

确保数据库中存在以下表：

### fund_portfolio 表
```sql
CREATE TABLE fund_portfolio (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    portfolio_name VARCHAR(200) NOT NULL,
    user_id BIGINT NOT NULL,
    portfolio_type VARCHAR(50),
    description TEXT,
    status TINYINT DEFAULT 1,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_id (user_id),
    INDEX idx_portfolio_name (portfolio_name),
    INDEX idx_status (status)
);
```

### fund_portfolio_detail 表（用于关联查询）
```sql
CREATE TABLE fund_portfolio_detail (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    portfolio_id BIGINT NOT NULL,
    fund_code VARCHAR(20) NOT NULL,
    weight DECIMAL(10,4),
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_portfolio_id (portfolio_id)
);
```

## 注意事项

1. **参数注解**: 所有方法都使用了 `@Param` 注解，确保MyBatis能正确识别参数
2. **关联查询**: 自动关联用户表获取用户名信息
3. **动态SQL**: 使用MyBatis的动态SQL特性，支持灵活的条件查询
4. **性能优化**: 合理使用索引，避免N+1查询问题
5. **数据完整性**: 支持批量操作和级联删除

## 扩展建议

1. 可以添加更多的统计查询方法
2. 可以增加缓存支持
3. 可以添加更复杂的关联查询（如包含基金详情）
4. 可以增加数据导出功能
5. 可以添加数据验证和业务逻辑检查 