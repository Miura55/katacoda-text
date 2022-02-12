# Node-REDでLINE Pay APIを使って決済システムを使ってみる

この教材ではNode-REDでLINE Payを扱うことができる「node-red-contrib-line-pay」を使って、Node-REDで決済システムを作成する方法を紹介していきます。

## 前提条件
始める前に以下の準備を完了させてください。

- LINE PayのAPIを実行するために必要なチャネルIDとチャネルシークレットを発行しておいてください。Sandbox環境で発行する時には、[こちら](https://pay.line.me/jp/developers/techsupport/sandbox/creation)から発行できます。
- LINEのMessaging APIのチャネルを作成しておいてください(Step2でLINE botを使ったサンプルを試す場合)。Messaging APIのチャネルは[こちら](https://developers.line.biz/ja/docs/messaging-api/getting-started/#using-console)を参考にして作成します。
