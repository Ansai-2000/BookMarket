create table if not exists product(
	p_id varchar(10) not null,
	p_name varchar(30),
	p_unitPrice INTEGER,
	p_description TEXT,
	p_category VARCHAR(30),
	p_manufacturer VARCHAR(30),
	p_unitsInStock LONG,
	p_condition VARCHAR(30),
	p_fileName VARCHAR(30),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;
