# Step0 環境構築
サンプルアプリを動かす前に今回の環境構築を行います。

## Node-REDのフローエディタにログイン
今回使用するNode-REDのURLは外部に公開されているため、何も設定していないと誰でもフローエディタを開けるので危険です。

そのため、Node-REDのインストール時にパスワードを自動で設定しています。

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
- `node-red-contrib-line-messaging-api`

以上で環境構築は完了です。次のステップからサンプルアプリを動かしていきます。
