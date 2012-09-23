print    'DJ2000'
use master 
go
create database DJ2000 on H2KDataStore = 800
alter database DJ2000 ON H2KLogs = 200
go

use DJ2000
go

exec sp_extendsegment 'logsegment','DJ2000', 'H2KLogs'
go

exec sp_dropsegment 'logsegment', 'DJ2000','H2KDataStore'
go


use master 
go
exec  master.dbo.sp_dboption DJ2000, 'ddl in tran' ,true
go

exec  master.dbo.sp_dboption DJ2000, 'select into/bulkcopy' ,true
go

exec  master.dbo.sp_dboption DJ2000, 'trunc. log on chkpt' ,true
go

use DJ2000
go
checkpoint 
go

exec  sp_changedbowner 'sa'
go

print   'logsegment'
declare @res int
select @res = 0
declare @mbpp float
select @mbpp = convert(float,low) / power(2,20)
from master.dbo.spt_values
where number = 1 and type = 'E'
declare @pages int
select @pages = (      6040 / @mbpp) + 0.5
declare @dbn varchar(30)
select @dbn = db_name()
if @res != 0 return
exec @res = sp_addthreshold DJ2000, 'logsegment',        6040 ,'sp_thresholdaction'
go

print    'public'
exec sp_addgroup 'public'
go

print   'H2KAdmin'
exec sp_adduser 'H2KUser', 'H2KAdmin', 'public'
go

print   'Register'
exec sp_adduser 'Register', 'Register', 'public'
go

print    'CLERKS_CLERK__329052208'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'CLERKS_COST_M_377052379'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'CLERKS_COST_Y_393052436'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'CLERKS_ITEMS__409052493'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'CLERKS_ITEMS__425052550'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'CLERKS_SALES__345052265'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'CLERKS_SALES__361052322'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'CLERKS_SECURI_441052607'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'DAILY_TRAN_RECONC_160003601'
SETUSER  'dbo'
go

DEFAULT     0 go

SETUSER
go

print    'INVENTORY_ANNUAL_188527705'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_MIN_BA_124527477'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_MONTHL_172527648'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_NO_MON_364528332'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_NUM_OR_236527876'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_NUM_OR_252527933'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_NUM_ST_204527762'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_NUM_ST_220527819'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_QT_ON__140527534'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_QT_ON__156527591'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_RECEIP_92527363'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_REG_PR_380528389'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_SALES__268527990'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_SALES__284528047'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_SALES__300528104'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_SALES__316528161'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_TOT_MO_332528218'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'INVENTORY_UNIT_C_108527420'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'MISC_TRANS_RECONC_304004114'
SETUSER  'dbo'
go

DEFAULT     0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__480004741'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__512004855'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__544004969'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__576005083'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__608005197'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__640005311'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__672005425'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__704005539'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_ITEMS__736005653'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__464004684'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__496004798'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__528004912'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__560005026'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__592005140'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__624005254'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__656005368'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__688005482'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__720005596'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'REG_HISTOR_SALES__752005710'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'reports_ACTIVE_553053006'
SETUSER  'dbo'
go

DEFAULT  0 go

SETUSER
go

print    'SALES_HIST_CUR_MO_1056006793'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__1008006622'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__1024006679'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__1040006736'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__864006109'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__880006166'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__896006223'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__912006280'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__928006337'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__944006394'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__960006451'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__976006508'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_MONTH__992006565'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_ON_HAN_832005995'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_ON_ORD_848006052'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'SALES_HIST_TOTAL__1072006850'
SETUSER  'dbo'
go

DEFAULT   0 go

SETUSER
go

print    'VENDORS_BACK_O_1280007591'
SETUSER  'dbo'
go

DEFAULT    0 go

SETUSER
go

print    'VENDORS_PRINT__1296007648'
SETUSER  'dbo'
go

DEFAULT    0 go

SETUSER
go

print    'VENDORS_WE_PAY_1312007705'
SETUSER  'dbo'
go

DEFAULT    0 go

SETUSER
go



print    'AUDITS'
SETUSER 'dbo'
go

create table dbo.AUDITS (
ID  int not null,
TYPE    smallint    not null,
USERID  varchar(12) not null,
SKU varchar(19) not null,
NEWAMOUNT   int not null,
OLDAMOUNT   int not null,
EXTENDED    text    null,
TIME    datetime    null,
constraint AUDITS_19130578511 PRIMARY KEY  CLUSTERED ( ID )
)
lock allpages
on 'default'
go

grant Delete on AUDITS to H2KAdmin 
go

grant Delete on AUDITS to Register 
go

grant Insert on AUDITS to H2KAdmin 
go

grant Insert on AUDITS to Register 
go

grant Select on AUDITS to H2KAdmin 
go

grant Select on AUDITS to Register 
go

grant Update on AUDITS to H2KAdmin 
go

grant Update on AUDITS to Register 
go

SETUSER
go

print    'BUDGETENTRIES'
SETUSER 'dbo'
go

create table dbo.BUDGETENTRIES (
DEPARTMENT  smallint    not null,
USERID  varchar(12) not null,
AMOUNT  numeric(9, 2)   not null,
DATE_CREATED    datetime    not null,
DATE_UPDATED    datetime    null,
PO_NUM  varchar(10) not null,
ORDER_CYCLE smallint    not null,
constraint PONUM PRIMARY KEY  CLUSTERED ( PO_NUM )
)
lock allpages
on 'default'
go

grant Delete on BUDGETENTRIES to H2KAdmin 
go

grant Delete on BUDGETENTRIES to Register 
go

grant Insert on BUDGETENTRIES to H2KAdmin 
go

grant Insert on BUDGETENTRIES to Register 
go

grant Select on BUDGETENTRIES to H2KAdmin 
go

grant Select on BUDGETENTRIES to Register 
go

grant Update on BUDGETENTRIES to H2KAdmin 
go

grant Update on BUDGETENTRIES to Register 
go

SETUSER
go

print    'BUDGETS'
SETUSER 'dbo'
go

create table dbo.BUDGETS (
DEPARTMENT  smallint    not null,
USERID  varchar(12) not null,
VALUE   numeric(9, 2)   not null,
CALCULATE   bit not null
)
lock allpages
on 'default'
go

grant Delete on BUDGETS to H2KAdmin 
go

grant Delete on BUDGETS to Register 
go

grant Insert on BUDGETS to H2KAdmin 
go

grant Insert on BUDGETS to Register 
go

grant Select on BUDGETS to H2KAdmin 
go

grant Select on BUDGETS to Register 
go

grant Update on BUDGETS to H2KAdmin 
go

grant Update on BUDGETS to Register 
go

SETUSER
go

print    'CLASS_CODES'
SETUSER 'dbo'
go

create table dbo.CLASS_CODES (
CLASS   tinyint not null,
DIVISION    varchar(32) not null,
NAME    varchar(32) not null,
constraint CLASS_CODE_3840043991 PRIMARY KEY  CLUSTERED ( CLASS )
)
lock allpages
on 'default'
go

grant Delete on CLASS_CODES to H2KAdmin 
go

grant Delete on CLASS_CODES to oper_role 
go

grant Delete on CLASS_CODES to sa_role 
go

grant Insert on CLASS_CODES to H2KAdmin 
go

grant Insert on CLASS_CODES to navigator_role 
go

grant Insert on CLASS_CODES to oper_role 
go

grant Insert on CLASS_CODES to sa_role 
go

grant References on CLASS_CODES to navigator_role 
go

grant References on CLASS_CODES to oper_role 
go

grant References on CLASS_CODES to sa_role 
go

grant Select on CLASS_CODES to H2KAdmin 
go

grant Select on CLASS_CODES to navigator_role 
go

grant Select on CLASS_CODES to oper_role 
go

grant Select on CLASS_CODES to sa_role 
go

grant Update on CLASS_CODES to H2KAdmin 
go

grant Update on CLASS_CODES to navigator_role 
go

grant Update on CLASS_CODES to oper_role 
go

grant Update on CLASS_CODES to sa_role 
go

SETUSER
go

print    'CLERKS'
SETUSER 'dbo'
go

create table dbo.CLERKS (
CLERK_ID    tinyint DEFAULT  0  not null,
USERID  varchar(12) not null,
SALES_MTD   numeric(9, 2)   DEFAULT  0  null,
SALES_YTD   numeric(9, 2)   DEFAULT  0  null,
COST_MTD    numeric(9, 2)   DEFAULT  0  null,
COST_YTD    numeric(9, 2)   DEFAULT  0  null,
ITEMS_SOLD_MTD  int DEFAULT  0  null,
ITEMS_SOLD_YTD  int DEFAULT  0  null,
LAST_MAINT  datetime    null,
ACTIVE  bit not null,
REG_PWORD   nvarchar(4) null,
SECURITY_LVL    tinyint DEFAULT  0  null,
constraint USERS_4800047411 PRIMARY KEY  CLUSTERED ( USERID ),
constraint CLERK_ID UNIQUE  NONCLUSTERED ( CLERK_ID )
)
lock allpages
on 'default'
go

print   'CLERK_ID_INDEX'
create unique nonclustered index CLERK_ID_INDEX
on dbo.CLERKS (CLERK_ID)
on 'default'
go

print   'ClerkPword'
create unique nonclustered index ClerkPword
on dbo.CLERKS (REG_PWORD)
on 'default'
go

grant Delete on CLERKS to H2KAdmin 
go

grant Delete on CLERKS to oper_role 
go

grant Delete on CLERKS to sa_role 
go

grant Insert on CLERKS to H2KAdmin 
go

grant Insert on CLERKS to oper_role 
go

grant Insert on CLERKS to sa_role 
go

grant References on CLERKS to navigator_role 
go

grant References on CLERKS to oper_role 
go

grant References on CLERKS to sa_role 
go

grant Select on CLERKS to H2KAdmin 
go

grant Select on CLERKS to navigator_role 
go

grant Select on CLERKS to oper_role 
go

grant Select on CLERKS to sa_role 
go

grant Update on CLERKS to H2KAdmin 
go

grant Update on CLERKS to oper_role 
go

grant Update on CLERKS to sa_role 
go

SETUSER
go

print    'CODES'
SETUSER 'dbo'
go

create table dbo.CODES (
VENDOR_3    char(3) null,
VENDOR_6    char(6) null,
VENDOR_NAME varchar(50) null,
constraint Vend3Const UNIQUE  CLUSTERED ( VENDOR_3 )
)
lock allpages
on 'default'
go

grant Delete on CODES to H2KAdmin 
go

grant Delete on CODES to oper_role 
go

grant Delete on CODES to sa_role 
go

grant Insert on CODES to H2KAdmin 
go

grant Insert on CODES to navigator_role 
go

grant Insert on CODES to oper_role 
go

grant Insert on CODES to sa_role 
go

grant References on CODES to navigator_role 
go

grant References on CODES to oper_role 
go

grant References on CODES to sa_role 
go

grant Select on CODES to H2KAdmin 
go

grant Select on CODES to navigator_role 
go

grant Select on CODES to oper_role 
go

grant Select on CODES to sa_role 
go

grant Update on CODES to H2KAdmin 
go

grant Update on CODES to navigator_role 
go

grant Update on CODES to oper_role 
go

grant Update on CODES to sa_role 
go

SETUSER
go

print    'CUSTOMERS'
SETUSER 'dbo'
go

create table dbo.CUSTOMERS (
CUST_ID int not null,
SALUTATION  varchar(10) null,
FIRST   varchar(30) null,
LAST    varchar(30) not null,
COMPANY varchar(30) null,
ADDR1   varchar(32) null,
ADDR2   varchar(32) null,
ADDR3   varchar(32) null,
CITY    varchar(20) null,
STATE   char(2) null,
ZIP varchar(11) null,
PHONE   varchar(16) null,
EMAIL   varchar(32) null,
CUST_TYPE   char(1) not null,
RESALE_NUM  varchar(20) null,
INTO_RC bit not null,
INTO_CRAFTS bit not null,
INTO_HOBBY  bit not null,
INTO_GAMES  bit not null,
INTO_TRAINS bit not null,
RESELLS bit not null,
COUPON_CUST bit not null,
PURCH_RC    numeric(6, 2)   null,
PURCH_HOBBY numeric(6, 2)   null,
PURCH_CRAFTS    numeric(6, 2)   null,
PURCH_TRAINS    numeric(6, 2)   null,
PURCH_GAMES numeric(6, 2)   null,
PURCH_OTHER numeric(6, 2)   null,
TOTAL_PURCH numeric(6, 2)   null,
LAST_MAINT  datetime    null,
MAINT_BY    varchar(12) null,
constraint CUSTOMERS_12000073061 PRIMARY KEY  CLUSTERED ( CUST_ID )
)
lock allpages
on 'default'
go

grant Delete on CUSTOMERS to H2KAdmin 
go

grant Delete on CUSTOMERS to oper_role 
go

grant Delete on CUSTOMERS to sa_role 
go

grant Insert on CUSTOMERS to H2KAdmin 
go

grant Insert on CUSTOMERS to navigator_role 
go

grant Insert on CUSTOMERS to oper_role 
go

grant Insert on CUSTOMERS to sa_role 
go

grant References on CUSTOMERS to navigator_role 
go

grant References on CUSTOMERS to oper_role 
go

grant References on CUSTOMERS to sa_role 
go

grant Select on CUSTOMERS to H2KAdmin 
go

grant Select on CUSTOMERS to navigator_role 
go

grant Select on CUSTOMERS to oper_role 
go

grant Select on CUSTOMERS to sa_role 
go

grant Update on CUSTOMERS to H2KAdmin 
go

grant Update on CUSTOMERS to navigator_role 
go

grant Update on CUSTOMERS to oper_role 
go

grant Update on CUSTOMERS to sa_role 
go

SETUSER
go

print    'DAILY_TRANS'
SETUSER 'dbo'
go

create table dbo.DAILY_TRANS (
REG_NUM tinyint not null,
TRANS_CODE  char(3) not null,
RECEIPT_NUM int not null,
SALE_DATE   datetime    not null,
CLERK_ID    tinyint null,
SKU varchar(19) null,
QTY smallint    null,
EXT_PRICE   numeric(7, 2)   null,
UNIT_PRICE  numeric(7, 2)   null,
REFUND  bit not null,
RESERVED    tinyint null,
DEPT    tinyint null,
RECONCILED  bit DEFAULT     0           not null
)
lock allpages
on 'default'
go

grant Delete on DAILY_TRANS to H2KAdmin 
go

grant Delete on DAILY_TRANS to oper_role 
go

grant Delete on DAILY_TRANS to sa_role 
go

grant Insert on DAILY_TRANS to H2KAdmin 
go

grant Insert on DAILY_TRANS to oper_role 
go

grant Insert on DAILY_TRANS to sa_role 
go

grant References on DAILY_TRANS to navigator_role 
go

grant References on DAILY_TRANS to oper_role 
go

grant References on DAILY_TRANS to sa_role 
go

grant Select on DAILY_TRANS to H2KAdmin 
go

grant Select on DAILY_TRANS to navigator_role 
go

grant Select on DAILY_TRANS to oper_role 
go

grant Select on DAILY_TRANS to sa_role 
go

grant Update on DAILY_TRANS to H2KAdmin 
go

grant Update on DAILY_TRANS to navigator_role 
go

grant Update on DAILY_TRANS to oper_role 
go

grant Update on DAILY_TRANS to sa_role 
go

SETUSER
go

print    'DAILY_TRANS_LAST_YEAR'
SETUSER 'dbo'
go

create table dbo.DAILY_TRANS_LAST_YEAR (
REG_NUM tinyint not null,
TRANS_CODE  char(3) not null,
RECEIPT_NUM int not null,
SALE_DATE   datetime    not null,
CLERK_ID    tinyint null,
SKU varchar(19) null,
QTY smallint    null,
EXT_PRICE   numeric(7, 2)   null,
UNIT_PRICE  numeric(7, 2)   null,
REFUND  bit not null,
RESERVED    tinyint null,
DEPT    tinyint null,
RECONCILED  bit not null
)
lock allpages
on 'default'
go

SETUSER
go

print    'DEPT_SALES'
SETUSER 'dbo'
go

create table dbo.DEPT_SALES (
DEPT_SKU    varchar(19) not null,
DATE    smalldatetime   not null,
TOTAL_SALES numeric(7, 2)   not null
)
lock allpages
on 'default'
go

grant Delete on DEPT_SALES to H2KAdmin 
go

grant Delete on DEPT_SALES to oper_role 
go

grant Delete on DEPT_SALES to sa_role 
go

grant Insert on DEPT_SALES to H2KAdmin 
go

grant Insert on DEPT_SALES to oper_role 
go

grant Insert on DEPT_SALES to sa_role 
go

grant References on DEPT_SALES to navigator_role 
go

grant References on DEPT_SALES to oper_role 
go

grant References on DEPT_SALES to sa_role 
go

grant Select on DEPT_SALES to H2KAdmin 
go

grant Select on DEPT_SALES to navigator_role 
go

grant Select on DEPT_SALES to oper_role 
go

grant Select on DEPT_SALES to sa_role 
go

grant Update on DEPT_SALES to H2KAdmin 
go

grant Update on DEPT_SALES to navigator_role 
go

grant Update on DEPT_SALES to oper_role 
go

grant Update on DEPT_SALES to sa_role 
go

SETUSER
go

print    'INVENTORY'
SETUSER 'dbo'
go

create table dbo.INVENTORY (
SKU varchar(19) not null,
VENDOR_6    char(6) not null,
CLASS   smallint    not null,
UNIT_COST   numeric(7, 2)   DEFAULT  0  null,
MIN_BALANCE int DEFAULT  0  null,
QT_ON_HAND  int DEFAULT  0  null,
QT_ON_ORDER int DEFAULT  0  null,
RECEIPT_MTD int DEFAULT  0  null,
MONTHLY_SOLD    int DEFAULT  0  null,
ANNUAL_SOLD int DEFAULT  0  null,
NUM_STOCKOUTS_YTD   smallint    DEFAULT  0  null,
NUM_STOCKOUTS_MTD   smallint    DEFAULT  0  null,
NUM_ORD_CURMONTH    int DEFAULT  0  null,
NUM_ORD_CURYEAR int DEFAULT  0  null,
SALES_CURMONTH  numeric(9, 2)   DEFAULT  0  null,
SALES_CURYEAR   numeric(9, 2)   DEFAULT  0  null,
SALES_COST_CURMONTH numeric(9, 2)   DEFAULT  0  null,
SALES_COST_YTD  numeric(9, 2)   DEFAULT  0  null,
TOT_MONTH_END_BAL   int DEFAULT  0  null,
LAST_SALE   datetime    null,
LAST_MAINT  datetime    not null,
NO_MONTHS   tinyint DEFAULT  0  null,
NOT_USED    numeric(3, 2)   null,
TURNS_RATIO numeric(7, 2)   null,
REG_PRICE   numeric(7, 2)   DEFAULT  0  null,
constraint INVENTORY_3680043421 PRIMARY KEY  CLUSTERED ( SKU )
)
lock allpages
on 'default'
go

print   'SKU'
create unique nonclustered index SKU
on dbo.INVENTORY (SKU)
on 'default'
go

print   'VENDOR6'
create nonclustered index VENDOR6
on dbo.INVENTORY (VENDOR_6)
on 'default'
go

grant Delete on INVENTORY to H2KAdmin 
go

grant Delete on INVENTORY to oper_role 
go

grant Delete on INVENTORY to sa_role 
go

grant Insert on INVENTORY to H2KAdmin 
go

grant Insert on INVENTORY to navigator_role 
go

grant Insert on INVENTORY to oper_role 
go

grant Insert on INVENTORY to sa_role 
go

grant References on INVENTORY to navigator_role 
go

grant References on INVENTORY to oper_role 
go

grant References on INVENTORY to sa_role 
go

grant Select on INVENTORY to H2KAdmin 
go

grant Select on INVENTORY to navigator_role 
go

grant Select on INVENTORY to oper_role 
go

grant Select on INVENTORY to Register 
go

grant Select on INVENTORY to sa_role 
go

grant Update on INVENTORY to H2KAdmin 
go

grant Update on INVENTORY to navigator_role 
go

grant Update on INVENTORY to oper_role 
go

grant Update on INVENTORY to sa_role 
go

SETUSER
go

print    'INVOICES'
SETUSER 'dbo'
go

create table dbo.INVOICES (
PONUM   varchar(10) not null,
FREIGHT numeric(6, 2)   not null,
DISCOUNT_AMOUNT numeric(6, 2)   not null,
INVOICE_AMOUNT  numeric(9, 2)   not null,
INVOICE_NUM varchar(10) null,
DATE_CREATED    datetime    not null,
DATE_UPDATED    datetime    null
)
lock allpages
on 'default'
go

grant Delete on INVOICES to H2KAdmin 
go

grant Delete on INVOICES to Register 
go

grant Insert on INVOICES to H2KAdmin 
go

grant Insert on INVOICES to Register 
go

grant Select on INVOICES to H2KAdmin 
go

grant Select on INVOICES to Register 
go

grant Update on INVOICES to H2KAdmin 
go

grant Update on INVOICES to Register 
go

SETUSER
go

print    'LOOKUP4'
SETUSER 'dbo'
go

create table dbo.LOOKUP4 (
UPC varchar(20) not null,
SKU varchar(19) not null
)
lock allpages
on 'default'
go

grant Delete on LOOKUP4 to H2KAdmin 
go

grant Delete on LOOKUP4 to sa_role 
go

grant Insert on LOOKUP4 to H2KAdmin 
go

grant Insert on LOOKUP4 to sa_role 
go

grant References on LOOKUP4 to navigator_role 
go

grant References on LOOKUP4 to sa_role 
go

grant Select on LOOKUP4 to H2KAdmin 
go

grant Select on LOOKUP4 to navigator_role 
go

grant Select on LOOKUP4 to sa_role 
go

grant Update on LOOKUP4 to H2KAdmin 
go

grant Update on LOOKUP4 to sa_role 
go

SETUSER
go

print    'MESSAGES'
SETUSER 'dbo'
go

create table dbo.MESSAGES (
id  int not null,
userid  varchar(12) not null,
message text    not null,
date    datetime    not null,
constraint MESSAGES_14650562551 PRIMARY KEY  CLUSTERED ( id )
)
lock allpages
on 'default'
go

grant Delete on MESSAGES to H2KAdmin 
go

grant Insert on MESSAGES to H2KAdmin 
go

grant References on MESSAGES to H2KAdmin 
go

grant Select on MESSAGES to H2KAdmin 
go

grant Select on MESSAGES to Register 
go

grant Update on MESSAGES to H2KAdmin 
go

SETUSER
go

print    'MISC_TRANS'
SETUSER 'dbo'
go

create table dbo.MISC_TRANS (
REG_NUM tinyint not null,
TRANS_CODE  char(3) not null,
RECEIPT_NUM int not null,
SALE_DATE   datetime    not null,
CLERK_ID    tinyint null,
SKU varchar(19) null,
QTY smallint    null,
EXT_PRICE   numeric(7, 2)   null,
UNIT_PRICE  numeric(7, 2)   null,
REFUND  bit not null,
RESERVED    tinyint null,
DEPT    tinyint null,
RECONCILED  bit DEFAULT     0           not null
)
lock allpages
on 'default'
go

grant Delete on MISC_TRANS to H2KAdmin 
go

grant Delete on MISC_TRANS to oper_role 
go

grant Delete on MISC_TRANS to sa_role 
go

grant Insert on MISC_TRANS to H2KAdmin 
go

grant Insert on MISC_TRANS to oper_role 
go

grant Insert on MISC_TRANS to sa_role 
go

grant References on MISC_TRANS to navigator_role 
go

grant References on MISC_TRANS to oper_role 
go

grant References on MISC_TRANS to sa_role 
go

grant Select on MISC_TRANS to H2KAdmin 
go

grant Select on MISC_TRANS to navigator_role 
go

grant Select on MISC_TRANS to oper_role 
go

grant Select on MISC_TRANS to sa_role 
go

grant Update on MISC_TRANS to H2KAdmin 
go

grant Update on MISC_TRANS to oper_role 
go

grant Update on MISC_TRANS to sa_role 
go

SETUSER
go

print    'PO_ITEMS'
SETUSER 'dbo'
go

create table dbo.PO_ITEMS (
PO_NUM  varchar(10) not null,
SKU varchar(19) null,
VENDOR_SKU  varchar(19) not null,
QTY smallint    not null
constraint NoNegs CHECK     ( qty > 0 ),
UNIT_PRICE  money   not null,
UOM char(2) not null,
AMOUNT  money   null,
MEMO    varchar(30) null,
QTY_RECEIVED    smallint    null,
PROCESSED   bit not null,
DATE_RECEIVED   smalldatetime   null,
ITEM_ID numeric(7, 0)   identity,
SGST_QTY    int null,
constraint PO_ITEMS_T_10170546591 PRIMARY KEY  CLUSTERED ( ITEM_ID )
)
lock allpages
on 'default'
go

print   'PONUM'
create nonclustered index PONUM
on dbo.PO_ITEMS (PO_NUM)
on 'default'
go

grant Delete on PO_ITEMS to H2KAdmin 
go

grant Delete on PO_ITEMS to oper_role 
go

grant Delete on PO_ITEMS to sa_role 
go

grant Insert on PO_ITEMS to H2KAdmin 
go

grant Insert on PO_ITEMS to navigator_role 
go

grant Insert on PO_ITEMS to oper_role 
go

grant Insert on PO_ITEMS to sa_role 
go

grant References on PO_ITEMS to navigator_role 
go

grant References on PO_ITEMS to oper_role 
go

grant References on PO_ITEMS to sa_role 
go

grant Select on PO_ITEMS to H2KAdmin 
go

grant Select on PO_ITEMS to navigator_role 
go

grant Select on PO_ITEMS to oper_role 
go

grant Select on PO_ITEMS to sa_role 
go

grant Update on PO_ITEMS to H2KAdmin 
go

grant Update on PO_ITEMS to navigator_role 
go

grant Update on PO_ITEMS to oper_role 
go

grant Update on PO_ITEMS to sa_role 
go

SETUSER
go

print    'PRODUCTS'
SETUSER 'dbo'
go

create table dbo.PRODUCTS (
VENDOR_3    varchar(3)  not null,
SKU varchar(19) not null,
UPC varchar(20) not null,
CLASS   smallint    not null,
PHYS_INV_GROUP  tinyint not null,
REG_PRICE   numeric(7, 2)   null,
SALE_PRICE  numeric(7, 2)   null,
DESCRIPTION varchar(60) null,
UOM char(3) null,
BACKORDER_CODE  tinyint null,
LABEL_TYPE  char(1) null,
LAST_MAINT  datetime    not null,
MAINT_BY    varchar(12) null,
REG_INV_GROUP   tinyint null,
DELME   varchar(1)  null,
COMP_SKU    varchar(120)    null,
EXT_INFO    varchar(120)    null,
INTERNET_DESCRIPTION    varchar(255)    null,
constraint PRODUCTS_2205278191 PRIMARY KEY  CLUSTERED ( SKU )
)
lock allpages
on 'default'
go

print   'THREE_BY_SKU'
create unique nonclustered index THREE_BY_SKU
on dbo.PRODUCTS (VENDOR_3, SKU)
on 'default'
go

print   'UPC_INDEX'
create nonclustered index UPC_INDEX
on dbo.PRODUCTS (UPC)
on 'default'
go

grant Delete on PRODUCTS to H2KAdmin 
go

grant Delete on PRODUCTS to oper_role 
go

grant Delete on PRODUCTS to sa_role 
go

grant Insert on PRODUCTS to H2KAdmin 
go

grant Insert on PRODUCTS to navigator_role 
go

grant Insert on PRODUCTS to oper_role 
go

grant Insert on PRODUCTS to sa_role 
go

grant References on PRODUCTS to navigator_role 
go

grant References on PRODUCTS to oper_role 
go

grant References on PRODUCTS to sa_role 
go

grant Select on PRODUCTS to H2KAdmin 
go

grant Select on PRODUCTS to navigator_role 
go

grant Select on PRODUCTS to oper_role 
go

grant Select on PRODUCTS to Register 
go

grant Select on PRODUCTS to sa_role 
go

grant Update on PRODUCTS to H2KAdmin 
go

grant Update on PRODUCTS to navigator_role 
go

grant Update on PRODUCTS to oper_role 
go

grant Update on PRODUCTS to sa_role 
go

SETUSER
go

print    'PURCHASE_ORDERS'
SETUSER 'dbo'
go

create table dbo.PURCHASE_ORDERS (
PO_NUM  varchar(10) not null,
VENDOR_6    char(6) not null,
STATUS  smallint    null,
BUYER   varchar(16) not null,
PLACED_WITH varchar(16) null,
CREATED smalldatetime   null,
RECEIVED    smalldatetime   null,
TERMS   varchar(50) null,
SHIP_VIA    varchar(12) null,
MEMO    varchar(50) null,
AMOUNT  numeric(7, 2)   null,
ATTENTION   varchar(16) null,
ORDER_CYCLE int null,
FREIGHT numeric(6, 2)   null,
INVOICE_AMT numeric(7, 2)   null,
RECEIVED_BY varchar(16) null,
DISCOUNT_PCT    numeric(3, 2)   null,
DISCOUNT_AMOUNT numeric(7, 2)   null,
constraint PURCHASE_O_17760093581 PRIMARY KEY  CLUSTERED ( PO_NUM )
)
lock allpages
on 'default'
go

grant Delete on PURCHASE_ORDERS to H2KAdmin 
go

grant Delete on PURCHASE_ORDERS to oper_role 
go

grant Delete on PURCHASE_ORDERS to sa_role 
go

grant Insert on PURCHASE_ORDERS to H2KAdmin 
go

grant Insert on PURCHASE_ORDERS to navigator_role 
go

grant Insert on PURCHASE_ORDERS to oper_role 
go

grant Insert on PURCHASE_ORDERS to sa_role 
go

grant References on PURCHASE_ORDERS to navigator_role 
go

grant References on PURCHASE_ORDERS to oper_role 
go

grant References on PURCHASE_ORDERS to sa_role 
go

grant Select on PURCHASE_ORDERS to H2KAdmin 
go

grant Select on PURCHASE_ORDERS to navigator_role 
go

grant Select on PURCHASE_ORDERS to oper_role 
go

grant Select on PURCHASE_ORDERS to Register 
go

grant Select on PURCHASE_ORDERS to sa_role 
go

grant Update on PURCHASE_ORDERS to H2KAdmin 
go

grant Update on PURCHASE_ORDERS to navigator_role 
go

grant Update on PURCHASE_ORDERS to oper_role 
go

grant Update on PURCHASE_ORDERS to sa_role 
go

SETUSER
go

print    'REG_HISTORY'
SETUSER 'dbo'
go

create table dbo.REG_HISTORY (
DATE    datetime    not null,
ITEMS_REG1  int not null,
SALES_REG1  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG2  tinyint DEFAULT   0     not null,
SALES_REG2  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG3  tinyint DEFAULT   0     not null,
SALES_REG3  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG4  tinyint DEFAULT   0     not null,
SALES_REG4  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG5  tinyint DEFAULT   0     not null,
SALES_REG5  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG6  tinyint DEFAULT   0     not null,
SALES_REG6  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG7  tinyint DEFAULT   0     not null,
SALES_REG7  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG8  tinyint DEFAULT   0     not null,
SALES_REG8  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG9  tinyint DEFAULT   0     not null,
SALES_REG9  numeric(7, 2)   DEFAULT   0     not null,
ITEMS_REG10 tinyint DEFAULT   0     not null,
SALES_REG10 numeric(7, 2)   DEFAULT   0     not null,
MAINT_BY    varchar(12) not null
)
lock allpages
on 'default'
go

grant Delete on REG_HISTORY to H2KAdmin 
go

grant Delete on REG_HISTORY to oper_role 
go

grant Delete on REG_HISTORY to sa_role 
go

grant Insert on REG_HISTORY to H2KAdmin 
go

grant Insert on REG_HISTORY to oper_role 
go

grant Insert on REG_HISTORY to sa_role 
go

grant References on REG_HISTORY to navigator_role 
go

grant References on REG_HISTORY to oper_role 
go

grant References on REG_HISTORY to sa_role 
go

grant Select on REG_HISTORY to H2KAdmin 
go

grant Select on REG_HISTORY to navigator_role 
go

grant Select on REG_HISTORY to oper_role 
go

grant Select on REG_HISTORY to sa_role 
go

grant Update on REG_HISTORY to H2KAdmin 
go

grant Update on REG_HISTORY to oper_role 
go

grant Update on REG_HISTORY to sa_role 
go

SETUSER
go

print    'reports'
SETUSER 'dbo'
go

create table dbo.reports (
MONTH   int not null,
CLASS   int not null,
SALES   numeric(9, 2)   null,
COST    numeric(9, 2)   null,
QTY int null,
YEARQTY int null,
YEARSALES   numeric(9, 2)   null,
YEARCOST    numeric(9, 2)   null,
ACTIVE  binary(1)   DEFAULT  0  null
)
lock allpages
on 'default'
go

grant Delete on reports to H2KAdmin 
go

grant Insert on reports to H2KAdmin 
go

grant Select on reports to H2KAdmin 
go

grant Update on reports to H2KAdmin 
go

SETUSER
go

print    'SALES'
SETUSER 'dbo'
go

create table dbo.SALES (
RECEIPT_NUM int not null,
SALE_DATE   datetime    not null,
CLERK_ID    tinyint null,
CLASS   tinyint null,
SKU varchar(19) not null,
TOT_PRICE   numeric(7, 2)   not null,
QTY smallint    not null,
QTY_SHIP    smallint    null,
UNIT_PRICE  numeric(7, 2)   null,
EXT_PRICE   numeric(7, 2)   null,
UNIT_COST   numeric(7, 2)   null,
EXT_COST    numeric(7, 2)   null,
UOM char(3) null,
DEPT    tinyint null
)
lock allpages
on 'default'
go

print   'Sales_Date'
create nonclustered index Sales_Date
on dbo.SALES (SALE_DATE)
on 'default'
go

print   'SalesSKU'
create nonclustered index SalesSKU
on dbo.SALES (SKU)
on 'default'
go

grant Delete on SALES to H2KAdmin 
go

grant Delete on SALES to oper_role 
go

grant Delete on SALES to Register 
go

grant Delete on SALES to sa_role 
go

grant Insert on SALES to H2KAdmin 
go

grant Insert on SALES to oper_role 
go

grant Insert on SALES to Register 
go

grant Insert on SALES to sa_role 
go

grant References on SALES to H2KAdmin 
go

grant References on SALES to navigator_role 
go

grant References on SALES to oper_role 
go

grant References on SALES to Register 
go

grant References on SALES to sa_role 
go

grant Select on SALES to H2KAdmin 
go

grant Select on SALES to navigator_role 
go

grant Select on SALES to oper_role 
go

grant Select on SALES to Register 
go

grant Select on SALES to sa_role 
go

grant Update on SALES to H2KAdmin 
go

grant Update on SALES to oper_role 
go

grant Update on SALES to Register 
go

grant Update on SALES to sa_role 
go

SETUSER
go

print    'SALES_2_YRS_AGO'
SETUSER 'dbo'
go

create table dbo.SALES_2_YRS_AGO (
RECEIPT_NUM int not null,
SALE_DATE   datetime    not null,
CLERK_ID    tinyint null,
CLASS   tinyint null,
SKU varchar(19) not null,
TOT_PRICE   numeric(7, 2)   not null,
QTY smallint    not null,
QTY_SHIP    smallint    null,
UNIT_PRICE  numeric(7, 2)   null,
EXT_PRICE   numeric(7, 2)   null,
UNIT_COST   numeric(7, 2)   null,
EXT_COST    numeric(7, 2)   null,
UOM char(3) null,
DEPT    tinyint null
)
lock allpages
on 'default'
go

grant Delete on SALES_2_YRS_AGO to H2KAdmin 
go

grant Delete on SALES_2_YRS_AGO to Register 
go

grant Insert on SALES_2_YRS_AGO to H2KAdmin 
go

grant Insert on SALES_2_YRS_AGO to Register 
go

grant References on SALES_2_YRS_AGO to H2KAdmin 
go

grant References on SALES_2_YRS_AGO to Register 
go

grant Select on SALES_2_YRS_AGO to H2KAdmin 
go

grant Select on SALES_2_YRS_AGO to Register 
go

grant Update on SALES_2_YRS_AGO to H2KAdmin 
go

grant Update on SALES_2_YRS_AGO to Register 
go

SETUSER
go

print    'SALES_HIST_13'
SETUSER 'dbo'
go

create table dbo.SALES_HIST_13 (
SKU varchar(19) not null,
DESCRIPTION varchar(60) null,
ON_HAND smallint    DEFAULT   0     null,
ON_ORDER    smallint    DEFAULT   0     null,
MONTH_1 smallint    DEFAULT   0     null,
MONTH_2 smallint    DEFAULT   0     null,
MONTH_3 smallint    DEFAULT   0     null,
MONTH_4 smallint    DEFAULT   0     null,
MONTH_5 smallint    DEFAULT   0     null,
MONTH_6 smallint    DEFAULT   0     null,
MONTH_7 smallint    DEFAULT   0     null,
MONTH_8 smallint    DEFAULT   0     null,
MONTH_9 smallint    DEFAULT   0     null,
MONTH_10    smallint    DEFAULT   0     null,
MONTH_11    smallint    DEFAULT   0     null,
MONTH_12    smallint    DEFAULT   0     null,
CUR_MONTH   smallint    DEFAULT   0     null,
TOTAL_SOLD  int DEFAULT   0     null,
constraint SALES_HIST_13948111621 PRIMARY KEY  CLUSTERED ( SKU )
)
lock allpages
on 'default'
go

grant Delete on SALES_HIST_13 to H2KAdmin 
go

grant Delete on SALES_HIST_13 to oper_role 
go

grant Delete on SALES_HIST_13 to sa_role 
go

grant Insert on SALES_HIST_13 to H2KAdmin 
go

grant Insert on SALES_HIST_13 to navigator_role 
go

grant Insert on SALES_HIST_13 to oper_role 
go

grant Insert on SALES_HIST_13 to sa_role 
go

grant References on SALES_HIST_13 to navigator_role 
go

grant References on SALES_HIST_13 to oper_role 
go

grant References on SALES_HIST_13 to sa_role 
go

grant Select on SALES_HIST_13 to H2KAdmin 
go

grant Select on SALES_HIST_13 to navigator_role 
go

grant Select on SALES_HIST_13 to oper_role 
go

grant Select on SALES_HIST_13 to sa_role 
go

grant Update on SALES_HIST_13 to H2KAdmin 
go

grant Update on SALES_HIST_13 to navigator_role 
go

grant Update on SALES_HIST_13 to oper_role 
go

grant Update on SALES_HIST_13 to sa_role 
go

SETUSER
go

print    'SALES_HIST_TEMP'
SETUSER 'dbo'
go

create table dbo.SALES_HIST_TEMP (
RECEIPT_NUM int null,
SALE_DATE   datetime    null,
CLERK_ID    tinyint null,
CLASS   tinyint null,
SKU varchar(19) null,
TOT_PRICE   numeric(7, 2)   null,
QTY smallint    null,
QTY_SHIP    smallint    null,
UNIT_PRICE  numeric(7, 2)   null,
EXT_PRICE   numeric(7, 2)   null,
UNIT_COST   numeric(7, 2)   null,
EXT_COST    numeric(7, 2)   null,
UOM char(3) null,
DEPT    tinyint null
)
lock allpages
on 'default'
go

grant Delete on SALES_HIST_TEMP to H2KAdmin 
go

grant Delete on SALES_HIST_TEMP to oper_role 
go

grant Delete on SALES_HIST_TEMP to sa_role 
go

grant Insert on SALES_HIST_TEMP to H2KAdmin 
go

grant Insert on SALES_HIST_TEMP to navigator_role 
go

grant Insert on SALES_HIST_TEMP to oper_role 
go

grant Insert on SALES_HIST_TEMP to sa_role 
go

grant References on SALES_HIST_TEMP to navigator_role 
go

grant References on SALES_HIST_TEMP to oper_role 
go

grant References on SALES_HIST_TEMP to sa_role 
go

grant Select on SALES_HIST_TEMP to H2KAdmin 
go

grant Select on SALES_HIST_TEMP to navigator_role 
go

grant Select on SALES_HIST_TEMP to oper_role 
go

grant Select on SALES_HIST_TEMP to sa_role 
go

grant Update on SALES_HIST_TEMP to H2KAdmin 
go

grant Update on SALES_HIST_TEMP to navigator_role 
go

grant Update on SALES_HIST_TEMP to oper_role 
go

grant Update on SALES_HIST_TEMP to sa_role 
go

SETUSER
go

print    'SALES_LAST_YEAR'
SETUSER 'dbo'
go

create table dbo.SALES_LAST_YEAR (
RECEIPT_NUM int not null,
SALE_DATE   datetime    not null,
CLERK_ID    tinyint null,
CLASS   tinyint null,
SKU varchar(19) not null,
TOT_PRICE   numeric(7, 2)   not null,
QTY smallint    not null,
QTY_SHIP    smallint    null,
UNIT_PRICE  numeric(7, 2)   null,
EXT_PRICE   numeric(7, 2)   null,
UNIT_COST   numeric(7, 2)   null,
EXT_COST    numeric(7, 2)   null,
UOM char(3) null,
DEPT    tinyint null
)
lock allpages
on 'default'
go

grant Delete on SALES_LAST_YEAR to H2KAdmin 
go

grant Delete on SALES_LAST_YEAR to Register 
go

grant Insert on SALES_LAST_YEAR to H2KAdmin 
go

grant Insert on SALES_LAST_YEAR to Register 
go

grant References on SALES_LAST_YEAR to H2KAdmin 
go

grant References on SALES_LAST_YEAR to Register 
go

grant Select on SALES_LAST_YEAR to H2KAdmin 
go

grant Select on SALES_LAST_YEAR to Register 
go

grant Update on SALES_LAST_YEAR to H2KAdmin 
go

grant Update on SALES_LAST_YEAR to Register 
go

SETUSER
go

print    'SETTINGS'
SETUSER 'dbo'
go

create table dbo.SETTINGS (
LAST_PO varchar(10) null,
LAST_CUST_NUM   varchar(10) null,
LAST_REG_IMPORT varchar(255)    null,
GROUP4UPC   varchar(10) null,
GROUP0UPC   varchar(10) null,
GROUP2UPC   varchar(10) null,
GROUP6UPC   varchar(10) null,
GROUP8UPC   varchar(10) null,
ACCESSPRIVS image   null,
TAX numeric(9, 2)   null,
DEPT    numeric(9, 2)   null,
sold    int null,
ASOLD   numeric(9, 2)   null,
AUDIT_ID    int null
)
lock allpages
on 'default'
go

grant Delete on SETTINGS to H2KAdmin 
go

grant Delete on SETTINGS to oper_role 
go

grant Delete on SETTINGS to Register 
go

grant Delete on SETTINGS to sa_role 
go

grant Insert on SETTINGS to H2KAdmin 
go

grant Insert on SETTINGS to navigator_role 
go

grant Insert on SETTINGS to oper_role 
go

grant Insert on SETTINGS to Register 
go

grant Insert on SETTINGS to sa_role 
go

grant References on SETTINGS to H2KAdmin 
go

grant References on SETTINGS to navigator_role 
go

grant References on SETTINGS to oper_role 
go

grant References on SETTINGS to Register 
go

grant References on SETTINGS to sa_role 
go

grant Select on SETTINGS to H2KAdmin 
go

grant Select on SETTINGS to navigator_role 
go

grant Select on SETTINGS to oper_role 
go

grant Select on SETTINGS to Register 
go

grant Select on SETTINGS to sa_role 
go

grant Update on SETTINGS to H2KAdmin 
go

grant Update on SETTINGS to navigator_role 
go

grant Update on SETTINGS to oper_role 
go

grant Update on SETTINGS to Register 
go

grant Update on SETTINGS to sa_role 
go

SETUSER
go

print    'TEMPINVENTORY'
SETUSER 'dbo'
go

create table dbo.TEMPINVENTORY (
SKU varchar(19) not null,
VENDOR_6    char(6) not null,
CLASS   smallint    not null,
UNIT_COST   numeric(7, 2)   null,
MIN_BALANCE int null,
QT_ON_HAND  int null,
QT_ON_ORDER int null,
RECEIPT_MTD int null,
MONTHLY_SOLD    int null,
ANNUAL_SOLD int null,
NUM_STOCKOUTS_YTD   smallint    null,
NUM_STOCKOUTS_MTD   smallint    null,
NUM_ORD_CURMONTH    int null,
NUM_ORD_CURYEAR int null,
SALES_CURMONTH  numeric(9, 2)   null,
SALES_CURYEAR   numeric(9, 2)   null,
SALES_COST_CURMONTH numeric(9, 2)   null,
SALES_COST_YTD  numeric(9, 2)   null,
TOT_MONTH_END_BAL   int null,
LAST_SALE   datetime    null,
LAST_MAINT  datetime    not null,
NO_MONTHS   tinyint null,
NOT_USED    numeric(3, 2)   null,
TURNS_RATIO numeric(7, 2)   null,
REG_PRICE   numeric(7, 2)   null
)
lock allpages
on 'default'
go

print   'SKUDex'
create unique nonclustered index SKUDex
on dbo.TEMPINVENTORY (SKU)
on 'default'
go

grant Delete on TEMPINVENTORY to H2KAdmin 
go

grant Delete on TEMPINVENTORY to Register 
go

grant Insert on TEMPINVENTORY to H2KAdmin 
go

grant Insert on TEMPINVENTORY to Register 
go

grant References on TEMPINVENTORY to H2KAdmin 
go

grant References on TEMPINVENTORY to Register 
go

grant Select on TEMPINVENTORY to H2KAdmin 
go

grant Select on TEMPINVENTORY to Register 
go

grant Update on TEMPINVENTORY to H2KAdmin 
go

grant Update on TEMPINVENTORY to Register 
go

SETUSER
go

print    'USERS'
SETUSER 'dbo'
go

create table dbo.USERS (
USERID  varchar(12) not null,
USER_NAME   varchar(32) null,
ACTIVE  bit not null,
LAST_LOGON  datetime    null,
ACCESS_PRIVS    varbinary(255)  null,
PREFS   image   null,
ACCESSLEVEL tinyint null,
PWORD_EXP   smalldatetime   null,
DEPARTMENT  int null,
pword   varchar(255)    null,
constraint USERS_11805312391 PRIMARY KEY  CLUSTERED ( USERID )
)
lock allpages
on 'default'
go

grant Delete on USERS to H2KAdmin 
go

grant Delete on USERS to oper_role 
go

grant Delete on USERS to sa_role 
go

grant Insert on USERS to H2KAdmin 
go

grant Insert on USERS to oper_role 
go

grant Insert on USERS to sa_role 
go

grant References on USERS to navigator_role 
go

grant References on USERS to oper_role 
go

grant References on USERS to sa_role 
go

grant Select on USERS to H2KAdmin 
go

grant Select on USERS to navigator_role 
go

grant Select on USERS to oper_role 
go

grant Select on USERS to Register 
go

grant Select on USERS to sa_role 
go

grant Update on USERS to H2KAdmin 
go

grant Update on USERS to navigator_role 
go

grant Update on USERS to oper_role 
go

grant Update on USERS to sa_role 
go

SETUSER
go

print    'VENDOR_PRODS'
SETUSER 'dbo'
go

create table dbo.VENDOR_PRODS (
VENDOR_6    char(6) not null,
SKU varchar(19) not null,
VENDOR_SKU  varchar(19) not null,
DEF_ORDER_QTY   int null,
MIN_BALANCE int null,
UNIT_COST   numeric(7, 2)   null,
PURCH_UOM   char(3) null,
UNIT_PRICE_CODE tinyint null,
QTY_CONV_FACTOR int null,
UNIT_WEIGHT numeric(4, 2)   null,
LAST_MAINT  datetime    null,
MAINT_BY    varchar(12) null,
constraint VENDOR_PRO_5440049691 PRIMARY KEY  CLUSTERED ( VENDOR_6,SKU )
)
lock allpages
on 'default'
go

print   'SKU'
create nonclustered index SKU
on dbo.VENDOR_PRODS (SKU)
on 'default'
go

print   'VENDOR_6'
create nonclustered index VENDOR_6
on dbo.VENDOR_PRODS (VENDOR_6)
on 'default'
go

print   'VENDOR_SKU'
create nonclustered index VENDOR_SKU
on dbo.VENDOR_PRODS (VENDOR_SKU)
on 'default'
go

grant Delete on VENDOR_PRODS to H2KAdmin 
go

grant Delete on VENDOR_PRODS to oper_role 
go

grant Delete on VENDOR_PRODS to sa_role 
go

grant Insert on VENDOR_PRODS to H2KAdmin 
go

grant Insert on VENDOR_PRODS to navigator_role 
go

grant Insert on VENDOR_PRODS to oper_role 
go

grant Insert on VENDOR_PRODS to sa_role 
go

grant References on VENDOR_PRODS to navigator_role 
go

grant References on VENDOR_PRODS to oper_role 
go

grant References on VENDOR_PRODS to sa_role 
go

grant Select on VENDOR_PRODS to H2KAdmin 
go

grant Select on VENDOR_PRODS to navigator_role 
go

grant Select on VENDOR_PRODS to oper_role 
go

grant Select on VENDOR_PRODS to sa_role 
go

grant Update on VENDOR_PRODS to H2KAdmin 
go

grant Update on VENDOR_PRODS to navigator_role 
go

grant Update on VENDOR_PRODS to oper_role 
go

grant Update on VENDOR_PRODS to sa_role 
go

SETUSER
go

print    'VENDORS'
SETUSER 'dbo'
go

create table dbo.VENDORS (
VENDOR_6    char(6) not null,
VENDOR_3    char(3) null,
VENDOR  varchar(50) not null,
SHORT_NAME  varchar(10) null,
FAX varchar(20) null,
ADDR1   varchar(35) null,
ADDR2   varchar(35) null,
CITY    varchar(35) null,
STATE   char(2) null,
ZIP varchar(10) null,
PHONE   varchar(20) null,
TERMS   varchar(40) null,
BUYER   varchar(12) null,
CONTACT varchar(30) null,
BACK_ORD_OK bit DEFAULT    0        not null,
PRINT_COST  bit DEFAULT    0        not null,
WE_PAY_FREIGHT  bit DEFAULT    0        not null,
SHIP_VIA    tinyint null,
ALLOWANCE   money   null,
EMAIL   varchar(30) null,
WEB_PAGE    varchar(50) null,
LAST_MAINT  datetime    null,
MAINT_BY    varchar(12) null,
SPECIAL_NOTES   varchar(40) null,
ORDER_CYCLE int null,
constraint VENDORS_tm_13600078761 PRIMARY KEY  CLUSTERED ( VENDOR_6 )
)
lock allpages
on 'default'
go

grant Delete on VENDORS to H2KAdmin 
go

grant Delete on VENDORS to oper_role 
go

grant Delete on VENDORS to sa_role 
go

grant Insert on VENDORS to H2KAdmin 
go

grant Insert on VENDORS to navigator_role 
go

grant Insert on VENDORS to oper_role 
go

grant Insert on VENDORS to sa_role 
go

grant References on VENDORS to navigator_role 
go

grant References on VENDORS to oper_role 
go

grant References on VENDORS to sa_role 
go

grant Select on VENDORS to H2KAdmin 
go

grant Select on VENDORS to navigator_role 
go

grant Select on VENDORS to oper_role 
go

grant Select on VENDORS to Register 
go

grant Select on VENDORS to sa_role 
go

grant Update on VENDORS to H2KAdmin 
go

grant Update on VENDORS to navigator_role 
go

grant Update on VENDORS to oper_role 
go

grant Update on VENDORS to sa_role 
go

SETUSER
go

print    'Internet_View'
SETUSER  'dbo'
go

 CREATE VIEW dbo.Internet_View  
 
AS SELECT  
  
    p.class         Class,   
    i.vendor_6      Vendor_6,   
    i.sku           SKU,   
    p.description   Description,   
    p.reg_price     Retail, 
    p.sale_price    Sale, 
    p.phys_inv_group InvGroup, 
    i.qt_on_hand    OnHand, 
    i.qt_on_order   OnOrder 
  
FROM PRODUCTS p, INVENTORY i 
WHERE p.SKU = i.SKU  
      AND ((i.qt_on_hand > 0) OR (i.qt_on_order > 0)) 
go

grant Select on Internet_View to H2KAdmin 
go

grant Select on Internet_View to navigator_role 
go

grant Select on Internet_View to oper_role 
go

grant Select on Internet_View to Register 
go

grant Update on Internet_View to oper_role 
go

SETUSER
go

print    'INV_ANALYSIS'
SETUSER  'dbo'
go

       CREATE VIEW INV_ANALYSIS AS SELECT  i.VENDOR_6, 
i.SKU, i.CLASS, i.SALES_CURMONTH, i.SALES_COST_CURMONTH,  i.SALES_CURYEAR, i.SALES_COST_YTD, 
i.LAST_SALE,  MONTH_PROFIT = (i.SALES_CURMONTH - i.SALES_COST_CURMONTH),  
MONTH_PROF_PERC = (i.SALES_CURMONTH - i.SALES_COST_CURMONTH) / i.SALES_CURMONTH ,  
ANNUAL_PROFIT = (i.SALES_CURYEAR - i.SALES_COST_YTD),  
ANNUAL_PROF_PERC = (i.SALES_CURYEAR - i.SALES_COST_YTD) / i.SALES_CURYEAR,  
YTD_SOLD = i.ANNUAL_SOLD, SOLD_THIS_MONTH = i.MONTHLY_SOLD, TURNS = i.TURNS_RATIO,  
STOCKOUTS = i.NUM_STOCKOUTS_YTD  
FROM INVENTORY i 
WHERE i.SALES_CURYEAR > 0 AND i.SALES_CURMONTH > 0
go

grant Select on INV_ANALYSIS to H2KAdmin 
go

grant Select on INV_ANALYSIS to Register 
go

SETUSER
go

print    'INV2'
SETUSER  'dbo'
go

       CREATE VIEW INV2 AS SELECT  i.VENDOR_6, 
i.SKU, i.CLASS, i.SALES_CURMONTH, i.SALES_COST_CURMONTH,  i.SALES_CURYEAR, i.SALES_COST_YTD, 
i.LAST_SALE,  MONTH_PROFIT = (i.SALES_CURMONTH - i.SALES_COST_CURMONTH),   
ANNUAL_PROFIT = (i.SALES_CURYEAR - i.SALES_COST_YTD),  
ANNUAL_PROF_PERC = (i.SALES_CURYEAR - i.SALES_COST_YTD) / i.SALES_CURYEAR,  
YTD_SOLD = i.ANNUAL_SOLD, SOLD_THIS_MONTH = i.MONTHLY_SOLD, TURNS = i.TURNS_RATIO,  
STOCKOUTS = i.NUM_STOCKOUTS_YTD  
FROM INVENTORY i 
WHERE i.SALES_CURYEAR > 0
go

SETUSER
go

print    'INVEDITVIEW'
SETUSER  'dbo'
go

      CREATE VIEW dbo.INVEDITVIEW 
   
AS SELECT   p.vendor_3 VENDOR_3,   
            p.upc UPC,   
            p.description DESCRIPTION,   
            p.class CLASS, 
            p.label_type LABEL_TYPE, 
            i.min_balance MIN_BALANCE,  
        p.reg_price REG_PRICE, 
            p.sale_price SALE_PRICE,  
            i.vendor_6 VENDOR_6,   
            i.sku SKU   
         
   
FROM products p, inventory i 
where i.SKU = p.SKU 
go

grant Select on INVEDITVIEW to H2KAdmin 
go

grant Select on INVEDITVIEW to navigator_role 
go

grant Select on INVEDITVIEW to oper_role 
go

grant Select on INVEDITVIEW to Register 
go

grant Update on INVEDITVIEW to oper_role 
go

SETUSER
go

print    'item_view'
SETUSER  'dbo'
go

 CREATE VIEW dbo.item_view    
   
AS SELECT   p.vendor_3 VENDOR_3,   
            i.vendor_6 VENDOR_6,   
            i.sku SKU,   
            p.upc UPC,   
            p.class CLASS, 
            i.qt_on_hand QT_ON_HAND, 
            i.qt_on_order QT_ON_ORDER,  
            p.description DESCRIPTION,   
            p.UOM UOM,   
            i.unit_cost UNIT_COST,   
            p.reg_price REG_PRICE, 
            p.sale_price SALE_PRICE,
            i.last_sale LAST_SALE,
            p.maint_by MAINT_BY,
            p.last_maint LAST_MAINT,
            i.min_balance MIN_BALANCE   
               
   
FROM products p, inventory i   
   
WHERE p.sku = i.sku   
go

grant Select on item_view to H2KAdmin 
go

grant Select on item_view to Register 
go

SETUSER
go

print    'Label_View'
SETUSER  'dbo'
go

   CREATE VIEW dbo.Label_View  
 
AS SELECT    
    p.sku SKU, 
    p.description Product, 
    p.class Class, 
    p.phys_inv_group Invgroup, 
    p.reg_price Reg, 
    p.sale_price Sale, 
    p.upc Upc, 
    p.label_type Type 
     
FROM PRODUCTS p 
 
WHERE p.label_type = 'A' or p.label_type = 'I' 
go

grant Select on Label_View to H2KAdmin 
go

grant Select on Label_View to navigator_role 
go

grant Select on Label_View to oper_role 
go

grant Select on Label_View to Register 
go

grant Update on Label_View to oper_role 
go

SETUSER
go

print    'MISSING_INVENTORY'
SETUSER  'dbo'
go

  CREATE VIEW dbo.MISSING_INVENTORY  
AS select * FROM PRODUCTS 
WHERE NOT EXISTS 
(SELECT SKU FROM INVENTORY 
 WHERE PRODUCTS.SKU=INVENTORY.SKU) 
go

grant Select on MISSING_INVENTORY to H2KAdmin 
go

grant Select on MISSING_INVENTORY to navigator_role 
go

grant Select on MISSING_INVENTORY to oper_role 
go

grant Select on MISSING_INVENTORY to Register 
go

grant Update on MISSING_INVENTORY to oper_role 
go

SETUSER
go

print    'PO_ITEM'
SETUSER  'dbo'
go

           CREATE VIEW dbo.PO_ITEM    
   
AS SELECT   p.vendor_3 VENDOR_3,   
            vp.vendor_6 VENDOR_6,   
            i.sku SKU,   
            vp.sku OUR_ITEM_NUM,   
            p.upc UPC,   
            p.description Description,   
            vp.purch_uom UOM,   
            vp.unit_cost UNIT_PRICE,   
            i.qt_on_hand OnHand,   
            i.qt_on_order OnOrder,   
            vp.vendor_sku VENDOR_SKU,   
            vp.def_order_qty DEF_QTY,   
            p.class CLASS,   
            vp.min_balance MIN_BALANCE, 
            vp.QTY_CONV_FACTOR QTY_CONV_FACTOR   
         
   
FROM products p, inventory i, vendor_prods vp 
where vp.SKU = i.SKU and i.SKU = p.SKU 
   
go

grant Select on PO_ITEM to H2KAdmin 
go

grant Select on PO_ITEM to Register 
go

SETUSER
go

print    'po_item_view'
SETUSER  'dbo'
go

   CREATE VIEW dbo.po_item_view 
   
AS SELECT   p.vendor_3 VENDOR_3,   
            v.vendor_6 VENDOR_6,   
            i.sku SKU,   
            p.upc UPC,   
            p.class CLASS, 
            i.qt_on_hand QT_ON_HAND, 
            i.qt_on_order QT_ON_ORDER,  
            p.description DESCRIPTION,   
            v.PURCH_UOM UOM,   
            v.unit_cost UNIT_COST,   
            p.reg_price REG_PRICE, 
            p.sale_price SALE_PRICE,
            i.last_sale LAST_SALE,
      p.maint_by MAINT_BY,
            p.last_maint LAST_MAINT,
            i.min_balance MIN_BALANCE,
            v.qty_conv_factor QTY_CONV_FACTOR,
            v.vendor_sku VENDOR_SKU  
   
FROM products p, inventory i, vendor_prods v   
   
WHERE p.sku = i.sku and p.sku = v.sku   
go

grant Select on po_item_view to H2KAdmin 
go

grant Select on po_item_view to Register 
go

SETUSER
go

print    'Product_view'
SETUSER  'dbo'
go

   CREATE VIEW dbo.Product_view    
   
AS SELECT   p.vendor_3 Vendor_3,   
            i.vendor_6 Vendor_6,   
            i.sku SKU,   
            p.upc UPC,   
            p.class Class, 
            i.qt_on_hand OnHand, 
            i.qt_on_order OnOrder,  
            p.description Description,   
            p.UOM UOM,   
            i.unit_cost Cost,   
            p.reg_price Retail, 
            p.sale_price Sale   
               
   
FROM products p, inventory i   
   
WHERE p.sku = i.sku   
go

grant Select on Product_view to H2KAdmin 
go

grant Select on Product_view to Register 
go

SETUSER
go

print    'Sales_analysis'
SETUSER  'dbo'
go

     CREATE VIEW dbo.Sales_analysis 
 
AS SELECT  
  
    p.class         Class,   
    i.vendor_6      Vendor_6,   
    i.sku           SKU,  
    i.unit_cost     Price,  
    p.description   Description,   
    p.reg_price     Retail, 
    p.sale_price   Sale, 
    p.phys_inv_group  InvGroup, 
    i.qt_on_hand    OnHand, 
    i.qt_on_order   OnOrder, 
    i.monthly_sold  Msold, 
    i.annual_sold   Asold 
  
FROM PRODUCTS p, INVENTORY i 
WHERE p.SKU = i.SKU  
go

grant Select on Sales_analysis to H2KAdmin 
go

grant Select on Sales_analysis to navigator_role 
go

grant Select on Sales_analysis to oper_role 
go

grant Select on Sales_analysis to Register 
go

grant Update on Sales_analysis to oper_role 
go

SETUSER
go

print    'SalesView'
SETUSER  'dbo'
go

      CREATE VIEW dbo.SalesView  
 
AS SELECT  
    s.sale_date     DATE, 
    i.last_sale     LAST_SALE, 
    s.sku           SKU, 
    i.qt_on_hand    ON_HAND, 
    i.monthly_sold  MONTHLY, 
    i.annual_sold   ANNUAL, 
    i.sales_curmonth MONTHLY_SALES, 
    i.sales_curyear YTD_SALES, 
    s.receipt_num   RECEIPT 
 
  
FROM sales s, inventory i 
 
WHERE s.sku = i.sku  
go

grant Select on SalesView to H2KAdmin 
go

grant Select on SalesView to navigator_role 
go

grant Select on SalesView to oper_role 
go

grant Update on SalesView to oper_role 
go

SETUSER
go

print    'VENDOR_COPY'
SETUSER  'dbo'
go

 CREATE VIEW dbo.VENDOR_COPY    
   
AS SELECT   vp.vendor_6 VENDOR_6,   
            vp.sku SKU,      
            vp.purch_uom PURCH_UOM,   
            vp.unit_cost UNIT_COST,   
            vp.vendor_sku VENDOR_SKU,   
            vp.def_order_qty DEF_ORDER_QTY,   
            i.class CLASS,   
            vp.min_balance MIN_BALANCE, 
            vp.QTY_CONV_FACTOR QTY_CONV_FACTOR,
            vp.unit_price_code UNIT_PRICE_CODE,
            vp.unit_weight UNIT_WEIGHT,
            vp.last_maint LAST_MAINT,
            vp.maint_by MAINT_BY 
              
         
   
FROM inventory i, vendor_prods vp 
where vp.SKU = i.SKU 
go

grant Select on VENDOR_COPY to H2KAdmin 
go

grant Select on VENDOR_COPY to H2KAdmin_role 
go

grant Select on VENDOR_COPY to navigator_role 
go

grant Select on VENDOR_COPY to oper_role 
go

grant Select on VENDOR_COPY to Register 
go

grant Select on VENDOR_COPY to replication_role 
go

grant Select on VENDOR_COPY to sa_role 
go

grant Select on VENDOR_COPY to sso_role 
go

grant Select on VENDOR_COPY to sybase_ts_role 
go

SETUSER
go

print    'Crap'
SETUSER  'dbo'
go

     CREATE PROCEDURE dbo.Crap
AS 

    BEGIN 
        PRINT "Starting 0"
        
        PRINT "A SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'a%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "B SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'b%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "C SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'c%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "D SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'd%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "E SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'e%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "F SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'f%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "G SKUS"
  update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'g%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "H SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'h%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "i SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'i%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "j SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'j%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "k SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'k%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "l SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'l%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "m SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'm%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "n SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'n%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "o SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'o%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "p SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'p%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "q SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'q%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "r SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'r%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "s SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 's%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "t SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 't%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "u SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'u%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "v SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'v%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "w SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'w%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "x SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'x%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "y SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
   WHERE SKU like 'y%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 

        PRINT "z SKUS"
        update tempinventory set monthly_sold = 0, sales_curmonth = 0, 
        sales_cost_curmonth = 0
        WHERE SKU like 'z%' AND monthly_sold != 0 or sales_curmonth != 0 or sales_cost_curmonth != 0 
    END 
go

SETUSER
go

print    'H2K_Archive_Dept_Totals'
SETUSER  'dbo'
go

    CREATE PROCEDURE dbo.H2K_Archive_Dept_Totals (@saleDate datetime)  
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    Should be called before the end of month totals are zeroed out for each 
    department. This procedure takes the total sales values for each department 
    and saves it to the DEPT_SALES table.   
   
   
    AUTHOR:    Gregory Stone   
    DATE:      5 Jan 2000   
*/ 
 
AS  
 
BEGIN  
   
    DECLARE @rowCount   int 
 
-- First make sure there are no entries for this month/year combo already. 
    SELECT @rowCount = @@rowCount 
    IF (SELECT COUNT(*) FROM DEPT_SALES 
          WHERE DATEPART(month, DATE) = DATEPART(month, @saleDate) 
          AND DATEPART(year, DATE) = DATEPART(year, @saleDate)) > 0 
 
    BEGIN 
-- Delete the old entries, assume this update is the newer fresher data. 
        DELETE FROM DEPT_SALES 
        WHERE DATEPART(month, DATE) = DATEPART(month, @saleDate) 
          AND DATEPART(year, DATE) = DATEPART(year, @saleDate) 
    END 
     
-- Now create the records  
    INSERT DEPT_SALES (DEPT_SKU, DATE, TOTAL_SALES) 
    SELECT SKU, @saleDate, SALES_CURMONTH 
    FROM INVENTORY 
 WHERE SKU = 'R/C DEPT' 
        OR SKU = 'CRAFT DEPT' 
        OR SKU = 'HOBBY DEPT' 
        OR SKU = 'TRAIN DEPT' 
        OR SKU = 'GAMES DEPT' 
        OR SKU = 'MISC MAGAZINE' 
        OR SKU = 'SALES TX' 
 
END 
 
 
go

SETUSER
go

print    'H2K_CalcInvCosts'
SETUSER  'dbo'
go

   CREATE PROCEDURE dbo.H2K_CalcInvCosts 
 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    Maintenance procedure used to update the cost values in the inventory 
    file. Since the individual transactions that come from the register 
    don't have the cost in them, we can't calculate them in the trigger 
    that inserts into sales.   
   
   
    AUTHOR:    Gregory Stone   
 DATE:      5 Jan 2000   
*/ 
  
 
AS  
 
BEGIN  
 
    UPDATE INVENTORY 
    SET SALES_COST_CURMONTH = MONTHLY_SOLD * UNIT_COST, 
        SALES_COST_YTD = ANNUAL_SOLD * UNIT_COST 
    WHERE MONTHLY_SOLD > 0 
 
END  
go

SETUSER
go

print    'H2K_CalcTurnsRatio'
SETUSER  'dbo'
go

   CREATE PROCEDURE dbo.H2K_CalcTurnsRatio 
 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    At month end the number of inventory turns (TURNS_RATIO) for all items 
    in inventory is calculated by dividing the year-to-date quantity sold 
    (ANNUAL_SOLD), by the average month end inventory level and then projecting 
    for 12 months.  
    The average Month end inventory level is calculated by adding the sum of 
    all month end quantities on hand (TOT_MONTH_END_BAL) to the current quantity 
    on hand (QT_ON_HAND), and dividing by the number of months (NO_MONTHS) ytd the 
    item has been stocked + 1. Thus: 
 
    AVG_LEVEL = (TOT_MONTH_END_BAL + QT_ON_HAND) / (NO_MONTHS + 1) 
    TURNS_RATIO = (12 * ANNUAL_SOLD) / (AVG_LEVEL * (NO_MONTHS + 1)) 
     
   
   
    AUTHOR:    Gregory Stone   
    DATE:      31 May 2000   
*/ 
 
 
AS  
 
    BEGIN 
     
        DECLARE @avgLevel int 
        DECLARE @turns numeric(7,2) 
     
     -- Create a cursor to iterate over each row that needs turns updated;  
     -- i.e. any item that has sold this month 
     
        DECLARE turnIt CURSOR FOR   
            SELECT ANNUAL_SOLD, MONTHLY_SOLD, NO_MONTHS, TOT_MONTH_END_BAL, TURNS_RATIO, QT_ON_HAND 
            FROM INVENTORY   
            WHERE MONTHLY_SOLD > 0 
                AND QT_ON_HAND >= 0 
     
     -- Places to hold the values 
        DECLARE @YTDSold        int 
 DECLARE @MTDSold        int 
        DECLARE @noMonths       int 
        DECLARE @monthEndTot    int 
        DECLARE @oldTurns       numeric(7,2) 
        DECLARE @qtyOnHand      int 
     
        OPEN turnIt 
     
        FETCH turnIt into  @YTDSold, @MTDSold, @noMonths, @monthEndTot, @oldTurns, @qtyOnHand 
        WHILE @@SQLSTATUS = 0 
        BEGIN 
        -- Calc the actual turns ratio. 
            IF @noMonths = null 
                SELECT @noMonths = 0 
            SELECT @avgLevel = (@MTDSold + @qtyOnHand)/ (@noMonths + 1) 
            IF @avgLevel = 0  
                SELECT @turns = 100 
            ELSE 
                SELECT @turns = (12 * @YTDSold) / (@avgLevel * (@noMonths + 1)) 
 
        -- Update the record. 
            UPDATE INVENTORY 
                SET TOT_MONTH_END_BAL = (@monthEndTot + @qtyOnHand), 
                    NO_MONTHS = @noMonths + 1, TURNS_RATIO = @turns 
                WHERE CURRENT of turnIt 
 
           /* UPDATE INVENTORY 
                SET TURNS_RATIO = @turns    
                WHERE CURRENT of turnIt*/ 
 
            PRINT "Updated a record..." 
 
        -- Fetch the next row 
            FETCH turnIt into  @YTDSold, @MTDSold, @noMonths, @monthEndTot, @oldTurns, @qtyOnHand 
        END 
        
       CLOSE turnIt 
        DEALLOCATE CURSOR turnIt   
     
    END  
go

SETUSER
go

print    'H2K_CLEAN_ORDER_QTY'
SETUSER  'dbo'
go

    CREATE PROCEDURE dbo.H2K_CLEAN_ORDER_QTY;1  
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    This rips through the inventory, checking all items that show a qty on order, and fixes it to equal 
    Only the amount that appears on PO's.   
   
   
    AUTHOR:    Tom Byrne   
    DATE:       23-May-2000 
*/ 
AS  
 
    BEGIN  
     
-- Declare my working variables. 
 
    DECLARE @sku            varchar(19) 
    DECLARE @qtonorderinv   int 
    DECLARE @recQty         int 
    DECLARE @vendor6        varchar(6) 
    DECLARE @qtonorderpo    int 
    DECLARE @ponum          varchar(14) 
    DECLARE @tempval        int 
    DECLARE @tempval2       int 
    
    DECLARE @convFactor     int 
    DECLARE @uom            varchar(6) 
  
 
 
 
-- Get a cursor for every row in the PO_ITEMS 
    PRINT "Declaring cursor..." 
    DECLARE Kills CURSOR FOR 
        SELECT i.SKU, i.QT_ON_ORDER 
        FROM INVENTORY i 
        WHERE i.QT_ON_ORDER != 0
        FOR READ ONLY 
 
    OPEN Kills 
    FETCH Kills INTO @sku, @qtonorderinv 
        WHILE @@SQLSTATUS = 0 
            BEGIN 
              IF @qtonorderinv < 0 
                    BEGIN 
                        UPDATE INVENTORY 
                        SET QT_ON_ORDER = 0 
                        WHERE SKU = @sku 
                    END 
                ELSE 
           BEGIN 
                        DECLARE newval CURSOR FOR 
                        SELECT poi.QTY, poi.QTY_RECEIVED, poi.PO_NUM 
                        FROM PO_ITEMS poi 
                        WHERE poi.SKU = @sku 
  FOR READ ONLY  
                        SELECT @tempval = 0 
                 OPEN newVal 
                        FETCH newVal into @qtonorderpo, @recQty, @ponum 
                        WHILE @@SQLSTATUS = 0 
                        BEGIN 
                       IF (@qtonorderpo - @recQty) > 0 
                   BEGIN 
                                    SELECT @uom =  
                                    (SELECT vp.PURCH_UOM  
                                    FROM VENDOR_PRODS vp  
                                    WHERE vp.SKU = @sku  
                                   AND vp.VENDOR_6 = (SELECT VENDOR_6 FROM PURCHASE_ORDERS po WHERE po.PO_NUM = @ponum)) 
 
                                    IF @uom = 'CS' 
                         BEGIN 
            SELECT @tempval =  @tempval + ((@qtonorderpo - @recQty) * (select QTY_CONV_FACTOR from VENDOR_PRODS vp where vp.SKU = @sku and vp.VENDOR_6 = (select VENDOR_6 from PURCHASE_ORDERS where PO_NUM = @ponum))) 
  END 
                                    ELSE 
                                        SELECT @tempval = @tempval + (@qtonorderpo - @recQty) 
 
                                            
                                END 
  
       FETCH newVal into @qtonorderpo, @recQty, @ponum 
 
                        END 
                        DEALLOCATE CURSOR newVal 
                        UPDATE INVENTORY SET QT_ON_ORDER = @tempval where SKU = @sku 
       
  END    
            FETCH Kills INTO @sku, @qtonorderinv 
            END 
 
 
    DEALLOCATE CURSOR Kills 
 
    END  

   
   
 
-- Get a cursor for every row in the PO_ITEMS 
 /*   PRINT "Declaring cursor..." 
    DECLARE Kills CURSOR FOR 
        SELECT i.SKU, i.QT_ON_ORDER 
        FROM INVENTORY i 
        
        FOR READ ONLY 
 
    OPEN Kills 
    FETCH Kills INTO @sku, @qtonorderinv 
        WHILE @@SQLSTATUS = 0 
            BEGIN 
                IF @qtonorderinv < 0 
                    BEGIN 
                        UPDATE INVENTORY 
                        SET QT_ON_ORDER = 0 
                        WHERE SKU = @sku 
                    END 
                ELSE 
                    BEGIN 
         DECLARE newval CURSOR FOR 
                        SELECT poi.QTY, poi.QTY_RECEIVED, poi.PO_NUM 
                        FROM PO_ITEMS poi 
                        WHERE poi.SKU = @sku 
                        FOR READ ONLY  
         SELECT @tempval = 0 
                        OPEN newVal 
                        FETCH newVal into @qtonorderpo, @recQty, @ponum 
                        WHILE @@SQLSTATUS = 0 
                        BEGIN 
                            IF (@qtonorderpo - @recQty) > 0 
                                BEGIN 
                                    SELECT @uom =  
                                    (SELECT vp.PURCH_UOM  
                                    FROM VENDOR_PRODS vp  
                        WHERE vp.SKU = @sku  
                                   AND vp.VENDOR_6 = (SELECT VENDOR_6 FROM PURCHASE_ORDERS po WHERE po.PO_NUM = @ponum)) 
 
                                    IF @uom = 'CS' 
           BEGIN 
                                            SELECT @tempval =  @tempval + ((@qtonorderpo - @recQty) * (select QTY_CONV_FACTOR from VENDOR_PRODS vp where vp.SKU = @sku and vp.VENDOR_6 = (select VENDOR_6 from PURCHASE_ORDERS where PO_NUM = @ponum))) 
                                        END 
                                    ELSE 
                                        SELECT @tempval = @tempval + (@qtonorderpo - @recQty) 
 
                                            
                         END 
  
                            FETCH newVal into @qtonorderpo, @recQty, @ponum 
 
                        END 
                        DEALLOCATE CURSOR newVal 
                        UPDATE INVENTORY SET QT_ON_ORDER = @tempval where SKU = @sku 
       
                    END    
            FETCH Kills INTO @sku, @qtonorderinv 
            END 
 
 
    DEALLOCATE CURSOR Kills 
 
    END  */
go

SETUSER
go

print    'H2K_Commit_Dept_Sales'
SETUSER  'dbo'
go

        CREATE PROCEDURE dbo.H2K_Commit_Dept_Sales (@saleDate DATETIME)  
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    This procedure summarizes the department sales, and then updates the  
    inventory table's department entries so monthly and yearly running totals 
    of non-sku'd sales are tracked.   
   
   
    AUTHOR:    Gregory Stone   
    DATE:      4 Jan 2000   
*/ 
 
AS  
 
BEGIN  
 
    DECLARE @salesTot   NUMERIC(9,2)   
    DECLARE @qtyTot     INT   
    DECLARE @deptSKU    VARCHAR(19) 
    DECLARE @myDeptSKU VARCHAR(19) 
    DECLARE @transCode  CHAR(3)   
    DECLARE @msg VARCHAR(100) 
     
    DECLARE dept_sales CURSOR FOR 
    SELECT TRANS_CODE, QTY = SUM(QTY), AMOUNT = SUM(EXT_PRICE), SKU DEPT_SKU 
    FROM DAILY_TRANS 
    WHERE (TRANS_CODE = '0' 
       OR TRANS_CODE = '2' 
       OR TRANS_CODE = '4' 
       OR TRANS_CODE = '6' 
       OR TRANS_CODE = '8' 
       OR TRANS_CODE = '9') 
       AND SALE_DATE = @saleDate 
    GROUP BY SKU, TRANS_CODE 
 
    OPEN dept_sales 
        PRINT "Cursor opened..." 
        FETCH dept_sales into @transCode, @qtyTot, @salesTot, @deptSKU 
        WHILE @@SQLSTATUS = 0 
     
        -- Update the actual totals. 
        BEGIN 
            IF @deptSKU != '' 
                BEGIN 
            -- Process items with a SKU value. 
                    SELECT @msg = "Updating " + @deptSKU + "Department..." 
     PRINT @msg 
                    BEGIN 
                    -- Actually update this record. 
                        UPDATE INVENTORY 
                        SET MONTHLY_SOLD = MONTHLY_SOLD + @qtyTot, 
                            ANNUAL_SOLD = ANNUAL_SOLD + @qtyTot, 
                            SALES_CURMONTH = SALES_CURMONTH + @salesTot, 
                            SALES_CURYEAR = SALES_CURYEAR + @salesTot, 
                            LAST_SALE = @saleDate, 
                            LAST_MAINT = GETDATE() 
                       WHERE SKU = @deptSKU 
                    END 
                END 
            ELSE 
                BEGIN 
            -- Process items without a SKU value, which are usually discounted items. 
                    SELECT @msg = "Subtracting discounts for " + @deptSKU + "Department..." 
                    PRINT @msg 
                    SELECT @myDeptSKU = 
                    CASE 
                        WHEN @transCode = '0' THEN 'R/C DEPT' 
  WHEN @transCode = '2' THEN 'CRAFT DEPT' 
                        WHEN @transCode = '4' THEN 'HOBBY DEPT' 
                        WHEN @transCode = '6' THEN 'TRAIN DEPT' 
                        WHEN @transCode = '8' THEN 'GAMES DEPT' 
       WHEN @transCode = '9' THEN 'MISC MAGAZINE' 
                      ELSE '' 
                    END 
                    IF @myDeptSKU !=  '' 
                    BEGIN 
                    -- Actually update this record with the new dept SKU.  
                       UPDATE INVENTORY 
           SET MONTHLY_SOLD = MONTHLY_SOLD + @qtyTot, 
                            ANNUAL_SOLD = ANNUAL_SOLD + @qtyTot, 
                            SALES_CURMONTH = SALES_CURMONTH + @salesTot, 
                      SALES_CURYEAR = SALES_CURYEAR + @salesTot, 
                            LAST_SALE = @saleDate, 
                            LAST_MAINT = GETDATE() 
                        WHERE SKU = @myDeptSKU 
                    END 
    END 
 
        -- Grab another row.     
            FETCH dept_sales into @transCode, @qtyTot, @salesTot, @deptSKU 
        END 
    CLOSE dept_sales 
    DEALLOCATE CURSOR dept_sales 
 
-- Finally, Mark these transactions as having been processed. At the  
-- end of of the month we will toast them.   
   
    UPDATE DAILY_TRANS   
    SET RECONCILED = 1   
    WHERE (TRANS_CODE = '0' 
       OR TRANS_CODE = '2' 
       OR TRANS_CODE = '4' 
       OR TRANS_CODE = '6' 
       OR TRANS_CODE = '8' 
   OR TRANS_CODE = '9') 
       AND SALE_DATE = @saleDate 
 
END  
go

SETUSER
go

print    'H2K_Commit_Item_Sales'
SETUSER  'dbo'
go

     CREATE PROCEDURE dbo.H2K_Commit_Item_Sales (@saleDate DATETIME)      
   
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
*     
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved     
*        
*  PETRASOFT CONFIDENTIAL     
*   This file includes unpublished proprietary source code of Petrasoft      
*   Research, Inc. The copyright notice above does not evidence any actual     
*   or intended publication of such source code. You shall not disclose     
*   such Confidential Information and shall use it only in accordance with     
*   the terms of the license agreement you entered into with Petrasoft.     
*     
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
     
    
/*      
    This procedure inserts the SKU'd items into the SALES table. Sales   
    Tables triggers handle the nitty-gritty details of updating inventory   
    and clerk sales totals and on hand values.     
     
     
    AUTHOR:    Gregory Stone     
    DATE:      4 Jan 1999    
*/     
   
AS     
    
BEGIN   
-- Copy the item transactions for this date into the SALEs table  
    INSERT SALES (RECEIPT_NUM, SALE_DATE, CLERK_ID, SKU, TOT_PRICE,    
         QTY, QTY_SHIP, EXT_PRICE, UNIT_PRICE, DEPT)   
    SELECT RECEIPT_NUM, SALE_DATE, CLERK_ID, SKU, EXT_PRICE,    
           QTY, QTY, EXT_PRICE, UNIT_PRICE, DEPT    
    FROM DAILY_TRANS    
    WHERE (SKU != '' AND QTY != null)    
        AND TRANS_CODE = 'SCN'    
   AND SALE_DATE = @saleDate   
       AND RECONCILED = 0   
    ORDER by RECEIPT_NUM   
   
-- Now update the fields that are missing from the daily trans.  
    UPDATE SALES  
    SET  s.UNIT_COST = i.UNIT_COST,  
    s.EXT_COST = i.UNIT_COST * s.QTY 
    FROM INVENTORY i, SALES s  
    WHERE i.SKU = s.SKU  
        AND s.SALE_DATE = @saleDate 
   
-- We need to get just the class from PRODUCTS since not all sku-able 
-- items are on inventory control. 
    UPDATE SALES 
    SET s.CLASS = p.CLASS 
  FROM PRODUCTS p, SALES s 
    WHERE s.SKU = p.SKU 
        AND s.SALE_DATE = @saleDate 
 
    
-- Finally, Mark these transactions as having been processed. At the  
-- end of of the month we will toast them.   
   
    UPDATE DAILY_TRANS   
    SET RECONCILED = 1   
    WHERE (SKU != '' AND QTY != null)    
        AND TRANS_CODE = 'SCN'    
        AND SALE_DATE = @saleDate    
       
   
END     
go

SETUSER
go

print    'H2K_Commit_Sales_Tax'
SETUSER  'dbo'
go

  CREATE PROCEDURE dbo.H2K_Commit_Sales_Tax(@saleDate DATETIME)  
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    This procedure summarizes the SALES table data for sales tax and updates 
    the INVENTORY table entry that tracks the sales tax.   
   
   
    AUTHOR:    Gregory Stone   
    DATE:      5 Jan 2000   
*/ 
 
AS  
 
BEGIN  
 
    DECLARE @taxTot   NUMERIC(9,2) 
 DECLARE @msg      VARCHAR(255)  
     
    DECLARE taxes CURSOR FOR 
        SELECT AMOUNT = SUM(EXT_PRICE) 
        FROM DAILY_TRANS 
        WHERE TRANS_CODE = 'TAX' 
        AND SALE_DATE = @saleDate 
        FOR READ ONLY 
 
    OPEN taxes 
       FETCH taxes into @taxTot 
       IF @@ROWCOUNT > 0 
       BEGIN 
        -- Process items with a SKU value. 
            UPDATE INVENTORY 
            SET SALES_CURMONTH = SALES_CURMONTH + @taxTot, 
                SALES_CURYEAR = SALES_CURYEAR + @taxTot, 
                LAST_MAINT = GETDATE(), 
                LAST_SALE = @saleDate 
            WHERE SKU = 'SALES TX' 
        END 
        SELECT @msg = CONVERT(VARCHAR(10),@@SQLSTATUS) 
        PRINT @msg 
    CLOSE taxes 
    DEALLOCATE CURSOR taxes 
 
-- Mark these transactions as having been processed.  
-- At the end of of the month we will toast them. 
 
    UPDATE DAILY_TRANS 
    SET RECONCILED = 1 
    WHERE TRANS_CODE = 'TAX'  
    AND SALE_DATE = @saleDate  
 
END  
go

SETUSER
go

print    'H2K_Do_Sales_History'
SETUSER  'dbo'
go

          CREATE PROCEDURE dbo.H2K_Do_Sales_History (@inVendor varchar(3)) 
 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*  such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
/*    
    This procedure is called to generate a 13 month sales history for a particular 
    vendor. It copies the historic and active sales items into the SALES_HIST_TEMP 
    file. It also joins additional fields from other tables and then copies it  
    into the SALE_HIST_13 table. From there, other stored procs are called to  
    do the actual calculations. 
   
    AUTHOR:    Gregory Stone   
    DATE:      28 Jan 2000   
*/   
 
AS  
 
BEGIN  
 
    DECLARE @vendor varchar(7) 
    DECLARE @startMonth int 
 SELECT @vendor = STUFF('xxx%', 1, 3, @inVendor) 
     
-- Copy the actual sales items over from the historical data. Remove previous values first. 
    PRINT "COPYING HISTORICAL SALES..." 
    DELETE SALES_HIST_TEMP WHERE SKU LIKE @vendor 
 
    SELECT @startMonth = DATEPART(MONTH, getDate()) - 1 
    INSERT INTO SALES_HIST_TEMP 
    SELECT * 
    FROM SALES_LAST_YEAR 
    WHERE SKU LIKE @vendor 
        AND DATEPART(MONTH, SALE_DATE) >= @startMonth 
     
    INSERT INTO SALES_HIST_TEMP 
    SELECT * 
   FROM SALES 
    WHERE SKU LIKE @vendor 
 
-- Now propogate the history report table with only these items and their joined info. 
    PRINT "COPYING SKUs TO TRACK..." 
    DELETE SALES_HIST_13 WHERE SKU like @vendor 
 
 /*   INSERT INTO SALES_HIST_13 (SKU, DESCRIPTION) 
    SELECT DISTINCT(SALES_HIST_TEMP.SKU), DESCRIPTION 
    FROM PRODUCTS, SALES_HIST_TEMP 
    WHERE SALES_HIST_TEMP.SKU = PRODUCTS.SKU 
    AND SALES_HIST_TEMP.SKU LIKE @vendor 
*/ 
 
-- Darrell wants all of the products listed, so just blow in all skus and descriptions. 
    INSERT INTO SALES_HIST_13 (SKU, DESCRIPTION) 
    SELECT SKU, DESCRIPTION 
    FROM PRODUCTS 
    WHERE SKU like @vendor     
 
    PRINT "PROPOGATING JOINED INFO..." 
    UPDATE SALES_HIST_13 
    SET ON_HAND = QT_ON_HAND, 
        ON_ORDER = QT_ON_ORDER 
    FROM INVENTORY 
    WHERE SALES_HIST_13.SKU = INVENTORY.SKU 
 
-- Finally. call the subproc to do the actual tallies. 
  
    EXEC H2K_UpdateHist4Month @inVendor 
    
 
END  
go

SETUSER
go

print    'H2K_DoMonthlyRegTotals'
SETUSER  'dbo'
go

  CREATE PROCEDURE dbo.H2K_DoMonthlyRegTotals (@month INT) 
AS  
    BEGIN  
    SELECT  
          'Register 1' = CONVERT (CHAR(10), SUM(SALES_REG1)), 
          CONVERT (CHAR(5),  SUM(ITEMS_REG1)), 
          'Register 2' = CONVERT (CHAR(10), SUM(SALES_REG2)), 
          CONVERT (CHAR(5),  SUM(ITEMS_REG2)), 
          'Register 3' = CONVERT (CHAR(10), SUM(SALES_REG3)), 
          CONVERT (CHAR(5),  SUM(ITEMS_REG3)), 
          'Register 4' = CONVERT (CHAR(10), SUM(SALES_REG4)), 
          CONVERT (CHAR(5),  SUM(ITEMS_REG4)), 
          'Register 5' = CONVERT (CHAR(10), SUM(SALES_REG5)), 
          CONVERT (CHAR(5),  SUM(ITEMS_REG5)), 
          'Register 6' = CONVERT (CHAR(10), SUM(SALES_REG6)), 
          CONVERT (CHAR(5),  SUM(ITEMS_REG6)), 
 'Register 7' = CONVERT (CHAR(10), SUM(SALES_REG7)), 
          CONVERT (CHAR(5),  SUM(ITEMS_REG7)), 
          'Register 8' = CONVERT (CHAR(10), SUM(SALES_REG8)), 
          CONVERT (CHAR(5),  SUM(ITEMS_REG8)) 
    FROM REG_HISTORY 
    WHERE DATEPART(MONTH, DATE) = @month 
     
    SELECT 'Total Sales For Month' =  
        SUM(SALES_REG1) + SUM(SALES_REG2) +  SUM(SALES_REG3) + SUM(SALES_REG4) +  
        SUM(SALES_REG5) + SUM(SALES_REG6) +  SUM(SALES_REG7) + SUM(SALES_REG8) 
    FROM REG_HISTORY  
 WHERE DATEPART(MONTH, DATE) = @month 
END  
go

SETUSER
go

print    'H2K_GetDeptTotals'
SETUSER  'dbo'
go

  CREATE PROCEDURE dbo.H2K_GetDeptTotals 
AS 
 
BEGIN 
 
    SELECT * 
    FROM INVENTORY 
    WHERE SKU = 'R/C DEPT' 
        OR SKU = 'CRAFT DEPT' 
        OR SKU = 'HOBBY DEPT' 
        OR SKU = 'TRAIN DEPT' 
        OR SKU = 'GAMES DEPT' 
        OR SKU = 'MISC MAGAZINE' 
        OR SKU = 'SALES TX' 
 
END 
go

SETUSER
go

print    'H2K_GetItemClassAnalysis'
SETUSER  'dbo'
go

     CREATE PROCEDURE dbo.H2K_GetItemClassAnalysis 
 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*  This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
/*    
    This procedure is called to generate a 13 month sales history for a particular 
    vendor. It copies the historic and active sales items into the SALES_HIST_TEMP 
    file. It also joins additional fields from other tables and then copies it  
    into the SALE_HIST_13 table. From there, other stored procs are called to  
    do the actual calculations. 
   
    AUTHOR:    Gregory Stone   
    DATE:      3 Mar 2000   
*/   
 
AS  
 
BEGIN 
 
-- update the cost values since they aren't automatically inserted when register 
-- sales are imported. 
 
    EXECUTE H2K_CalcInvCosts 
 
    SELECT  
        CONVERT(CHAR(4), i.CLASS),  
        cc.NAME,  
        'MTD SALES' = CONVERT(CHAR(10), SUM(SALES_CURMONTH)), 
        'YTD SALES' = CONVERT(CHAR(10), SUM(SALES_CURYEAR)), 
        'MTD PROFIT' = CONVERT(CHAR(10), SUM(SALES_CURMONTH) - SUM(SALES_COST_CURMONTH)), 
        'YTD PROFIT' = CONVERT(CHAR(10), SUM(SALES_CURYEAR) - SUM(SALES_COST_YTD)), 
 
        'MTD PCT' = CONVERT(CHAR(6), (SUM(SALES_CURMONTH) - SUM(SALES_COST_CURMONTH))/ 
                                  SUM(SALES_CURMONTH)), 
 
        'YTD PCT' = CONVERT(CHAR(6), (SUM(SALES_CURYEAR) - SUM(SALES_COST_YTD))/ 
                                    SUM(SALES_CURYEAR)), 
        'MTD ITEMS' = CONVERT(CHAR(7), SUM(MONTHLY_SOLD)), 
        'YTD ITEMS' = CONVERT(CHAR(7), SUM(ANNUAL_SOLD)) 
 
    FROM INVENTORY i, CLASS_CODES cc 
    WHERE i.CLASS = cc.CLASS AND ANNUAL_SOLD > 0 
    GROUP BY i.CLASS, cc.NAME 
 
END  
go

SETUSER
go

print    'H2K_GoodItemClassAnalysis'
SETUSER  'dbo'
go

  CREATE PROCEDURE dbo.H2K_GoodItemClassAnalysis
 
-- This procedure brings back a good inventory class analysis unlike the fucked up one that cost me 4 days of
-- vacation.
AS
    BEGIN 

    UPDATE TEMPINVENTORY 
    SET SALES_COST_CURMONTH = MONTHLY_SOLD * UNIT_COST, 
        SALES_COST_YTD = ANNUAL_SOLD * UNIT_COST 
    WHERE MONTHLY_SOLD > 0 
    --Define class.
    DECLARE @curclass  int

    declare classes cursor for 
    SELECT CLASS FROM CLASS_CODES

    open classes
    fetch classes into @curclass
        while @@SQLSTATUS = 0
           BEGIN
            IF((SELECT SUM(MONTHLY_SOLD) FROM TEMPINVENTORY WHERE CLASS = @curclass) > 0)
                BEGIN     
                    SELECT  
                    CONVERT(CHAR(4), i.CLASS),  
                    cc.NAME,  
                    'MTD SALES' = SUM(SALES_CURMONTH), 
                    'YTD SALES' = SUM(SALES_CURYEAR), 
                    'MTD PROFIT' = SUM(SALES_CURMONTH) - SUM(SALES_COST_CURMONTH), 
             'YTD PROFIT' = SUM(SALES_CURYEAR) - SUM(SALES_COST_YTD), 
                    'MTD PCT' = (SUM(SALES_CURMONTH) - SUM(SALES_COST_CURMONTH))/ 
                                  SUM(SALES_CURMONTH), 
                    'YTD PCT' = (SUM(SALES_CURYEAR) - SUM(SALES_COST_YTD))/ 
                                    SUM(SALES_CURYEAR), 
                    'MTD ITEMS' = SUM(MONTHLY_SOLD), 
                    'YTD ITEMS' = SUM(ANNUAL_SOLD) 
 
                    FROM TEMPINVENTORY i, CLASS_CODES cc 
                    WHERE i.CLASS = cc.CLASS AND cc.class = @curclass AND ANNUAL_SOLD > 0
                    GROUP BY i.CLASS, cc.NAME 
                END
            ELSE
                BEGIN
                    SELECT  
     CONVERT(CHAR(4), i.CLASS),  
                    cc.NAME,  
                    'MTD SALES' = SUM(SALES_CURMONTH), 
                    'YTD SALES' = SUM(SALES_CURYEAR), 
                    'MTD PROFIT' = SUM(SALES_CURMONTH) - SUM(SALES_COST_CURMONTH), 
                    'YTD PROFIT' = SUM(SALES_CURYEAR) - SUM(SALES_COST_YTD), 
                    'MTD PCT' = 0, 
                    'YTD PCT' = (SUM(SALES_CURYEAR) - SUM(SALES_COST_YTD))/ 
                                    SUM(SALES_CURYEAR), 
                    'MTD ITEMS' = SUM(MONTHLY_SOLD), 
                    'YTD ITEMS' = SUM(ANNUAL_SOLD) 
 
                    FROM TEMPINVENTORY i, CLASS_CODES cc 
                    WHERE i.CLASS = cc.CLASS AND cc.class = @curclass AND ANNUAL_SOLD > 0
                    GROUP BY i.CLASS, cc.NAME 
                
                END
            FETCH classes into @curclass
        END
    DEALLOCATE CURSOR classes

    END 
go

SETUSER
go

print    'H2K_Kill_PO'
SETUSER  'dbo'
go

          CREATE PROCEDURE dbo.H2K_Kill_PO (@poNum varchar(10)) 
 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    Given a PO number, this method totally kills the PO and all the related 
    entries in the various tables. It also handle backing out the on order 
    values from the inventory file.   
   
   
    AUTHOR:    Gregory Stone   
    DATE:      14 Jan 2000 
*/ 
 
AS  
 
 
BEGIN  
 
-- First make sure the PO exists. 
     
    SELECT COUNT(*)  
    FROM PURCHASE_ORDERS 
    WHERE PO_NUM = @poNum 
 
    IF @@ROWCOUNT = 0 
        RETURN 
 
-- Declare my working variables. 
    DECLARE @killQty    int 
    DECLARE @qty       int 
    DECLARE @convFactor int 
    DECLARE @uom varchar(6) 
    DECLARE @sku        varchar(19) 
    DECLARE @vendor6    char(6)  
    DECLARE @foo        varchar(10) 
    DECLARE @recQty     int 
     
--cursor 
    declare tempcurs CURSOR FOR 
        SELECT po.VENDOR_6 from PURCHASE_ORDERS po where PO_NUM = @poNum 
        FOR READ ONLY 
    OPEN tempcurs 
    FETCH tempcurs into @vendor6 
    DEALLOCATE CURSOR tempcurs 
    PRINT "VENDOR:" 
    PRINT @vendor6 
-- Get a cursor for every row in the PO_ITEMS 
    PRINT "Declaring cursor..." 
    DECLARE Kills CURSOR FOR 
        SELECT po.SKU, po.QTY, po.QTY_RECEIVED, vp.QTY_CONV_FACTOR, vp.PURCH_UOM 
        FROM VENDOR_PRODS vp, PO_ITEMS po 
        WHERE po.SKU = vp.SKU 
            AND PO_NUM = @poNum 
            AND vp.VENDOR_6 = @vendor6 
        FOR READ ONLY 
 
    OPEN Kills 
    FETCH Kills INTO @sku, @qty, @recQty, @convFactor, @uom 
    WHILE @@SQLSTATUS = 0 
        BEGIN 
            IF @recQty = null 
                SELECT @recQty = 0 
 
            IF @uom = 'CS' 
                BEGIN 
                    SELECT @killQty =  (@qty * @convFactor) - (@recQty * @convFactor) 
                END 
            ELSE 
                SELECT @killQty = @qty - @recQty 
             
 
      -- Now decrement the on order counts as per the cases. 
 
            BEGIN 
                PRINT "Decrementing on order quantities for items..." 
                UPDATE INVENTORY 
                SET QT_ON_ORDER = QT_ON_ORDER - (@killQTY - @recQty) 
                WHERE SKU = @sku 
            END 
            FETCH Kills INTO @sku, @qty, @recQty, @convFactor, @uom 
        END 
    DEALLOCATE CURSOR Kills 
-- Now decrement counts for all other types. 
     
 
-- Kill the records in the po tables. 
    DELETE FROM PO_ITEMS  
    WHERE PO_NUM = @poNum 
 
    DELETE FROM PURCHASE_ORDERS 
    WHERE PO_NUM = @poNum 
     
END  
go

SETUSER
go

print    'H2K_MakeRegisterGroup'
SETUSER  'dbo'
go

    CREATE PROCEDURE dbo.H2K_MakeRegisterGroup 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
/*    
    Stored procedure to map the phsyical inventory group to the register 
    inventory group.   
   
    AUTHOR:    Gregory Stone   
    DATE:      29 Dec 1999   
*/   
   
AS    
   
BEGIN   
    DECLARE map_Groups CURSOR FOR   
    SELECT PHYS_INV_GROUP, REG_INV_GROUP   
    FROM PRODUCTS   
    WHERE REG_INV_GROUP = NULL 
       
    DECLARE @physGroup      SMALLINT 
    DECLARE @regGroup       SMALLINT 
    DECLARE @thePhysGroup   SMALLINT 
    DECLARE @newRegGroup    SMALLINT 
      
    OPEN map_Groups   
       
    -- Extract the tidbits of data from the original UPC    
        FETCH map_Groups into @physGroup, @regGroup   
        WHILE @@SQLSTATUS = 0   
        BEGIN   
            IF @physGroup >= 0   
            BEGIN   
                SELECT @thePhysGroup = @physGroup 
         -- Map the register group to the proper code.   
                SELECT @newRegGroup =    
                CASE @thePhysGroup   
                    WHEN 0   
                        THEN 2   
                    WHEN 2   
    THEN 3   
           WHEN 4   
                        THEN 5   
                    WHEN 6   
                        THEN 1   
                    WHEN 8   
                        THEN 4 
                    WHEN 9 
 THEN 7 
                    ELSE 1   
         END   
                   
            -- Now actually update the DB   
               UPDATE PRODUCTS   
                SET REG_INV_GROUP = @newRegGroup 
                WHERE CURRENT of map_Groups  
               
            END   
   ELSE   
                PRINT 'Row found with reg group already entered.'   
   
     -- Get the next row   
         FETCH map_Groups into  @physGroup, @regGroup              
        END   
    CLOSE map_Groups   
END   
go

SETUSER
go

print    'H2K_Reset_Dept_Totals'
SETUSER  'dbo'
go

  CREATE PROCEDURE dbo.H2K_Reset_Dept_Totals 
  
 
AS  
 
BEGIN 
 
    UPDATE INVENTORY 
    SET  QT_ON_HAND = 0, 
         TOT_MONTH_END_BAL = 0 
    WHERE SKU = 'R/C DEPT' 
        OR SKU = 'CRAFT DEPT' 
        OR SKU = 'HOBBY DEPT' 
        OR SKU = 'TRAIN DEPT' 
        OR SKU = 'GAMES DEPT' 
        OR SKU = 'MISC MAGAZINE' 
        OR SKU = 'SALES TX' 
 
 
END  
go

SETUSER
go

print    'H2K_Reset_MTD_Totals'
SETUSER  'dbo'
go

    CREATE PROCEDURE dbo.H2K_Reset_MTD_Totals  
 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL  
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    This procedure dumps the runnings totals for the month in the CLERKS 
    and inventory files.   
   
   
    AUTHOR:    Gregory Stone   
    DATE:      4 Jan 1999   
*/ 
 
AS  
 
BEGIN 
 
    UPDATE CLERKS 
    SET SALES_MTD = 0, 
        COST_MTD = 0, 
        ITEMS_SOLD_MTD = 0 
 
    UPDATE INVENTORY 
    SET RECEIPT_MTD = 0, 
        MONTHLY_SOLD = 0, 
        NUM_STOCKOUTS_MTD = 0, 
        NUM_ORD_CURMONTH = 0, 
        SALES_CURMONTH = 0,    
        SALES_COST_CURMONTH = 0 
    /*WHERE monthly_sold >0 
        OR RECEIPT_MTD >0 
        OR NUM_ORD_CURMONTH >0*/        
END  
go

SETUSER
go

print    'H2K_Reset_YTD_Totals'
SETUSER  'dbo'
go

   CREATE PROCEDURE dbo.H2K_Reset_YTD_Totals 
 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    This procedure dumps the runnings totals for the whole year in the CLERKS 
    and INVENTORY files.   
   
   
    AUTHOR:    Gregory Stone   
    DATE:      4 Jan 1999   
*/ 
 
AS  
 
BEGIN 
 
    UPDATE CLERKS 
    SET SALES_YTD = 0, 
        COST_YTD = 0, 
        ITEMS_SOLD_YTD = 0 
 

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'a%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'b%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'c%'
 
    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'd%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'e%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'f%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'g%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'h%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'i%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'j%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'k%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'l%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'm%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'n%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'o%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'p%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'q%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'r%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 's%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 't%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'u%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'v%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'w%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'x%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'y%'

    UPDATE INVENTORY 
    SET NUM_ORD_CURYEAR = 0, 
        ANNUAL_SOLD = 0, 
        NUM_STOCKOUTS_YTD = 0, 
        SALES_CURYEAR = 0, 
        SALES_COST_YTD = 0
    WHERE SKU LIKE 'z%'

END  
go

SETUSER
go

print    'H2K_Split_SKU'
SETUSER  'dbo'
go

          CREATE PROCEDURE dbo.H2K_Split_SKU   
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
/*    
    Stored procedure to separate the 3 meaningful snippets of   
    data embedded in the intial raw format of a UPC code. The   
    first 10 digits are the actual UPC the next digit indicates   
    the type of label to be printed, and the remaining data is   
    the userid of that user who created (or is it last modified)   
    the record in the first place.   
   
    AUTHOR:    Gregory Stone   
    DATE:      25 Oct 1999   
*/   
   
AS    
   
BEGIN   
    DECLARE upc_codes CURSOR FOR   
    SELECT UPC, MAINT_BY, LABEL_TYPE   
    FROM PRODUCTS   
    WHERE CHAR_LENGTH(UPC) > 10   
       
    DECLARE @origCode       VARCHAR(20)   
    DECLARE @changer        VARCHAR(10)   
    DECLARE @newChanger     VARCHAR(10)   
    DECLARE @new_UPC        VARCHAR(10)   
    DECLARE @labelCode SMALLINT   
    DECLARE @newLabelType   VARCHAR(1)   
    DECLARE @label  VARCHAR(1)      
       
    OPEN upc_codes   
       
    -- Extract the tidbits of data from the original UPC    
        FETCH upc_codes into @origCode, @changer, @label   
  WHILE @@SQLSTATUS = 0   
        BEGIN   
            IF CHAR_LENGTH(@origCode) > 10   
            BEGIN   
                SELECT @newChanger = SUBSTRING(@origCode,12,8)   
                SELECT @new_UPC = SUBSTRING(@origCode,1,10)   
     SELECT @labelCode = CONVERT(SMALLINT, SUBSTRING(@origCode,11,1))   
                -- Substitute the proper label code   
                SELECT @newLabelType =    
                CASE @labelCode   
                    WHEN 1   
     THEN 'A'   
   WHEN 3   
                        THEN 'A'   
                    WHEN 2   
                        THEN 'I'   
                    WHEN 4   
                        THEN 'I'   
                    WHEN 5   
              THEN 'I'   
  ELSE 'N'   
                END   
                   
            -- Now actually update the DB   
               UPDATE PRODUCTS   
                SET UPC = @new_UPC,   
                    MAINT_BY = @newChanger,   
                    LABEL_TYPE = @newLabelType   
                WHERE CURRENT of upc_codes   
               
                /*select @output = CONVERT(VARCHAR(10),SUBSTRING(@origCode,1,10)) + ' '  +   
                                 CONVERT(VARCHAR(10),@newChanger) + ' ' + @labelType*/   
                --PRINT @output   
            END   
            ELSE   
                PRINT 'Row found with converted UPC, Skipping...'   
   
     -- Get the next row   
         FETCH upc_codes into @origCode, @changer, @label              
        END   
    CLOSE upc_codes 
    DEALLOCATE CURSOR upc_codes   
END   
go

SETUSER
go

print    'H2K_UpdateHist4Month'
SETUSER  'dbo'
go

    CREATE PROCEDURE dbo.H2K_UpdateHist4Month (@inVendor varchar(3)) 
 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
/*    
    This procedure updates a column in the temporary 13 month sales history 
    table with the quantities sold for that month. The month passed in is the 
    virtual month meaning the month from 1-13 relative from today to update 
    in the table. 
   
    AUTHOR:   Gregory Stone   
    DATE:      27 Jan 2000   
*/   
 
AS  
 
BEGIN  
 
    DECLARE @calMonth smallint 
    DECLARE @calYear smallint 
    DECLARE @updCol smallint 
    DECLARE @monthToSum smallint 
    DECLARE @vendor varchar(7) 
    SELECT @vendor = STUFF('xxx%', 1, 3, @inVendor) 
     
-- Calculate which column this month's data gets inserted into 
    SELECT @calMonth = DATEPART(MONTH, GETDATE()) 
    SELECT @calYear = DATEPART(YEAR, GETDATE()) - 1 
    DECLARE @year char(4) 
    SELECT @year = CONVERT(char(10), @calYear) 
     
-- Total the sales for each SKU sold for each month. 
   
--  MONTH 1 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_1 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_1  = 0 
    WHERE MONTH_1  = NULL 
 
--  MONTH 2 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_2 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_2  = 0 
    WHERE MONTH_2  = NULL 
 
--  MONTH 3 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_3 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
 IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_3  = 0 
    WHERE MONTH_3  = NULL 
 
--  MONTH 4 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_4 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_4  = 0 
    WHERE MONTH_4  = NULL 
 
--  MONTH 5 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_5 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
 IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_5  = 0 
    WHERE MONTH_5  = NULL 
 
--  MONTH 6 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_6 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_6  = 0 
    WHERE MONTH_6  = NULL 
 
--  MONTH 7 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_7 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_7  = 0 
    WHERE MONTH_7  = NULL 
 
--  MONTH 8 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_8 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
    HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_8  = 0 
    WHERE MONTH_8  = NULL 
 
--  MONTH 9 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_9 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_9  = 0 
    WHERE MONTH_9  = NULL 
 
--  MONTH 10 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_10 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
           HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_10  = 0 
    WHERE MONTH_10  = NULL 
 
--  MONTH 11 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_11 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_11  = 0 
    WHERE MONTH_11  = NULL 
 
--  MONTH 12 Totals   
    UPDATE SALES_HIST_13  
    SET MONTH_12 = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
    SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET MONTH_12  = 0 
    WHERE MONTH_12  = NULL 
 
 
--  Current Month   
    UPDATE SALES_HIST_13  
    SET CUR_MONTH = (SELECT SUM(QTY) FROM SALES_HIST_TEMP  
                   WHERE DATEPART(MONTH, SALE_DATE) = @calMonth 
                   AND DATEPART(YEAR, SALE_DATE) = @calYear 
                   GROUP BY SKU 
                   HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    WHERE SALES_HIST_13.SKU LIKE @vendor 
 
 SELECT @calMonth = @calMonth + 1 
    IF @calMonth > 12 
    BEGIN 
        SELECT @calMonth = 1 
        SELECT @calYear = @calYear + 1 
    END 
 
 
-- Clean up the null values. 
    UPDATE SALES_HIST_13 
    SET CUR_MONTH  = 0 
    WHERE CUR_MONTH  = NULL 
 
-- Finally, tally up all the sales for the whole year 
     
    UPDATE SALES_HIST_13 
    SET TOTAL_SOLD = (SELECT SUM(QTY) FROM SALES_HIST_TEMP 
                      GROUP BY SKU 
                      HAVING SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU) 
    FROM SALES_HIST_TEMP 
    WHERE SALES_HIST_13.SKU = SALES_HIST_TEMP.SKU 
 
END  
go

SETUSER
go

print    'H2K_Year_Sales_Processing'
SETUSER  'dbo'
go

       CREATE PROCEDURE dbo.H2K_Year_Sales_Processing(@startDate DATETIME, @endDate DATETIME)

WITH RECOMPILE
AS 

    BEGIN 

-- Declare my working variables. 
    DECLARE @sku            varchar(19)
    DECLARE @qty            int
    DECLARE @extcost        numeric(7,2)
    declare @extprice       numeric(7,2)
    declare @tax            numeric(9,2)
    declare @msg            varchar(255)

    --Need to put in a 
--Loop
    PRINT "Declaring cursor..." 
    DECLARE salesProcessor CURSOR FOR 
        SELECT  s.SKU, s.UNIT_PRICE, s.UNIT_COST, s.QTY
        FROM SALES_LAST_YEAR s 
        WHERE s.SALE_DATE > @startDate AND s.SALE_DATE < @endDate 
        FOR READ ONLY 
 
    OPEN salesProcessor 
    FETCH salesProcessor INTO @sku, @extprice, @extcost, @qty 
        WHILE @@SQLSTATUS = 0 
            BEGIN 

                UPDATE SETTINGS SET SOLD = @qty,
                DEPT = (SELECT SALES_CURMONTH from INVENTORY WHERE SKU = @sku),
                ASOLD = (SELECT SALES_CURYEAR from INVENTORY WHERE SKU = @sku)

                UPDATE TEMPINVENTORY
                SET MONTHLY_SOLD = MONTHLY_SOLD + (SELECT SOLD FROM SETTINGS),
                ANNUAL_SOLD = ANNUAL_SOLD + (SELECT SOLD FROM SETTINGS),
                SALES_CURMONTH = (@extprice * @qty) + (SELECT DEPT FROM SETTINGS),
                SALES_CURYEAR = (@extprice * @qty) + (SELECT ASOLD FROM SETTINGS),
                SALES_COST_CURMONTH = SALES_COST_CURMONTH + (@extcost * @qty),
                SALES_COST_YTD = SALES_COST_YTD + (@extcost + @qty)
                WHERE SKU = @sku


                FETCH salesProcessor INTO @sku, @extprice, @extcost, @qty 
            END
    DEALLOCATE CURSOR salesProcessor

    -- sales tax & Dept
    --EXECUTE YearlyDeptProcessing @startDate, @endDate
    END 
go

SETUSER
go

print    'H2KDumpPrecommitSales'
SETUSER  'dbo'
go

  CREATE PROCEDURE dbo.H2KDumpPrecommitSales(@saleDate DATETIME) 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
*   
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved   
*      
*   PETRASOFT CONFIDENTIAL   
*   This file includes unpublished proprietary source code of Petrasoft    
*   Research, Inc. The copyright notice above does not evidence any actual   
*   or intended publication of such source code. You shall not disclose   
*   such Confidential Information and shall use it only in accordance with   
*   the terms of the license agreement you entered into with Petrasoft.   
*   
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/   
   
   
/*    
    Clears out any transaction in the *_TRANS tables that were imported, 
    but may not have committed. This allows for re-importing a day's  
    sales data in case there were problems during import.   
   
   
    AUTHOR:    Gregory Stone   
    DATE:      24 Jan 2000   
*/ 
 
AS  
 
BEGIN  
 
    DELETE FROM DAILY_TRANS 
    WHERE SALE_DATE = @saleDate 
    AND RECONCILED = 0 
 
    DELETE FROM MISC_TRANS 
    WHERE SALE_DATE = @saleDate 
    AND RECONCILED = 0 
 
END  
go

SETUSER
go

print    'H2KUncommitSales'
SETUSER  'dbo'
go

   CREATE PROCEDURE dbo.H2KUncommitSales(@saleDate datetime)   
 
     
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
*     
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved     
*        
* PETRASOFT CONFIDENTIAL     
*   This file includes unpublished proprietary source code of Petrasoft      
*   Research, Inc. The copyright notice above does not evidence any actual     
*   or intended publication of such source code. You shall not disclose     
*   such Confidential Information and shall use it only in accordance with     
*   the terms of the license agreement you entered into with Petrasoft.     
*     
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/     
     
/*      
    This procedure backs out the changes made to the inventory file.   
     
    AUTHOR:    Gregory Stone     
    DATE:      3 Jan 1999     
*/     
     
     
AS      
     
BEGIN 
  
    PRINT "Rolling back sales in Inventory table..."             
        BEGIN   
        -- Mulitple inserts need to be agregated to get the right update.   
        UPDATE INVENTORY     
            SET QT_ON_HAND = QT_ON_HAND + (SELECT SUM(s.QTY) 
                                           FROM SALES s   
                                           GROUP BY s.SKU    
                                           HAVING s.sku = INVENTORY.SKU),   
                MONTHLY_SOLD    = MONTHLY_SOLD - (SELECT SUM(s.QTY)   
         FROM SALES s   
                                   GROUP BY s.SKU    
                                                  HAVING s.sku = INVENTORY.SKU),     
                ANNUAL_SOLD     = ANNUAL_SOLD - (SELECT SUM(s.QTY)   
                                            FROM SALES s   
                                                 GROUP BY s.SKU    
                                                 HAVING s.sku = INVENTORY.SKU),     
                SALES_CURMONTH  = SALES_CURMONTH - (SELECT SUM(s.EXT_PRICE)     
                                              FROM SALES s   
                                                    GROUP BY s.SKU    
                                                    HAVING s.sku = INVENTORY.SKU),     
                SALES_CURYEAR   = SALES_CURYEAR - (SELECT SUM(s.EXT_PRICE)    
                                                   FROM SALES s   
                                                   GROUP BY s.SKU    
                       HAVING s.sku = INVENTORY.SKU)    
                FROM SALES s 
                WHERE s.sku = INVENTORY.SKU 
                AND   s.SALE_DATE = @saleDate 
 
    IF @@error != 0 
        PRINT "Error in SALES trigger, updating INVENTORY" 
   
    -- Next update the clerks file.     
       PRINT "Rolling back sales in CLERKS table..."             
       UPDATE CLERKS     
            SET ITEMS_SOLD_MTD = ITEMS_SOLD_MTD -(SELECT SUM(s.QTY)   
          FROM SALES s   
                                                  GROUP BY s.CLERK_ID    
                                     HAVING CLERKS.CLERK_ID = s.CLERK_ID),     
                ITEMS_SOLD_YTD = ITEMS_SOLD_YTD - (SELECT SUM(s.QTY)   
                                                   FROM SALES s    
                GROUP BY s.CLERK_ID    
                                                   HAVING CLERKS.CLERK_ID = s.CLERK_ID),     
        SALES_MTD = CONVERT(NUMERIC(9,3),SALES_MTD -    
                                                (SELECT SUM(s.EXT_PRICE)   
                                                FROM SALES s    
                                                GROUP BY s.CLERK_ID    
                                                HAVING CLERKS.CLERK_ID = s.CLERK_ID)),     
  SALES_YTD = CONVERT(NUMERIC(9,3),SALES_YTD -    
                                                (SELECT SUM(s.EXT_PRICE)   
                                         FROM SALES s    
                                                GROUP BY s.CLERK_ID 
                                                HAVING CLERKS.CLERK_ID = s.CLERK_ID))     
         
            FROM SALES s      
            WHERE CLERKS.CLERK_ID = s.CLERK_ID 
            AND s.SALE_DATE = @saleDate   
            IF @@error != 0 
               PRINT "Error in SALES trigger, updating CLERKS" 
            RETURN   
       END   
     
END     
go

SETUSER
go

print    'MonthReport'
SETUSER  'dbo'
go

   CREATE PROCEDURE dbo.MonthReport(@monthget int)

AS 
    BEGIN     
    declare @curclass int
    declare @ytdsales numeric (9,2)
    declare @ytditems int
    declare @ytdcosts numeric (9,2)
    declare @msg    varchar(255)
    

        declare classes cursor for 
        SELECT CLASS FROM REPORTS where MONTH = @monthget ORDER BY CLASS
        open classes
        fetch classes into @curclass
        while @@SQLSTATUS = 0
            BEGIN
            --PRINT "
            select @ytdsales = (select sum(sales) from reports r where r.month <= @monthget AND r.class = @curclass)
            select @ytditems = (select sum(qty) from reports r where r.month <= @monthget AND r.class = @curclass)
            select @ytdcosts = (select sum(cost) from reports r where r.month <= @monthget AND r.class = @curclass)
            select @msg = "CLASS:"+CONVERT(CHAR(10), @curclass)
            print @msg
            update reports set YEARSALES = @ytdsales, YEARCOST = @ytdcosts, YEARQTY = @ytditems where month = @monthget
            AND CLASS = @curclass
  
            FETCH classes into @curclass
            END

        DEALLOCATE CURSOR classes
        
    END 
go

SETUSER
go

print    'processmonth'
SETUSER  'dbo'
go

      CREATE PROCEDURE dbo.processmonth(@month int, @startdate DATETIME, @enddate DATETIME)

AS 

    BEGIN 
    DECLARE @curclass  int
    DECLARE @sales  numeric(9,2)
    declare @cost   numeric(9,2)
    declare @qty    int
    --DECLARE @startdate DATETIME
    --declare @enddate   DATETIME
    --DECLARE @month     int
    
    

    declare classes cursor for 
    SELECT CLASS FROM CLASS_CODES where division != 'all'
    --SELECT @startdate = '12-31-00'
    --select @enddate = '2-1-01'
    --select @month = 1
    open classes
    fetch classes into @curclass
        while @@SQLSTATUS = 0
           BEGIN
            SELECT @sales = (select SUM(QTY*UNIT_PRICE) FROM SALES sly WHERE sly.SALE_DATE > @startdate 
            AND sly.SALE_DATE < @enddate AND sly.CLASS = @curclass)
            SELECT @cost = (select SUM(QTY*UNIT_COST) FROM SALES sly WHERE sly.SALE_DATE > @startdate 
            AND sly.SALE_DATE < @enddate AND sly.CLASS = @curclass)
            SELECT @qty = (select SUM(QTY) FROM SALES sly WHERE sly.SALE_DATE > @startdate 
            AND sly.SALE_DATE < @enddate AND sly.CLASS = @curclass)
                
             INSERT into reports (MONTH, CLASS, SALES, COST, QTY)
             VALUES (@month, @curclass, @sales , @cost, @qty)
            FETCH classes into @curclass
        END
    DEALLOCATE CURSOR classes

--Do the processing for R/C
    SELECT @sales = (SELECT sum(EXT_PRICE) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '0')
    SELECT @cost = 0
    SELECT @qty = (SELECT sum(QTY) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '0')
    insert into reports (MONTH, CLASS, SALES, COST, QTY) values( @month, 1, @sales, @cost, @qty)

--Do the processing for Crafts
    SELECT @sales = (SELECT sum(EXT_PRICE) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '2')
    SELECT @cost = 0
    SELECT @qty = (SELECT sum(QTY) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '2')
    insert into reports (MONTH, CLASS, SALES, COST, QTY) values( @month, 20, @sales, @cost, @qty)

--Do the processing for Trains
    SELECT @sales = (SELECT sum(EXT_PRICE) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '6')
    SELECT @cost = 0
    SELECT @qty = (SELECT sum(QTY) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '6')
    insert into reports (MONTH, CLASS, SALES, COST, QTY) values( @month, 60, @sales, @cost, @qty)

--Do the processing for Hobbies
    SELECT @sales = (SELECT sum(EXT_PRICE) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '4')
    SELECT @cost = 0
    SELECT @qty = (SELECT sum(QTY) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '4')
    insert into reports (MONTH, CLASS, SALES, COST, QTY) values( @month, 40, @sales, @cost, @qty)

--Do the processing for Games
    SELECT @sales = (SELECT sum(EXT_PRICE) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '8')
    SELECT @cost = 0
    SELECT @qty = (SELECT sum(QTY) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = '8')
    insert into reports (MONTH, CLASS, SALES, COST, QTY) values( @month, 80, @sales, @cost, @qty)

--Do the processing for Tax
    SELECT @sales = (SELECT sum(EXT_PRICE) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = 'TAX')
    SELECT @cost = 0
    SELECT @qty = (SELECT sum(QTY) from daily_trans dly where dly.sale_date > @startdate 
        AND dly.sale_date < @enddate AND dly.trans_code = 'TAX')
    insert into reports (MONTH, CLASS, SALES, COST, QTY) values( @month, 0, @sales, @cost, @qty)

    EXECUTE monthreport @month
    END


go

SETUSER
go

print    'Rpt'
SETUSER  'dbo'
go

   CREATE PROCEDURE dbo.Rpt(@curmonth int)

AS 
    BEGIN 
        SELECT r.CLASS, c.NAME, r.SALES, r.YEARSALES, r.COST, r.YEARCOST, r.QTY, r.YEARQTY
        from reports r, class_codes c where MONTH = @curmonth AND r.CLASS = c.CLASS AND r.CLASS != 0
        ORDER BY r.CLASS       


    END 
go

SETUSER
go

print    'TempPOClean'
SETUSER  'dbo'
go

     CREATE PROCEDURE dbo.TempPOClean;1
   
   
/*    
    This rips through the inventory, checking all items that show a qty on order, and fixes it to equal 
    Only the amount that appears on PO's.   
   
   
    AUTHOR:    Tom Byrne   
    DATE:       23-May-2000 
*/ 
AS  
 
    BEGIN  
     
-- Declare my working variables. 
 
    DECLARE @sku            varchar(19)
    DECLARE @po_num         varchar(14) 
    DECLARE @uom            varchar(6)
    DECLARE @qty_received   int
   DECLARE @qty            int


    DECLARE @qtonorderinv   int 
    DECLARE @vendor6        varchar(6) 
    DECLARE @convFactor     int 


    DECLARE @recQty         int 
    DECLARE @qtonorderpo    int 
    DECLARE @tempval        int 
    DECLARE @tempval2       int 
    
  
 
    update tom_temp_inv set qt_on_order = 0

    declare po_items_loop cursor for 
        select po_num, sku, qty, uom, qty_received from PO_ITEMS
        for read only

    open po_items_loop
    fetch po_items_loop into @po_num, @sku, @qty, @uom, @qty_received
        while @@SQLSTATUS = 0
            BEGIN
            --check if qty rec'd is less than qty.
            if @qty > @qty_received -- keep going
                BEGIN
 select @qtonorderinv = (select QT_ON_ORDER from tom_temp_inv where
                        SKU = @sku)

                    if @uom = 'CS'
                        BEGIN
                            select @vendor6 = (select VENDOR_6 from PURCHASE_ORDERS
                                where PO_NUM = @po_num)
                            select @convFactor = (select QTY_CONV_FACTOR from VENDOR_PRODS
                                where SKU = @sku AND VENDOR_6 = @vendor6)

    select @qtonorderinv = @qtonorderinv + (@convFactor * (@qty - @qty_received))
                            update tom_temp_inv set QT_ON_ORDER = @qtonorderinv where SKU = @sku
                        END
                    ELSE -- must be an each
                        BEGIN
                            select @qtonorderinv = @qtonorderinv + (@qty - @qty_received)
                        END
                END                               
                
            

                
        
            fetch po_items_loop into @po_num, @sku, @qty, @uom, @qty_received
        END
    
    DEALLOCATE cursor po_items_loop
END
 
-- Get a cursor for every row in the PO_ITEMS 
 /*   PRINT "Declaring cursor..." 
    DECLARE Kills CURSOR FOR 
        SELECT i.SKU, i.QT_ON_ORDER 
        FROM INVENTORY i 
        
        FOR READ ONLY 
 
    OPEN Kills 
    FETCH Kills INTO @sku, @qtonorderinv 
        WHILE @@SQLSTATUS = 0 
            BEGIN 
                IF @qtonorderinv < 0 
                    BEGIN 
                        UPDATE INVENTORY 
                        SET QT_ON_ORDER = 0 
                        WHERE SKU = @sku 
                    END 
                ELSE 
                    BEGIN 
                 DECLARE newval CURSOR FOR 
                        SELECT poi.QTY, poi.QTY_RECEIVED, poi.PO_NUM 
                        FROM PO_ITEMS poi 
                        WHERE poi.SKU = @sku 
                        FOR READ ONLY  
                 SELECT @tempval = 0 
                        OPEN newVal 
                        FETCH newVal into @qtonorderpo, @recQty, @ponum 
                        WHILE @@SQLSTATUS = 0 
                        BEGIN 
    IF (@qtonorderpo - @recQty) > 0 
                                BEGIN 
                                    SELECT @uom =  
                                    (SELECT vp.PURCH_UOM  
                                    FROM VENDOR_PRODS vp  
                                WHERE vp.SKU = @sku  
                                   AND vp.VENDOR_6 = (SELECT VENDOR_6 FROM PURCHASE_ORDERS po WHERE po.PO_NUM = @ponum)) 
 
                                    IF @uom = 'CS' 
                   BEGIN 
                                            SELECT @tempval =  @tempval + ((@qtonorderpo - @recQty) * (select QTY_CONV_FACTOR from VENDOR_PRODS vp where vp.SKU = @sku and vp.VENDOR_6 = (select VENDOR_6 from PURCHASE_ORDERS where PO_NUM = @ponum))) 
                                        END 
                                    ELSE 
                                        SELECT @tempval = @tempval + (@qtonorderpo - @recQty) 
 
                                            
                                END 
  
                            FETCH newVal into @qtonorderpo, @recQty, @ponum 
 
                        END 
                        DEALLOCATE CURSOR newVal 
                        UPDATE INVENTORY SET QT_ON_ORDER = @tempval where SKU = @sku 
       
                    END    
            FETCH Kills INTO @sku, @qtonorderinv 
            END 
 
 
    DEALLOCATE CURSOR Kills 
 
    END  */
go

SETUSER
go

print    'YearCrap'
SETUSER  'dbo'
go

  CREATE PROCEDURE dbo.YearCrap



AS 

    BEGIN 

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'a%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'b%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'c%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'd%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'e%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'f%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'g%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'h%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

    update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'i%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'j%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'k%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'l%' AND
      (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'm%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'n%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'o%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'p%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'q%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'r%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 's%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 't%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
  sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'u%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'v%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'w%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
   where sku like 'x%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'y%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

        update tempinventory set annual_sold = 0, sales_curyear = 0, sales_cost_ytd = 0
        where sku like 'z%' AND
        (annual_sold != 0 OR
        sales_curyear != 0 OR
        sales_cost_ytd != 0)

    END 
go

SETUSER
go

print    'YearlyDeptProcessing'
SETUSER  'dbo'
go

     CREATE PROCEDURE dbo.YearlyDeptProcessing(@startDate DATETIME, @endDate DATETIME)  
-- will need to adjust this to update tempinventory and pull from daily_trans_last_year


AS 

    BEGIN 
        declare @price  numeric(9,2)
        declare @msg    varchar(255)
        declare @tax    numeric(9,2)


    select @msg = "Starting craft"
    print @msg

    UPDATE SETTINGS SET DEPT = (select sum(ext_price) from daily_trans_LAST_YEAR
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '2'),
    SOLD = (select sum(qty) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '2')
    
    UPDATE TEMPINVENTORY
    SET SALES_CURMONTH = SALES_CURMONTH + (SELECT DEPT FROM SETTINGS),
    SALES_CURYEAR = SALES_CURYEAR + (SELECT DEPT FROM SETTINGS),
    MONTHLY_SOLD = MONTHLY_SOLD + (SELECT SOLD FROM SETTINGS),
    ANNUAL_SOLD = ANNUAL_SOLD + (SELECT SOLD FROM SETTINGS)
    where SKU = 'CRAFT DEPT'
    
    select @msg = "Starting Games"
    print @msg

    UPDATE SETTINGS SET DEPT = (select sum(ext_price) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '8'),
    SOLD = (select sum(qty) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '8')
    
    UPDATE TEMPINVENTORY
    SET SALES_CURMONTH = SALES_CURMONTH + (SELECT DEPT FROM SETTINGS),
    SALES_CURYEAR = SALES_CURYEAR + (SELECT DEPT FROM SETTINGS),
    MONTHLY_SOLD = MONTHLY_SOLD + (SELECT SOLD FROM SETTINGS),
    ANNUAL_SOLD = ANNUAL_SOLD + (SELECT SOLD FROM SETTINGS)
    where SKU = 'GAMES DEPT'
    
    select @msg = "Starting HOBBY"
    print @msg
    UPDATE SETTINGS SET DEPT = (select sum(ext_price) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '4'),
    SOLD = (select sum(qty) from daily_trans_LAST_YEAR
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '4')
    
    UPDATE TEMPINVENTORY
    SET SALES_CURMONTH = SALES_CURMONTH + (SELECT DEPT FROM SETTINGS),
    SALES_CURYEAR = SALES_CURYEAR + (SELECT DEPT FROM SETTINGS),
    MONTHLY_SOLD = MONTHLY_SOLD + (SELECT SOLD FROM SETTINGS),
    ANNUAL_SOLD = ANNUAL_SOLD + (SELECT SOLD FROM SETTINGS)
    where SKU = 'HOBBY DEPT'
    
    select @msg = "Starting R/C"
    print @msg
    UPDATE SETTINGS SET DEPT = (select sum(ext_price) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '0'),
    SOLD = (select sum(qty) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '0')
    
    UPDATE TEMPINVENTORY
    SET SALES_CURMONTH = SALES_CURMONTH + (SELECT DEPT FROM SETTINGS),
    SALES_CURYEAR = SALES_CURYEAR + (SELECT DEPT FROM SETTINGS),
    MONTHLY_SOLD = MONTHLY_SOLD + (SELECT SOLD FROM SETTINGS),
    ANNUAL_SOLD = ANNUAL_SOLD + (SELECT SOLD FROM SETTINGS)
    where SKU = 'R/C DEPT'
    
    select @msg = "Starting TRAIN"
    print @msg
    UPDATE SETTINGS SET DEPT = (select sum(ext_price) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
 AND SALE_DATE < @endDate
    AND TRANS_CODE = '6'),
    SOLD = (select sum(qty) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '6')
    
    UPDATE TEMPINVENTORY
    SET SALES_CURMONTH = SALES_CURMONTH + (SELECT DEPT FROM SETTINGS),
    SALES_CURYEAR = SALES_CURYEAR + (SELECT DEPT FROM SETTINGS),
    MONTHLY_SOLD = MONTHLY_SOLD + (SELECT SOLD FROM SETTINGS),
    ANNUAL_SOLD = ANNUAL_SOLD + (SELECT SOLD FROM SETTINGS)
    where SKU = 'TRAIN DEPT'
    
    select @msg = "Starting MAGAZINE"
    print @msg
    UPDATE SETTINGS SET DEPT = (select sum(ext_price) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '9'),
   SOLD = (select sum(qty) from daily_trans_LAST_YEAR 
    where sale_date > @startDate
    AND SALE_DATE < @endDate
    AND TRANS_CODE = '9')
    
    UPDATE TEMPINVENTORY
    SET SALES_CURMONTH = SALES_CURMONTH + (SELECT DEPT FROM SETTINGS),
    SALES_CURYEAR = SALES_CURYEAR + (SELECT DEPT FROM SETTINGS),
    MONTHLY_SOLD = MONTHLY_SOLD + (SELECT SOLD FROM SETTINGS),
    ANNUAL_SOLD = ANNUAL_SOLD + (SELECT SOLD FROM SETTINGS)
    where SKU = 'MISC MAGAZINE'

    select @msg = "Starting Sales Tax"
    update settings set tax = (select sum(EXT_PRICE) from daily_trans where sale_date > @startDate AND
                SALE_DATE < @endDate AND TRANS_CODE = 'TAX')
    UPDATE TEMPINVENTORY SET SALES_CURMONTH = SALES_CURMONTH + (SELECT TAX FROM SETTINGS), 
    SALES_CURYEAR = SALES_CURYEAR + (SELECT TAX FROM SETTINGS)
    WHERE SKU = 'SALES TX'
    
   END 
go

SETUSER
go

print    'YTD_ZERO_SALES_COST'
SETUSER  'dbo'
go

 CREATE PROCEDURE dbo.YTD_ZERO_SALES_COST;1 


AS 

    BEGIN 
        UPDATE INVENTORY SET SALES_COST_YTD = 0 WHERE SALES_COST_YTD != 0
        UPDATE INVENTORY SET SALES_COST_CURMONTH = 0 WHERE SALES_COST_CURMONTH != 0
    END 
go

SETUSER
go

print    'H2KUpdateInventoryTotals'
SETUSER  'dbo'
go

    CREATE TRIGGER dbo.H2KUpdateInventoryTotals ON dbo.SALES     
      
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      
*      
*   Copyright © 1999-2000 by Petrasoft Research, Inc. All rights Reserved      
*      
*   PETRASOFT CONFIDENTIAL      
*   This file includes unpublished proprietary source code of Petrasoft       
*   Research, Inc. The copyright notice above does not evidence any actual      
*   or intended publication of such source code. You shall not disclose      
*   such Confidential Information and shall use it only in accordance with      
*   the terms of the license agreement you entered into with Petrasoft.      
*      
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/      
      
/*       
    This trigger updates the inventory and clerks files to reflect the      
    sale or refund of a scanned item inserted from the Transaction table.    
      
    AUTHOR:    Gregory Stone      
    DATE:      29 Dec 1999   
*/      
     
      
FOR INSERT AS       
      
BEGIN      
    DECLARE @rcount int  
    SELECT @rcount = @@rowcount  
  
    IF @rcount = 0   
    BEGIN     
        PRINT "Nothing inserted!"  
        RETURN  
 END         
   
  
     
-- Process a new sale.      
-- First update the inventory file.      
    IF(@rcount = 1)  
        PRINT "Only one row, doing no triggers!"  
    
    IF(@rcount > 1)    
        BEGIN    
        -- Mulitple inserts need to be agregated to get the right update.    
        UPDATE INVENTORY      
            SET QT_ON_HAND = QT_ON_HAND - (SELECT SUM(newSale.QTY)    
                                           FROM inserted newSale    
               GROUP BY newSale.SKU   
                                  HAVING newSale.sku = INVENTORY.SKU),    
                MONTHLY_SOLD    = MONTHLY_SOLD + (SELECT SUM(newSale.QTY)    
                                                  FROM inserted newSale    
                        GROUP BY newSale.SKU     
                                                  HAVING newSale.sku = INVENTORY.SKU),      
                ANNUAL_SOLD     = ANNUAL_SOLD + (SELECT SUM(newSale.QTY)    
              FROM inserted newSale    
                                                 GROUP BY newSale.SKU     
                                                 HAVING newSale.sku = INVENTORY.SKU),      
                SALES_CURMONTH  = SALES_CURMONTH + (SELECT SUM(newSale.EXT_PRICE)      
                                                    FROM inserted newSale    
                                                    GROUP BY newSale.SKU     
                                                    HAVING newSale.sku = INVENTORY.SKU),      
                SALES_CURYEAR   = SALES_CURYEAR + (SELECT SUM(newSale.EXT_PRICE)     
                                                   FROM inserted newSale    
                                                   GROUP BY newSale.SKU     
                                                   HAVING newSale.sku = INVENTORY.SKU),      
                LAST_SALE       = newSale.SALE_DATE  
                FROM inserted newSale  
                WHERE newSale.sku = INVENTORY.SKU  
  
    IF @@error != 0  
        PRINT "Error in SALES trigger, updating INVENTORY"  
    
    --    
    -- Next update the clerks file.      
        UPDATE CLERKS      
            SET ITEMS_SOLD_MTD = ITEMS_SOLD_MTD +(SELECT SUM(newSale.QTY)    
                                   FROM inserted newSale    
                              GROUP BY newSale.CLERK_ID     
                                                  HAVING CLERKS.CLERK_ID = newSale.CLERK_ID),      
                ITEMS_SOLD_YTD = ITEMS_SOLD_YTD + (SELECT SUM(newSale.QTY)    
                           FROM inserted newSale    
                                                   GROUP BY newSale.CLERK_ID     
                                                   HAVING CLERKS.CLERK_ID = newSale.CLERK_ID),      
                SALES_MTD = CONVERT(NUMERIC(9,3),SALES_MTD +     
                                                (SELECT SUM(newSale.EXT_PRICE)    
                                                FROM inserted newSale    
           GROUP BY newSale.CLERK_ID     
                                                HAVING CLERKS.CLERK_ID = newSale.CLERK_ID)),      
                SALES_YTD = CONVERT(NUMERIC(9,3),SALES_YTD +     
          (SELECT SUM(newSale.EXT_PRICE)    
                                 FROM inserted newSale    
                                                GROUP BY newSale.CLERK_ID     
                                                HAVING CLERKS.CLERK_ID = newSale.CLERK_ID))      
        
   FROM inserted newSale      
            WHERE CLERKS.CLERK_ID = newSale.CLERK_ID    
            IF @@error != 0  
                PRINT "Error in SALES trigger, updating CLERKS"  
            RETURN    
       END    
      
END      
go

SETUSER
go

