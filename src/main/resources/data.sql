-------------SQL;
use retirement;


create table user (
		id bigint not null auto_increment, 
		name varchar(255), 
		phone varchar(255),
		primary key (id));
