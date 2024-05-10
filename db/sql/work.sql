-- 口コミ情報
-- * BackupToTempTable
drop table if exists "reviews" cascade;

-- * RestoreFromTempTable
create table "reviews" (
  "id" serial not null
  , "user_id" integer not null
  , "shop_id" integer not null
  , "title" character varying(100) not null
  , "comment" character varying(100) not null
  , "comprehensive_evaluation" numeric(10) not null
  , "created_at" timestamp without time zone not null
  , "updated_at" timestamp without time zone not null
  , "deleted_at" timestamp
  , constraint "reviews_PKC" primary key ("id","user_id","shop_id")
) ;

create unique index "reviews_pk"
  on "reviews"("id");

-- 店舗情報
-- * BackupToTempTable
drop table if exists "shops" cascade;

-- * RestoreFromTempTable
create table "shops" (
  "id" serial not null
  , "name" character varying(100) not null
  , "basic_infomation" character varying(500) not null
  , "latitude" numeric(10) not null
  , "longitude" numeric(10) not null
  , "address" character varying(100) not null
  , "tel" character varying(15)
  , "nearest_station" character varying(15)
  , "comprehensive_evaluation" numeric(10)
  , "created_at" timestamp without time zone
  , "updated_at" timestamp without time zone
  , "deleted_at" timestamp
  , constraint "shops_PKC" primary key ("id")
) ;

create unique index "shops_pk"
  on "shops"("id");

-- ユーザ情報
-- * BackupToTempTable
drop table if exists "users" cascade;

-- * RestoreFromTempTable
create table "users" (
  "id" serial not null
  , "name" character varying(10) not null
  , "nick_name" character varying(10) not null
  , "email" character varying(100) not null
  , "password" character varying(100) not null
  , "gender" character(1) not null
  , "birth" character(10) not null
  , "tel" character varying(15) not null
  , "address" character(2) not null
  , "image_data" character varying(100)
  , "created_at" timestamp without time zone not null
  , "updated_at" timestamp without time zone not null
  , "deleted_at" timestamp
  , constraint "users_PKC" primary key ("id")
) ;

create unique index "users_pk"
  on "users"("id");

-- 管理者情報
-- * BackupToTempTable
drop table if exists "administrators" cascade;

-- * RestoreFromTempTable
create table "administrators" (
  "id" serial not null
  , "shop_id" integer not null
  , "name" character varying(10) not null
  , "email" character varying(100) not null
  , "password" character varying(100) not null
  , "tel" character varying(15)
  , "role" character(1) default 0
  , "created_at" timestamp without time zone not null
  , "updated_at" timestamp without time zone not null
  , "deleted_at" timestamp not null
  , constraint "administrators_PKC" primary key ("id","shop_id")
) ;

create unique index "administrators_pk"
  on "administrators"("id");

alter table "reviews"
  add constraint "reviews_FK1" foreign key ("user_id") references "users"("id")
  on delete cascade;

alter table "reviews"
  add constraint "reviews_FK2" foreign key ("shop_id") references "shops"("id")
  on delete cascade;

comment on table "reviews" is '口コミ情報';
comment on column "reviews"."id" is 'ID';
comment on column "reviews"."user_id" is 'ユーザID';
comment on column "reviews"."shop_id" is 'ショップID';
comment on column "reviews"."title" is 'タイトル';
comment on column "reviews"."comment" is 'コメント';
comment on column "reviews"."comprehensive_evaluation" is '総合評価:整数：1桁、少数：2桁';
comment on column "reviews"."created_at" is '登録日時';
comment on column "reviews"."updated_at" is '更新日時';
comment on column "reviews"."deleted_at" is '削除日時';

comment on table "shops" is '店舗情報';
comment on column "shops"."id" is 'ID';
comment on column "shops"."name" is '店舗名';
comment on column "shops"."basic_infomation" is '基本情報';
comment on column "shops"."latitude" is '緯度';
comment on column "shops"."longitude" is '軽度';
comment on column "shops"."address" is '住所';
comment on column "shops"."tel" is '電話番号';
comment on column "shops"."nearest_station" is '最寄り駅';
comment on column "shops"."comprehensive_evaluation" is '店舗総合評価:整数：1桁、少数：2桁
口コミ一覧の平均値から算出する。';
comment on column "shops"."created_at" is '登録日時';
comment on column "shops"."updated_at" is '更新日時';
comment on column "shops"."deleted_at" is '削除日時';

comment on table "users" is 'ユーザ情報';
comment on column "users"."id" is 'ID';
comment on column "users"."name" is '名前';
comment on column "users"."nick_name" is 'ニックネーム';
comment on column "users"."email" is 'メールアドレス';
comment on column "users"."password" is 'パスワード';
comment on column "users"."gender" is '性別';
comment on column "users"."birth" is '生年月日';
comment on column "users"."tel" is '電話番号';
comment on column "users"."address" is '住まい';
comment on column "users"."image_data" is 'アイコン';
comment on column "users"."created_at" is '登録日時';
comment on column "users"."updated_at" is '更新日時';
comment on column "users"."deleted_at" is '削除日時';

comment on table "administrators" is '管理者情報';
comment on column "administrators"."id" is 'ID';
comment on column "administrators"."shop_id" is '店舗ID';
comment on column "administrators"."name" is '名前';
comment on column "administrators"."email" is 'メールアドレス';
comment on column "administrators"."password" is 'パスワード';
comment on column "administrators"."tel" is '電話番号';
comment on column "administrators"."role" is '権限:0:サービス管理者/1:ショップ管理者';
comment on column "administrators"."created_at" is '登録日時';
comment on column "administrators"."updated_at" is '更新日時';
comment on column "administrators"."deleted_at" is '削除日時';
