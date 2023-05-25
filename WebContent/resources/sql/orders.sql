create table if not exists orders(
	order_id varchar(40) not null, 
	member_id varchar(10) not null,
	p_id varchar(10) not null,	
	price INTEGER, 
	quantity INTEGER default 0,
	orderdate varchar(40), 
	FOREIGN KEY (member_id) REFERENCES member(member_id),
  FOREIGN KEY (p_id) REFERENCES product(p_id)	
)default CHARSET=utf8;

