# Mapper XML文件完善总结

## 概述
本文档总结了因子管理子系统中所有Mapper XML文件的完善情况，包括新增的XML文件和优化的现有文件。

## 已完善的Mapper XML文件

### 1. 基础Mapper XML文件

#### 1.1 FactorMapper.xml
- **位置**: `src/main/resources/mapper/FactorMapper.xml`
- **功能**: 因子基础信息管理
- **主要方法**:
  - `selectAll`: 查询所有启用状态的因子
  - `selectById`: 根据ID查询因子
  - `selectByCategoryId`: 根据分类ID查询因子
  - `selectByFactorCode`: 根据因子代码查询
  - `selectByCondition`: 条件查询（类型、风险等级、公开状态）
  - `selectByCreatorId`: 根据创建者查询
  - `selectByKeyword`: 关键词模糊搜索
  - `selectFactorStats`: 因子统计信息
  - `selectFactorCountByType`: 按类型统计
  - `selectFactorCountByRiskLevel`: 按风险等级统计
  - `insert`: 插入因子
  - `update`: 更新因子
  - `deleteById`: 删除因子

#### 1.2 FactorCategoryMapper.xml
- **位置**: `src/main/resources/mapper/FactorCategoryMapper.xml`
- **功能**: 因子分类管理
- **主要方法**:
  - `selectAll`: 查询所有启用状态的分类
  - `selectById`: 根据ID查询分类
  - `selectByParentId`: 根据父分类查询子分类
  - `selectByStatus`: 根据状态查询分类
  - `selectByCategoryCode`: 根据分类代码查询
  - `selectAllChildren`: 递归查询所有子分类
  - `hasChildren`: 检查是否有子分类
  - `selectCategoryStats`: 分类统计信息
  - `insert`: 插入分类
  - `update`: 更新分类
  - `deleteById`: 删除分类

#### 1.3 FactorPortfolioMapper.xml
- **位置**: `src/main/resources/mapper/FactorPortfolioMapper.xml`
- **功能**: 因子组合管理
- **主要方法**:
  - `selectAll`: 查询所有启用状态的组合
  - `selectById`: 根据ID查询组合
  - `selectByPortfolioCode`: 根据组合代码查询
  - `selectByCreatorId`: 根据创建者查询
  - `selectByCondition`: 条件查询（策略类型、公开状态）
  - `selectByKeyword`: 关键词模糊搜索
  - `selectPortfolioStats`: 组合统计信息
  - `selectPortfolioCountByStrategyType`: 按策略类型统计
  - `insert`: 插入组合
  - `update`: 更新组合
  - `deleteById`: 删除组合

### 2. 新增的Mapper XML文件

#### 2.1 FactorDataMapper.xml
- **位置**: `src/main/resources/mapper/FactorDataMapper.xml`
- **功能**: 因子数据管理
- **主要方法**:
  - `selectByFactorId`: 根据因子ID查询数据
  - `selectByFactorIdAndDateRange`: 根据因子ID和日期范围查询
  - `selectByFundCode`: 根据基金代码查询
  - `selectByTradeDate`: 根据交易日期查询
  - `selectByFactorIdAndFundCode`: 根据因子ID和基金代码查询
  - `selectLatestByFactorId`: 查询最新的因子数据
  - `selectFactorDataStats`: 因子数据统计信息
  - `insert`: 插入单条数据
  - `batchInsert`: 批量插入数据
  - `update`: 更新数据
  - `deleteById`: 删除数据
  - `deleteByFactorId`: 根据因子ID删除数据

#### 2.2 FactorPortfolioDetailMapper.xml
- **位置**: `src/main/resources/mapper/FactorPortfolioDetailMapper.xml`
- **功能**: 因子组合明细管理
- **主要方法**:
  - `selectByPortfolioId`: 根据组合ID查询明细
  - `selectByFactorId`: 根据因子ID查询明细
  - `selectByPortfolioIdAndFactorId`: 根据组合ID和因子ID查询
  - `insert`: 插入明细
  - `batchInsert`: 批量插入明细
  - `update`: 更新明细
  - `deleteById`: 删除明细
  - `deleteByPortfolioId`: 根据组合ID删除明细
  - `deleteByPortfolioIdAndFactorId`: 根据组合ID和因子ID删除

#### 2.3 FactorAnalysisMapper.xml
- **位置**: `src/main/resources/mapper/FactorAnalysisMapper.xml`
- **功能**: 因子有效性分析管理
- **主要方法**:
  - `selectByFactorId`: 根据因子ID查询分析数据
  - `selectByFactorIdAndDateRange`: 根据因子ID和日期范围查询
  - `selectByAnalysisDate`: 根据分析日期查询
  - `selectLatestByFactorId`: 查询最新的分析数据
  - `selectFactorAnalysisStats`: 因子分析统计信息
  - `insert`: 插入分析数据
  - `batchInsert`: 批量插入分析数据
  - `update`: 更新分析数据
  - `deleteById`: 删除分析数据
  - `deleteByFactorId`: 根据因子ID删除分析数据

## 对应的Mapper接口

### 1. 基础Mapper接口
- `FactorMapper.java`
- `FactorCategoryMapper.java`
- `FactorPortfolioMapper.java`

### 2. 新增Mapper接口
- `FactorDataMapper.java`
- `FactorPortfolioDetailMapper.java`
- `FactorAnalysisMapper.java`

## 对应的实体类

### 1. 基础实体类
- `Factor.java`
- `FactorCategory.java`
- `FactorPortfolio.java`

### 2. 新增实体类
- `FactorData.java`
- `FactorPortfolioDetail.java`
- `FactorAnalysis.java`

## 数据库表结构

### 1. 基础表
- `factor`: 因子表
- `factor_category`: 因子分类表
- `factor_portfolio`: 因子组合表

### 2. 新增表
- `factor_data`: 因子数据表
- `factor_portfolio_detail`: 因子组合明细表
- `factor_analysis`: 因子有效性分析表

## 主要特性

### 1. 完整的CRUD操作
所有Mapper XML文件都包含了完整的增删改查操作，支持：
- 基础查询（按ID、代码等）
- 条件查询（多条件组合）
- 模糊搜索
- 统计查询
- 批量操作

### 2. 性能优化
- 合理的索引设计
- 分页查询支持
- 批量操作优化
- 关联查询优化

### 3. 数据完整性
- 外键约束
- 状态管理
- 时间戳记录
- 软删除支持

### 4. 扩展性
- 支持条件查询
- 支持统计查询
- 支持递归查询
- 支持批量操作

## 使用说明

### 1. 数据库初始化
执行 `src/main/resources/sql/factor_management_tables.sql` 创建表结构和初始数据。

### 2. 配置MyBatis
确保在 `application.yml` 中正确配置了MyBatis的mapper扫描路径：
```yaml
mybatis:
  mapper-locations: classpath:mapper/*.xml
  type-aliases-package: com.advisorboot.entity
```

### 3. 使用示例
```java
@Autowired
private FactorMapper factorMapper;

// 查询所有因子
List<Factor> factors = factorMapper.selectAll();

// 条件查询
Map<String, Object> condition = new HashMap<>();
condition.put("factorType", "MOMENTUM");
condition.put("riskLevel", "中");
List<Factor> factors = factorMapper.selectByCondition(condition);

// 模糊搜索
List<Factor> factors = factorMapper.selectByKeyword("动量");
```

## 注意事项

1. **数据库版本**: 确保MySQL版本支持递归查询（MySQL 8.0+）
2. **索引优化**: 根据实际查询需求调整索引
3. **批量操作**: 大数据量时建议使用批量操作
4. **事务管理**: 涉及多表操作时注意事务管理
5. **性能监控**: 定期监控查询性能，优化慢查询

## 后续优化建议

1. **缓存策略**: 考虑添加Redis缓存
2. **分页优化**: 大数据量时优化分页查询
3. **读写分离**: 考虑读写分离架构
4. **监控告警**: 添加数据库性能监控
5. **备份策略**: 制定数据备份和恢复策略 