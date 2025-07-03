# 智能投顾系统

这是一个基于Spring Boot + Vue3的智能投顾系统，提供基金研究、因子管理、策略管理等功能。

## 技术栈

### 后端
- Spring Boot 3.4.7
- MySQL 8.0
- MyBatis 3.0.4
- Lombok

### 前端
- Vue 3.5.17
- Element Plus 2.10.2
- Vue Router 4.5.1
- Axios 1.10.0
- Sass

## 项目结构

```
advisor-boot/
├── src/main/java/com/advisorboot/
│   ├── controller/          # 控制器层
│   ├── service/            # 服务层
│   ├── mapper/             # 数据访问层
│   ├── entity/             # 实体类
│   └── common/             # 公共类
├── src/main/resources/
│   ├── mapper/             # MyBatis映射文件
│   ├── sql/                # 数据库脚本
│   └── application.yml     # 配置文件
└── advisor-vue/            # 前端项目
    ├── src/
    │   ├── views/          # 页面组件
    │   ├── api/            # API接口
    │   ├── router/         # 路由配置
    │   └── assets/         # 静态资源
    └── package.json
```

## 功能模块

### 1. 基金研究子系统 ✅
- 全部公募基金查询和筛选
- 基金公司查询
- 基金经理查询
- 基金画像展示

### 2. 因子管理子系统 ✅
- 因子分类管理
- 因子列表展示
- 因子详情查看
- 因子创建和编辑
- 因子数据管理
- 因子有效性分析

### 3. 策略管理子系统 ✅
- 策略创建和编辑
- 策略列表展示
- 策略详情查看
- 策略参数配置
- 策略统计信息
- 策略搜索和筛选

### 4. 组合产品管理子系统 ✅

### 5. 交易管理子系统 ✅
- 交易账户管理：支持个人、机构、产品账户的创建和管理
- 交易订单管理：买入、卖出订单的创建、修改和状态跟踪
- 交易成交管理：记录交易成交详情和手续费
- 持仓管理：实时持仓信息、成本计算和盈亏统计
- 资金流水管理：账户资金变动记录和余额跟踪
- 风险控制管理：持仓限制、亏损限制等风险控制规则
- 交易统计管理：交易频率、胜率、换手率等统计指标
- 产品创建和编辑
- 产品列表展示
- 产品详情查看
- 产品业绩管理
- 产品文档管理
- 产品审核流程
- 产品状态管理

### 5. 用户管理
- 用户注册
- 用户登录
- 用户信息管理

## 快速开始

### 1. 环境准备
- JDK 17+
- Node.js 16+
- MySQL 8.0+

### 2. 数据库配置
1. 创建MySQL数据库
2. 执行 `src/main/resources/sql/init.sql` 脚本
3. 修改 `src/main/resources/application.yml` 中的数据库连接信息

### 3. 启动后端
```bash
# 进入项目根目录
cd advisor-boot

# 编译项目
mvn clean compile

# 启动应用
mvn spring-boot:run
```

后端服务将在 `http://localhost:8080` 启动

### 4. 启动前端
```bash
# 进入前端项目目录
cd advisor-vue

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

前端服务将在 `http://localhost:5173` 启动

### 5. 访问系统
1. 打开浏览器访问 `http://localhost:5173`
2. 使用测试账号登录：
   - 用户名：admin
   - 密码：123456

## API接口

### 用户相关
- `POST /api/user/login` - 用户登录
- `POST /api/user/register` - 用户注册
- `GET /api/user/{id}` - 获取用户信息

### 基金相关
- `GET /api/fund/list` - 获取基金列表
- `GET /api/fund/{id}` - 获取基金详情
- `GET /api/fund/search` - 搜索基金
- `GET /api/fund/company/{companyId}` - 获取公司基金
- `GET /api/fund/manager/{managerId}` - 获取经理基金

### 基金公司相关
- `GET /api/fund-company/list` - 获取公司列表
- `GET /api/fund-company/search` - 搜索公司

### 基金经理相关
- `GET /api/fund-manager/list` - 获取经理列表
- `GET /api/fund-manager/search` - 搜索经理

### 因子管理相关
- `GET /api/factor/categories` - 获取因子分类
- `GET /api/factor/list` - 获取因子列表
- `GET /api/factor/detail/{id}` - 获取因子详情
- `POST /api/factor/add` - 新增因子
- `PUT /api/factor/update` - 更新因子
- `DELETE /api/factor/delete/{id}` - 删除因子
- `GET /api/factor/search` - 搜索因子

### 策略管理相关
- `GET /api/strategy/list` - 获取策略列表
- `GET /api/strategy/detail/{id}` - 获取策略详情
- `POST /api/strategy/add` - 新增策略
- `PUT /api/strategy/update` - 更新策略
- `DELETE /api/strategy/delete/{id}` - 删除策略
- `GET /api/strategy/search` - 搜索策略
- `GET /api/strategy/stats` - 获取策略统计

### 组合产品管理相关
- `GET /api/portfolio-product/list` - 获取产品列表
- `GET /api/portfolio-product/{id}` - 获取产品详情
- `POST /api/portfolio-product/create` - 创建产品
- `PUT /api/portfolio-product/update` - 更新产品
- `DELETE /api/portfolio-product/{id}` - 删除产品
- `GET /api/portfolio-product/search` - 搜索产品
- `GET /api/portfolio-product/{id}/performance` - 获取产品业绩
- `POST /api/portfolio-product/{id}/performance` - 添加业绩数据
- `GET /api/portfolio-product/{id}/documents` - 获取产品文档
- `POST /api/portfolio-product/{id}/documents` - 添加产品文档

## 开发说明

### 后端开发
1. 实体类放在 `entity` 包下
2. Mapper接口放在 `mapper` 包下
3. Service接口和实现放在 `service` 包下
4. Controller放在 `controller` 包下
5. MyBatis映射文件放在 `resources/mapper` 目录下

### 前端开发
1. 页面组件放在 `views` 目录下
2. API接口放在 `api` 目录下
3. 路由配置在 `router/index.js` 中
4. 全局样式在 `assets/main.scss` 中

## 注意事项

1. 确保MySQL服务已启动
2. 检查数据库连接配置是否正确
3. 前端开发时需要确保后端服务正在运行
4. 首次运行需要执行数据库初始化脚本

## 故障排除

### 前端启动问题

如果遇到 `crypto.hash is not a function` 错误，请按以下步骤解决：

1. **方法一：使用修复脚本**
   ```bash
   # Windows CMD
   cd advisor-vue
   fix-deps.bat
   
   # Windows PowerShell
   cd advisor-vue
   .\fix-deps.ps1
   ```

2. **方法二：手动修复**
   ```bash
   cd advisor-vue
   
   # 删除现有依赖
   rmdir /s node_modules
   del package-lock.json
   
   # 清除缓存
   npm cache clean --force
   
   # 重新安装
   npm install
   
   # 启动服务
   npm run dev
   ```

3. **方法三：检查Node.js版本**
   ```bash
   node --version
   ```
   建议使用 Node.js 16.x 或 18.x 版本

### 数据库连接问题

如果遇到数据库连接错误，请检查：
1. MySQL服务是否启动
2. 数据库连接信息是否正确
3. 数据库是否已创建
4. 初始化脚本是否已执行

### 因子列表问题

如果遇到"获取因子列表成功"后又"获取因子列表失败"的问题：

#### 后端问题诊断
1. **快速诊断**
   ```bash
   # Windows
   fix_factor_list_issue.bat
   
   # 或手动测试接口
   curl http://localhost:8080/api/test/factors
   curl http://localhost:8080/api/factor/list
   curl http://localhost:8080/api/factor/list/category/5
   ```

2. **添加测试数据**
   ```sql
   -- 执行测试数据脚本
   mysql -u root -p advisor_boot < src/main/resources/sql/test_factor_data.sql
   ```

3. **详细诊断**
   查看 `docs/factor_list_issue_diagnosis.md` 获取详细解决方案

#### 前端问题诊断
1. **使用浏览器调试**
   - 打开浏览器开发者工具（F12）
   - 在控制台执行：`debugFactorApi()`
   - 查看Network标签页的请求详情

2. **检查API调用**
   - 确认响应拦截器已修复
   - 检查是否有多个API调用冲突

3. **详细诊断**
   查看 `docs/frontend_factor_issue_diagnosis.md` 获取前端详细解决方案

## 后续开发计划

- [x] 因子管理子系统
- [x] 策略管理子系统
- [ ] 策略回测子系统
- [ ] 策略监控子系统
- [x] 组合产品管理子系统
- [x] 交易管理子系统
- [ ] 用户权限管理
- [ ] 数据可视化图表
- [ ] 基金组合创建功能 