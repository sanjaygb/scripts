create database bench
go
USE [bench]
GO
CREATE TABLE [dbo].[customers](
        [customer_id] [int] IDENTITY(1,1) NOT NULL,
        [fname] [varchar](100) NULL,
        [lname] [varchar](100) NULL,
        [description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED ([customer_id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
CREATE TABLE [dbo].[customer_orders](
        [customer_id] [int] NULL,
        [order_id] [int] IDENTITY(1,1) NOT NULL,
        [item_name] [varchar](100) NULL,
        [item_id] [varchar](100) NULL,
        [description] [varchar](500) NULL,
        [alt_customer_id] [varchar](20) NULL,
        [order_date] [date] NULL,
        [ship_date] [date] NULL,
        [status] [varchar](1) NULL,
PRIMARY KEY CLUSTERED ([order_id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
CREATE TABLE [dbo].[customers_address](
        [customer_id] [int] NULL,
        [address_id] [int] IDENTITY(1,1) NOT NULL,
        [street1] [varchar](100) NULL,
        [street2] [varchar](100) NULL,
        [city] [varchar](100) NULL,
        [state] [varchar](2) NULL,
        [zip] [varchar](10) NULL,
PRIMARY KEY CLUSTERED ([address_id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
create index fk_addr_customer_id on customers_address(customer_id);
GO
create index fk_order_customer_id on customer_orders(customer_id);
GO
 
-- this will create co table of 1.37g with 10,000 iterations
use bench
go
declare @customer int
declare @counter int
set @customer = 0 
set @counter = 0 
while @counter < 1000000
begin
                set @counter = @counter + 1
        INSERT INTO [dbo].[customers]([fname],[lname],[description]) VALUES('Rds', 'RandyMachoManSavage','inserting fake customer rows for mysql stab testing')
        set @customer = @@identity
                select @customer
        INSERT INTO [dbo].[customer_orders]([customer_id],[item_name],[item_id],[description],[alt_customer_id],[order_date],[ship_date],[status])
        select top 1000 @customer,'RDS database' as item_name,'RDS-1234567889' as item_id,'inserting fake customer rows for mysql stab testing' as description,'123456789' as alt_customer_id,getdate() as order_date,null as ship_date,'N' as status from sys.all_objects
end
go