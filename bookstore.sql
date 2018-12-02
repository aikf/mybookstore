create table category(
  id varchar (40) primary key ,
  name varchar (40) not null unique ,
  description varchar (255)
);

create table book(
  id varchar (40) primary key ,
  name varchar (40) not null unique ,
  price decimal (10,2) not null ,
  author varchar (20) not null ,
  image varchar (255) not null ,
  description varchar (255) ,
  category_id varchar (40) ,
  constraint category_id_FK foreign key(category_id) references category(id)
);

create table user(
  id varchar (40) primary key ,
  username varchar(40) not null unique ,
  password varchar (40) not null ,
  phone varchar (20) not null ,
  cellphone varchar (20) not null ,
  email varchar (40) not null ,
  address varchar (255) not null
);

create table orders(
  id varchar (40) primary key ,
  ordertime datetime not null ,
  state boolean not null ,
  price decimal (10,2) not null ,
  user_id varchar (40) ,
  constraint user_id_FK foreign key(user_id) references user(id)
);

create table orderitem(
  oi_id varchar (40) primary key ,
  quantity int not null ,
  price decimal (10,2) not null ,
  book_id varchar (40) ,
  order_id varchar (40) ,
  constraint book_id_FK foreign key(book_id) references book(id) ,
  constraint orders_id_FK foreign key(order_id) references orders(id)
);