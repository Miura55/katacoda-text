# 環境構築
サンプルアプリを動かす前に今回の環境構築を行います。

## セットアップ
必要なソフトウェアのセットアップは起動時に自動で行われます。

今回はNode-REDの他に決済情報をDBに溜め込むために、**Mongo DB**を使用しています。

Mongo DBは簡単に言うとNoSQLのデータベースです。

そのMongo DBをNode-REDに接続するためのユーザーもこのセットアップで行っています。

最終的に以下の表示がされたら今回使用するデータベースとそのデータベースに接続するユーザーの作成が完了しています

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

そのパスワードは以下のコマンドを実行すると表示されます。コマンドの部分をクリックするだけで右側のターミナルでコマンドが実行されます。

`echo "Your Node-RED password:${YOUR_NODERED_PASSWORD}"`{{execute}}

設定されているパスワードはインストール完了時に表示される `Your Node-RED password:YOUR_PASSWORD` の行にある `YOUR_PASSWORD` の部分です。

このパスワードでNode-REDにログインする必要があるので忘れずにメモしておいてください。

ちなみにパスワードはランダムな文字列で、実行環境を再起動すると毎回変わります。

Node-REDのフローエディタは以下のURLから開きます。

https://[[HOST_SUBDOMAIN]]-1880-[[KATACODA_HOST]].environments.katacoda.com

URLを開くと以下のようにログイン画面が開くので、ユーザー名は `admin` 、パスワードは先程メモしたパスワードを使います。

![login](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/node-red-login.png)

無事にログインが完了すると、以下のようなフローエディタが開くので、これでNode-REDの実行環境の用意ができています。

![node-red-editor](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/node-red-editor.png)

### 注意
katacodaの実行環境は60分が経過すると強制終了されて作業内容が破棄されます。なので60分以内にサンプルアプリを動かすようにしましょう。

## 必要なノードをインストール
続いてNode-REDを使うために必要なノードをインストールします。

まずはNode-REDのフローエディタの画面の右上のハンバーガーメニューから「パレットの追加」を選択します。

![palette](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/manage-palette.png)

「ノードを追加」タブをクリックして、検索窓から`node-red-contrib-line-pay`を検索して `ノードを追加`をクリックします。

![install](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/install-node.png)

インストール時に以下のようなダイアログが表示されますので、そのまま `追加`をクリックします。

![confirm-install](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/confirm-install.png)

同様の手順で、以下のノードもインストールしてください。

- `node-red-contrib-uuid`
- `node-red-contrib-mongodb3`
- `node-red-contrib-line-messaging-api`(Step2でLINE botを使ったサンプルを試す場合)

以上で環境構築は完了です。次のステップからサンプルアプリを動かしていきます。
