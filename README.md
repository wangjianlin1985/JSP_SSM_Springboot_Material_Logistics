# JSP_SSM_Springboot_Material_Logistics
JSP基于SSM速之达快递物资物流管理系统可升级SpringBoot毕业源码案例设计
## 前台框架： Bootstrap(一个HTML5响应式框架）
## 开发环境：myEclipse/Eclipse/Idea都可以 + mysql数据库
## 后台框架: SSM(SpringMVC + Spring + Mybatis)
### 前台界面
1.用户和工作人员注册和登陆
仓库工作人员的注册及登陆，不登陆不能进行仓库登记
2.入库物资信息的登记
包括入库物资信息的输入，时间，物品种类，重量，是否完好
3. 出库物资信息的登记
包括出库物资信息的输入，时间，物品种类，重量，是否完好
4. 物流信息查询
 通过订单号对物流进行跟踪，查询什么时间所处什么位置。
### 后台管理界面
1.物资基本信息的管理
管理员对入库物资信息进行管理，查询和修改
2.注册用户管理
管理员可以对以注册的用户进行停权、授权和删除等操作。
3.仓库信息管理
将入库的快递按大小，种类，地区分放在不同的仓库
4.出库物资信息的管理
管理员发布出库信息给前台，让前台进行出库操作。
5.仓库剩余物资信息的查询和浏览
包括剩余物资报表的生成，发往某地，何时出库等信息
## 实体ER属性：
用户: 用户名,登录密码,姓名,性别,出生日期,用户照片,联系电话,邮箱,家庭地址,注册时间

工作人员: 工作人员账号,登录密码,姓名,性别,出生日期,工作人员照片,联系电话,家庭地址,备注信息

仓库: 仓库id,所在地区,仓库名称,仓库面积,仓库吞吐量,联系人,联系电话,仓库地址,仓库备注

物资: 物流单号,物资分类,物资名称,物资重量,物资详情,寄件人,寄件人电话,寄件人地址,收件人,收件人电话,收件人地址,运费,物流动态,备注信息

入库: 入库id,入库物资,物资种类,重量,入库仓库,入库时间,是否完好,工作人员,入库备注

出库: 出库id,出库物资,物资种类,重量,出库仓库,出库时间,是否完好,工作人员,出库备注

物资种类: 物资种类id,物资种类名称
