ここでは今回使用したアプリケーションで使用した技術について簡単に解説します。

# UUID
UUIDは、ソフトウェア上で一意に識別するための一種の識別子です。

そのため、このUUIDを使ってStep1のアプリケーションでユーザーの購入商品を把握するように実装しています。

アプリケーションのURL`/shop`を開くとUUIDが発行されるので、そのUUIDで購入品を溜め込むようにしておきます。

ちなみにLINE botに関しては、LINE botで使っているMessaging API上で使用するユーザーIDを使えば購入商品を把握することができるので、UUIDを使う必要はありません。
# Mongo DB
今回のフローではMongo DBを使用しています。

このMongo DBはNo SQLのデータベースで、My SQLを始めとしたRDBと違いデータ構造を定義しなくてもデータを貯めることができる特徴があります。

今回のアプリケーションでは、以下の用途でMongo DBを使用しています。

- ユーザーが購入する商品情報の保存
- 取引情報の保存

商品情報のコレクションは、Request APIで商品を登録するときに必要になる商品情報を登録するショッピングカート的な役割があります。

取引情報のコレクションは、Request APIを実行したときに発行されるトランザクションIDと商品情報のコレクションで集計した合計金額を記録してConfirm APIを実行するためのキャッシュとして使用します。

さらにこの取引情報のコレクションでは、LINE botの決済を行ったときに決済完了後にレシートを送信するために必要なLINEのユーザーIDも合わせて記録するようにして、LINEのユーザーIDがキャッシュとして記録されていたらStep1の「/confirm」のフローでメッセージを送信する仕組みを取り入れてます。

## Mongo Express
Mongo DBの中身を確認するときには、CLIツールをつかって確認することもできますがGUIからデータを可視化する方法もあります。そのときに使うツールがMongo Expressです。

Mongo Expressは別途インストールが必要になるのですが、今回はStep0で環境構築したときにMongo Expressを予めインストールしています。

そのため、以下のURLをクリックするとMongo Expressを開くことができます。

https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com

Mongo Expressを開くと以下のようにデータベースの一覧が表示されます。

今回のアプリケーションでは、`shop`というデータベースを使用しています。

![mongo-express](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/mongo-express.png)

さらにshopデータベースの中身をみると以下のように3つのコレクションが作成されていることが確認できます。

![mongo-express-collections](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/mongo-express-collections.png)

実際にアプリケーションを動かしながら各コレクションにどのようにしてデータが保存されているのか確認できるため、今回のアプリケーションについて更に理解が深まると思います。
