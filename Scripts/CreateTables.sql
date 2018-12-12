create table Users
(
  id     varchar(20) not null
    primary key,
  nom    varchar(256),
  prenom varchar(256),
  pseudo varchar(256),
  mail   varchar(256)
)
go

create table Commentaires
(
  id      varchar(20) not null
    primary key,
  titre   varchar(2048),
  post    varchar(2048),
  creator varchar(20)
    constraint Commentaires_Users_ID_fk
      references Users
)
go

create unique index Commentaires_id_uindex
  on Commentaires (id)
go

create table User_adresse
(
  id         varchar(20) not null
    primary key,
  rue        varchar(256),
  numRue     int,
  codePostal int,
  ville      varchar(256),
  [user]     varchar(20)
    constraint User_adresse_Users_id_fk
      references Users
)
go

create unique index Adresse_id_uindex
  on User_adresse (id)
go

create unique index Users_id_uindex
  on Users (id)
go

create table Users_password
(
  id       varchar(20) not null
    constraint Users_password_pk
      primary key nonclustered,
  userId   varchar(20)
    constraint Users_password_Users_id_fk
      references Users,
  password varchar(256)
)
go

create table payment_type
(
  id          varchar(20) not null
    constraint Payment_type_pk
      primary key nonclustered,
  name        varchar(256),
  description varchar(2048)
)
go

create table Objects
(
  id           varchar(20) not null
    primary key,
  nom          varchar(256),
  description  varchar(2048),
  prix         int,
  creator      varchar(20)
    constraint Objects_Users_ID_fk
      references Users,
  payementType varchar(20)
    constraint Objects_payment_type_id_fk
      references payment_type
)
go

create unique index Objects_id_uindex
  on Objects (id)
go

create table payement
(
  id        varchar(20) not null
    constraint payement_pk
      primary key nonclustered,
  type      varchar(20)
    constraint payement_Payment_type_id_fk
      references payment_type,
  numberUse int,
  [user]    varchar(20)
    constraint payement_Users_id_fk
      references Users
)
go

create table Vente
(
  id           varchar(20) not null
    constraint Vente_pk
      primary key nonclustered,
  acheteur     varchar(20)
    constraint Vente_Users_id_fk
      references Users,
  objet        varchar(20)
    constraint Vente_Objects_id_fk
      references Objects,
  date         datetime,
  payementUsed varchar(20)
    constraint Vente_payement_id_fk
      references payement
)
go

create unique index Vente_id_uindex
  on Vente (id)
go

create unique index payement_id_uindex
  on payement (id)
go

create unique index Payment_type_id_uindex
  on payment_type (id)
go

