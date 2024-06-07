-- ユーザー情報
-- * BackupToTempTable

-- * RestoreFromTempTable
create table "users" (
  "id" int AUTO_INCREMENT primary key
  , "user_id" int not null
  , "name" varchar(100) not null
  , "password" varchar(100) not null
  , "created_at" datetime
  , "updated_at" datetime
  , "deleted_at" datetime
) ;

-- チャット情報
-- * BackupToTempTable

-- * RestoreFromTempTable
create table "chat" (
  "id" int AUTO_INCREMENT primary key
  , "user_id" int not null
  , "send_user_id" int not null
  , "comment" varchar(100) not null
  , "created_at" datetime
  , "updated_at" datetime
) ;


-- NGワード登録
-- * BackupToTempTable

-- * RestoreFromTempTable
create table "ngWords" (
  "user_id" int not null
  , "ng_comment1" varchar(100) not null
  , "ng_comment2" varchar(100) not null
  , "ng_comment3" varchar(100) not null
  , "created_at" datetime
  , "updated_at" datetime
) ;


-- NGワード履歴
-- * BackupToTempTable

-- * RestoreFromTempTable
create table "ngWordLogs" (
  "id" int AUTO_INCREMENT primary key
  , "user_id" int not null
  , "send_user_id" int not null
  , "ng_comment" varchar(100) not null
  , "created_at" datetime
  , "updated_at" datetime
) ;
