# 環境構築
サンプルアプリを動かす前に今回の環境構築を行います。

## セットアップ
必要なソフトウェアのセットアップは起動時に自動で行われます。

全部終わるまでかなり時間がかかるので完了するまで待っていただければと思います。

今回はNode-REDの他に決済情報をDBに溜め込むために、Mongo DBを使用しています。

Mongo DBはNoSQLのデータベースです。テーブルの構造を定義しなくても簡単にデータを貯めることができます。

そのMongo DBをNode-REDに接続するためのユーザーの作成もこのセットアップで行っています。

最終的に以下の出力が表示されたら今回使用するデータベースとそのデータベースに接続するユーザーの作成が完了しています

```json
Successfully added user: {
    "user" : "nodered",
    "roles" : [
        {
            "role" : "readWrite",
            "db" : "shop"
        }
    ]
}
```

## Node-REDのフローエディタにログイン
今回使用するNode-REDのURLは外部に公開されているため、何も設定していないと誰でもフローエディタを開けるので危険です。

そのため、先程の初回起動時にパスワードを自動で設定しています。

設定されているパスワードはインストール完了時に表示される `Your Node-RED password:YOUR_PASSWORD` の行にある `YOUR_PASSWORD` になりますので、忘れないようにメモしておきましょう。

たまに先程のMongo DBのユーザーだけ表示されてパスワードが表示されないことがあります。

その時は以下のコマンドを実行すると表示されます。コマンドの部分をクリックするだけで右側のターミナルでコマンドが実行されます。

`echo "Your Node-RED password:${YOUR_NODERED_PASSWORD}"`{{execute}}

このパスワードでNode-REDにログインする必要があるので忘れずにメモしておいてください。

ちなみにパスワードはランダムな文字列で、実行環境を再起動すると毎回変わります。

Node-REDのフローエディタは以下のURLから開きます。

https://[[HOST_SUBDOMAIN]]-1880-[[KATACODA_HOST]].environments.katacoda.com

URLを開くと以下のようにログイン画面が開くので、ユーザー名は `admin`{{copy}} 、パスワードは先程メモしたパスワードを使います。

![login](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/node-red-login.png)

無事にログインが完了すると、以下のようなフローエディタが開くので、これでNode-REDの実行環境の用意ができています。

![node-red-editor](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/node-red-editor.png)

### トラブルシューティング
セットアップ中に `Error: couldn't connect to server mongodb:27017`というエラーが出ることがあります。

これはMongo DBのサーバーが起動していないときに発生するエラーで、このエラーが出ているときにユーザーを追加してもエラーになるので、その対策としてエラーが解消されるまで待機するように以下の処理をセットアップスクリプトを入れています。

```sh
until mongo --quiet --host mongodb -u "root" -p "admin" --authenticationDatabase 'admin' --eval "db.getMongo()"; do
	echo 2>&1 "MongoDB is unavailable - sleeping"
	sleep 1
done
```
そのため、エラーが出ても最終的に以下のようにMongo DBのユーザーが追加されていれば問題ないのでご安心ください。

```json
Successfully added user: {
    "user" : "nodered",
    "roles" : [
        {
            "role" : "readWrite",
            "db" : "shop"
        }
    ]
}
```

## 必要なノードをインストール
続いてNode-REDを使うために必要なノードをインストールします。

通常はフローエディタからインストールしますが、今回は以下のコマンドを実行するとインストールすることができます。

コマンドをクリックしてインストールしてください。

```
docker-compose exec nodered npm install --prefix=/data node-red-contrib-line-pay node-red-contrib-uuid node-red-contrib-mongodb3 node-red-contrib-line-messaging-api
```{{execute}}

最終的に以下のようにインストールしたノード名が4つ表示されたらインストール完了です。

```
+ node-red-contrib-mongodb3@2.0.1
+ node-red-contrib-line-pay@0.0.1
+ node-red-contrib-uuid@0.0.4
+ node-red-contrib-line-messaging-api@0.1.9
```

インストールしたノードを使えるようにするために一度Node-REDを再起動します。

以下のコマンドを実行して再起動します。

```
docker-compose restart nodered
```{{execute}}

再起動した後、再度Node-REDを開いたときに左のノード一覧をスクロールしたときに

以下のように今回インストールしたノードが表示されていたらノードが使える状態になります。

![check-installed-node](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/check-installed-node.png)

以上で環境構築は完了です。次のステップからサンプルアプリを動かしていきます。
