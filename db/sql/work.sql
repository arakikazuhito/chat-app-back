-- ユーザー情報
-- * BackupToTempTable
drop table if exists "users" cascade;

-- * RestoreFromTempTable
create table "users" (
  "id" serial not null
  , "user_id" integer not null
  , "name" character varying(100) not null
  , "password" character varying(100) not null
  , "created_at" timestamp without time zone not null
  , "updated_at" timestamp without time zone not null
  , "deleted_at" timestamp
  , constraint "reviews_PKC" primary key ("id","user_id","shop_id")
) ;

create unique index "chat"
  on "reviews"("id");

-- チャット情報
-- * BackupToTempTable
drop table if exists "chat" cascade;

-- * RestoreFromTempTable
create table "chat" (
  "id" serial not null
  , "user_id" numeric(10) not null
  , "send_user_id" numeric(10) not null
  , "comment" character varying(100) not null
  , "created_at" timestamp without time zone
  , "updated_at" timestamp without time zone
  , constraint "shops_PKC" primary key ("id")
) ;


-- NGワード登録
-- * BackupToTempTable
drop table if exists "ngWords" cascade;

-- * RestoreFromTempTable
create table "ngWords" (
  "user_id" numeric(10) not null
  , "ng_comment1" character varying(100) not null
  , "ng_comment2" character varying(100) not null
  , "ng_comment3" character varying(100) not null
  , "created_at" timestamp without time zone
  , "updated_at" timestamp without time zone
  , constraint "shops_PKC" primary key ("id")
) ;


-- NGワード履歴
-- * BackupToTempTable
drop table if exists "ngWordLogs" cascade;

-- * RestoreFromTempTable
create table "ngWordLogs" (
  "id" serial not null
  , "user_id" numeric(10) not null
  , "send_user_id" numeric(10) not null
  , "ng_comment" character varying(100) not null
  , "created_at" timestamp without time zone
  , "updated_at" timestamp without time zone
  , constraint "shops_PKC" primary key ("id")
) ;
