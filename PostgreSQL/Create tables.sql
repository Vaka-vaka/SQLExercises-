create table Users (
	id serial primary key,
	name varchar(50) not null,
	description varchar(250)
);

create table Item (
	id serial primary key,
	name varchar(50),
	category_id integer not null,
	constraint category_id_fk foreign key (category_id) references category(id) 
);

create table Groups (
	id serial primary key,
	name varchar(50) not null
);

alter table groups 
	add column dascription varchar(250) - добавить
;

create table group_to_user (
	user_id integer not null,
	group_id integer not null,
	
	constraint user_id_fk foreign key (user_id) references users(id),
	constraint group_id_fk foreign key (group_id) references groups(id)
);


create table user_extend (
	additinal_data text,	
	user_id integer unique not null, (уникальна запись unique) 
	constraint user_id_fk foreign key (user_id) references users(id) 
);

create table Orders (
	id serial primary key,
	number integer not null,
	descr varchar(250),
	user_id integer not null,
	constraint user_id foreign key (user_id) references users(id) 
); 

create table category (
	id serial primary key,
	name varchar(50),
	description varchar (50),
	parent_id integer,
	constraint parent_id_fk foreign key (parent_id) references category(id)
);

create table order_lines (
	id serial primary key,
	order_id integer not null,
	item_id integer not null,
	item_count integer,
	constraint order_id_fk foreign key (order_id) references orders(id),
	constraint item_id_fk foreign key (item_id) references item(id)
);

