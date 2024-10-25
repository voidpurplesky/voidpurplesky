-- 제품 테이블
CREATE TABLE Products (
    product_id NUMBER PRIMARY KEY,          -- 제품 ID
    product_name VARCHAR2(255) NOT NULL,    -- 제품 이름
    product_barcode VARCHAR2(100) UNIQUE, 
    stock_quantity NUMBER NOT NULL          -- 재고 수량
);

CREATE TABLE Incoming (
    incoming_id NUMBER PRIMARY KEY,                     -- 입고 ID
    product_id NUMBER REFERENCES Products(product_id),  -- 제품 ID
    quantity NUMBER NOT NULL,                           -- 입고 수량
    incoming_date DATE DEFAULT SYSDATE                  -- 입고 날짜
);

CREATE TABLE Outgoing (
    outgoing_id NUMBER PRIMARY KEY,
    product_id NUMBER REFERENCES Products(product_id),
    quantity NUMBER NOT NULL,
    outgoing_date DATE DEFAULT SYSDATE
);
create sequence products_seq;
create sequence incoming_seq;
create sequence outgoing_seq;

insert into Products
values
(
  products_seq.nextval
, 'product name 1'
, '0001'
, 0
);

insert into Products
values
(
  products_seq.nextval
, 'product name 2'
, '0002'
, 0
);

select * from Products;
update Products set 
stock_quantity = stock_quantity + 10
where product_id = 1
;
insert into Incoming
values
(
  incoming_seq.nextval
, 1
, 10
, sysdate
);

insert into Incoming
values
(
  incoming_seq.nextval
, 1
, 10
, sysdate
);

select to_char(incoming_date, 'YYYY-MM-DD HH24:MI:SS') from Incoming;

select * from Products;
select * from Incoming;
select * from Outgoing;

select 
COALESCE(TRUNC(i.incoming_date), TRUNC(o.outgoing_date)) AS transaction_date,
p.product_name,
    NVL(SUM(i.quantity), 0) AS total_incoming,
    NVL(SUM(o.quantity), 0) AS total_outgoing
from Products p
INNER JOIN 
    Incoming i ON p.product_id = i.product_id
INNER JOIN 
    Outgoing o ON p.product_id = o.product_id AND TRUNC(i.incoming_date) = TRUNC(o.outgoing_date)
group by COALESCE(TRUNC(i.incoming_date), TRUNC(o.outgoing_date)), p.product_name
ORDER BY 
    transaction_date;

insert into Outgoing
values
(
  outgoing_seq.nextval
, 1
, 5
, sysdate
);
select * from Outgoing;
select to_date('2024-10-01','YYYY-MM-DD') + LEVEL - 1 AS dt 
from dual
connect by level <= (to_date(sysdate,'YYYY-MM-DD')
                    - to_date('2024-10-01','YYYY-MM-DD')+1)
;
CREATE TABLE Inventory_Log (
    log_id NUMBER PRIMARY KEY,
    product_id NUMBER REFERENCES Products(product_id),
    product_barcode VARCHAR2(100) NOT NULL,
    change_type VARCHAR2(20) CHECK (change_type IN ('입고', '출고')),
    quantity NUMBER NOT NULL,
    change_date DATE DEFAULT SYSDATE,
    description VARCHAR2(500)
);