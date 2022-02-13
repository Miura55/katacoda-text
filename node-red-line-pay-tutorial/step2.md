# LINE botでモバイルオーダーアプリを作ってみる
次のステップでは、LINE botでLINE Payを使ったアプリを作ってみます。

今回は飲食店で導入が進んでいるモバイルオーダーを題材にしてみます。

## フローのコピー
今回のフローは以下のJsonになるので、Step1と同様にコピーしてください。

```json
[{"id":"c9ac6da.8acb79","type":"tab","label":"Step2","disabled":false,"info":""},{"id":"58111ba3.325234","type":"http in","z":"c9ac6da.8acb79","name":"","url":"callback","method":"post","upload":false,"swaggerDoc":"","x":120,"y":100,"wires":[["c8c6a378.8cccb","b9005e4b.5e7dd"]]},{"id":"20a15ce9.34b624","type":"http response","z":"c9ac6da.8acb79","name":"","statusCode":"","headers":{},"x":520,"y":80,"wires":[]},{"id":"c8c6a378.8cccb","type":"switch","z":"c9ac6da.8acb79","name":"","property":"payload.events","propertyType":"msg","rules":[{"t":"empty"},{"t":"else"}],"checkall":"true","repair":false,"outputs":2,"x":310,"y":100,"wires":[["20a15ce9.34b624"],["c0c69e02c6324fb9"]]},{"id":"b9005e4b.5e7dd","type":"debug","z":"c9ac6da.8acb79","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","x":194,"y":160,"wires":[]},{"id":"fd958718.a8f038","type":"switch","z":"c9ac6da.8acb79","name":"","property":"payload.events.0.message.text","propertyType":"msg","rules":[{"t":"eq","v":"支払い","vt":"str"},{"t":"eq","v":"ハンバーガー","vt":"str"},{"t":"eq","v":"コーヒー","vt":"str"},{"t":"eq","v":"アールグレイ","vt":"str"},{"t":"eq","v":"ケーキ","vt":"str"},{"t":"eq","v":"クリームソーダ","vt":"str"},{"t":"eq","v":"メニュー","vt":"str"},{"t":"else"}],"checkall":"true","repair":false,"outputs":8,"x":110,"y":520,"wires":[["f35621d220372782"],["28a1bfc62a5e61a9"],["72ee08fb81115093"],["957174d9c3c2d5db"],["42896a022d177985"],["8219c40e2d8930b0"],["27e7c60796445469"],["544d0c5a.a6a174"]]},{"id":"5773410a.e7014","type":"function","z":"c9ac6da.8acb79","name":"返信用メッセージの作成","func":"msg.payload = msg.hookEvent;\nmsg.payload.events[0].message.text.footer.contents[0].action.uri = msg.resBody.info.paymentUrl.web; \nreturn msg;","outputs":1,"noerr":0,"initialize":"","finalize":"","libs":[],"x":1170,"y":440,"wires":[["544d0c5a.a6a174"]]},{"id":"27e7c60796445469","type":"change","z":"c9ac6da.8acb79","name":"メニューを送信","rules":[{"t":"set","p":"payload.events.0.message.type","pt":"msg","to":"flex","tot":"str"},{"t":"set","p":"payload.events.0.message.altText","pt":"msg","to":"メニュー","tot":"str"},{"t":"set","p":"payload.events.0.message.text","pt":"msg","to":"{\"type\":\"carousel\",\"contents\":[{\"type\":\"bubble\",\"hero\":{\"type\":\"image\",\"url\":\"https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_2_restaurant.png\",\"size\":\"full\",\"aspectRatio\":\"20:13\",\"aspectMode\":\"cover\"},\"body\":{\"type\":\"box\",\"layout\":\"vertical\",\"spacing\":\"md\",\"action\":{\"type\":\"uri\",\"label\":\"Action\",\"uri\":\"https://linecorp.com\"},\"contents\":[{\"type\":\"text\",\"text\":\"ハンバーガー\",\"weight\":\"bold\",\"size\":\"xl\",\"contents\":[]},{\"type\":\"text\",\"text\":\"¥500\",\"weight\":\"bold\",\"margin\":\"sm\",\"contents\":[]}]},\"footer\":{\"type\":\"box\",\"layout\":\"vertical\",\"contents\":[{\"type\":\"spacer\",\"size\":\"xxl\"},{\"type\":\"button\",\"action\":{\"type\":\"message\",\"label\":\"Add to Cart\",\"text\":\"ハンバーガー\"},\"color\":\"#905C44\",\"style\":\"primary\"}]}},{\"type\":\"bubble\",\"hero\":{\"type\":\"image\",\"url\":\"https://cdn.pixabay.com/photo/2017/09/04/18/39/coffee-2714970_1280.jpg\",\"size\":\"full\",\"aspectRatio\":\"20:13\",\"aspectMode\":\"cover\"},\"body\":{\"type\":\"box\",\"layout\":\"vertical\",\"spacing\":\"md\",\"action\":{\"type\":\"uri\",\"label\":\"Action\",\"uri\":\"https://linecorp.com\"},\"contents\":[{\"type\":\"text\",\"text\":\"コーヒー\",\"weight\":\"bold\",\"size\":\"xl\",\"contents\":[]},{\"type\":\"text\",\"text\":\"¥200\",\"weight\":\"bold\",\"margin\":\"sm\",\"contents\":[]}]},\"footer\":{\"type\":\"box\",\"layout\":\"vertical\",\"contents\":[{\"type\":\"spacer\",\"size\":\"xxl\"},{\"type\":\"button\",\"action\":{\"type\":\"message\",\"label\":\"Add to Cart\",\"text\":\"コーヒー\"},\"color\":\"#905C44\",\"style\":\"primary\"}]}},{\"type\":\"bubble\",\"hero\":{\"type\":\"image\",\"url\":\"https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971556_1280.jpg\",\"size\":\"full\",\"aspectRatio\":\"20:13\",\"aspectMode\":\"cover\"},\"body\":{\"type\":\"box\",\"layout\":\"vertical\",\"spacing\":\"md\",\"action\":{\"type\":\"uri\",\"label\":\"Action\",\"uri\":\"https://linecorp.com\"},\"contents\":[{\"type\":\"text\",\"text\":\"ケーキ\",\"weight\":\"bold\",\"size\":\"xl\",\"contents\":[]},{\"type\":\"text\",\"text\":\"¥400\",\"weight\":\"bold\",\"margin\":\"sm\",\"contents\":[]}]},\"footer\":{\"type\":\"box\",\"layout\":\"vertical\",\"contents\":[{\"type\":\"spacer\",\"size\":\"xxl\"},{\"type\":\"button\",\"action\":{\"type\":\"message\",\"label\":\"Add to Cart\",\"text\":\"ケーキ\"},\"color\":\"#905C44\",\"style\":\"primary\"}]}},{\"type\":\"bubble\",\"hero\":{\"type\":\"image\",\"url\":\"https://cdn.pixabay.com/photo/2015/07/01/08/42/oolong-827397_1280.jpg\",\"size\":\"full\",\"aspectRatio\":\"20:13\",\"aspectMode\":\"cover\"},\"body\":{\"type\":\"box\",\"layout\":\"vertical\",\"spacing\":\"md\",\"action\":{\"type\":\"uri\",\"label\":\"Action\",\"uri\":\"https://linecorp.com\"},\"contents\":[{\"type\":\"text\",\"text\":\"アールグレイ\",\"weight\":\"bold\",\"size\":\"xl\",\"contents\":[]},{\"type\":\"text\",\"text\":\"¥200\",\"weight\":\"bold\",\"margin\":\"sm\",\"contents\":[]}]},\"footer\":{\"type\":\"box\",\"layout\":\"vertical\",\"contents\":[{\"type\":\"spacer\",\"size\":\"xxl\"},{\"type\":\"button\",\"action\":{\"type\":\"message\",\"label\":\"Add to Cart\",\"text\":\"アールグレイ\"},\"color\":\"#905C44\",\"style\":\"primary\"}]}},{\"type\":\"bubble\",\"hero\":{\"type\":\"image\",\"url\":\"https://cdn.pixabay.com/photo/2019/08/26/08/30/melon-soda-4431112_1280.jpg\",\"size\":\"full\",\"aspectRatio\":\"20:13\",\"aspectMode\":\"cover\"},\"body\":{\"type\":\"box\",\"layout\":\"vertical\",\"spacing\":\"md\",\"action\":{\"type\":\"uri\",\"label\":\"Action\",\"uri\":\"https://linecorp.com\"},\"contents\":[{\"type\":\"text\",\"text\":\"クリームソーダ\",\"weight\":\"bold\",\"size\":\"xl\",\"contents\":[]},{\"type\":\"text\",\"text\":\"¥200\",\"weight\":\"bold\",\"margin\":\"sm\",\"contents\":[]}]},\"footer\":{\"type\":\"box\",\"layout\":\"vertical\",\"contents\":[{\"type\":\"spacer\",\"size\":\"xxl\"},{\"type\":\"button\",\"action\":{\"type\":\"message\",\"label\":\"Add to Cart\",\"text\":\"クリームソーダ\"},\"color\":\"#905C44\",\"style\":\"primary\"}]}}]}","tot":"json"}],"action":"","property":"","from":"","to":"","reg":false,"x":580,"y":540,"wires":[["544d0c5a.a6a174"]]},{"id":"c0c69e02c6324fb9","type":"switch","z":"c9ac6da.8acb79","name":"","property":"payload.events.0.type","propertyType":"msg","rules":[{"t":"eq","v":"message","vt":"str"}],"checkall":"true","repair":false,"outputs":1,"x":470,"y":140,"wires":[["199037eeb50e04c0"]]},{"id":"4015512331051563","type":"link out","z":"c9ac6da.8acb79","name":"","links":["b703605ed8caef02"],"x":835,"y":140,"wires":[]},{"id":"b703605ed8caef02","type":"link in","z":"c9ac6da.8acb79","name":"","links":["4015512331051563"],"x":15,"y":480,"wires":[["fd958718.a8f038"]]},{"id":"199037eeb50e04c0","type":"change","z":"c9ac6da.8acb79","name":"","rules":[{"t":"set","p":"hookEvent","pt":"msg","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":670,"y":140,"wires":[["4015512331051563"]]},{"id":"28a1bfc62a5e61a9","type":"change","z":"c9ac6da.8acb79","name":"ハンバーガー","rules":[{"t":"set","p":"payload","pt":"msg","to":"{\"product_name\":\"ハンバーガー\",\"price\":500}","tot":"json"},{"t":"set","p":"payload.line_user_id","pt":"msg","to":"hookEvent.events.0.source.userId","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":310,"y":360,"wires":[["ee9b820732257f62"]]},{"id":"4b9f357e499cf2bf","type":"change","z":"c9ac6da.8acb79","name":"返信するメッセージを作成","rules":[{"t":"set","p":"payload","pt":"msg","to":"hookEvent","tot":"msg"},{"t":"set","p":"payload.events.0.message.text","pt":"msg","to":"追加しました！支払うときは「支払い」と送信してください","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":940,"y":500,"wires":[["544d0c5a.a6a174"]]},{"id":"72ee08fb81115093","type":"change","z":"c9ac6da.8acb79","name":"コーヒー","rules":[{"t":"set","p":"payload","pt":"msg","to":"{\"product_name\":\"コーヒー\",\"price\":200}","tot":"json"},{"t":"set","p":"payload.line_user_id","pt":"msg","to":"hookEvent.events.0.source.userId","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":320,"y":400,"wires":[["ee9b820732257f62"]]},{"id":"957174d9c3c2d5db","type":"change","z":"c9ac6da.8acb79","name":"アールグレイ","rules":[{"t":"set","p":"payload","pt":"msg","to":"{\"product_name\":\"アールグレイ\",\"price\":200}","tot":"json"},{"t":"set","p":"payload.line_user_id","pt":"msg","to":"hookEvent.events.0.source.userId","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":330,"y":440,"wires":[["ee9b820732257f62"]]},{"id":"42896a022d177985","type":"change","z":"c9ac6da.8acb79","name":"ケーキ","rules":[{"t":"set","p":"payload","pt":"msg","to":"{\"product_name\":\"ケーキ\",\"price\":400}","tot":"json"},{"t":"set","p":"payload.line_user_id","pt":"msg","to":"hookEvent.events.0.source.userId","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":310,"y":480,"wires":[["ee9b820732257f62"]]},{"id":"8219c40e2d8930b0","type":"change","z":"c9ac6da.8acb79","name":"クリームソーダ","rules":[{"t":"set","p":"payload","pt":"msg","to":"{\"product_name\":\"クリームソーダ\",\"price\":200}","tot":"json"},{"t":"set","p":"payload.line_user_id","pt":"msg","to":"hookEvent.events.0.source.userId","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":340,"y":520,"wires":[["ee9b820732257f62"]]},{"id":"fdb741caddc350d9","type":"function","z":"c9ac6da.8acb79","name":"注文内容を取得するQuery","func":"msg.payload ={\n    'line_user_id': msg.hookEvent.events[0].source.userId\n}\n\nreturn msg;","outputs":1,"noerr":0,"initialize":"","finalize":"","libs":[],"x":520,"y":280,"wires":[["bf3c3131aaae58ba"]]},{"id":"826af8199c2e112c","type":"function","z":"c9ac6da.8acb79","name":"Request APIのリクエストパラメータ","func":"var appUrl = 'http://localhost:1880';\nvar carts = msg.payload;\nvar userId = msg.hookEvent.events[0].source.userId;\n\nmsg.amount = 0;\nmsg.payload = {\n    \"amount\" : 0,\n    \"currency\" : \"JPY\",\n    \"orderId\" : `CAFE_M_${userId}_${new Date().getTime()}`,\n    \"packages\": [\n        {\n            \"id\": \"package-999\",\n            \"amount\": 0,\n            \"name\": \"Brown Cafe\",\n            \"products\": []\n        }\n    ],\n    \"redirectUrls\" : {\n        \"confirmUrl\" : `${appUrl}/confirm`,\n        \"cancelUrl\" : `${appUrl}/cancel`\n    }\n};\n\nfor (var i = 0; i < Object.keys(carts).length; i++) {\n    const cart = carts[i];\n    var product = {\n        \"id\": cart._id,\n        \"name\": cart.product_name,\n        \"imageUrl\": \"https://cdn.pixabay.com/photo/2015/06/24/01/15/coffee-819362_1280.jpg\",\n        \"quantity\": 1,\n        \"price\": cart.price\n    };\n    // 合計金額に加算\n    msg.amount += cart.price\n    \n    // 商品項目に追加\n    msg.payload.packages[0].products.push(product);\n}\n\n// 合計金額をリクエストパラメータに設定\nmsg.payload.amount = msg.amount;\nmsg.payload.packages[0].amount = msg.amount;\n\nreturn msg;","outputs":1,"noerr":0,"initialize":"","finalize":"","libs":[],"x":1130,"y":280,"wires":[["a547a0ac5646d85b"]]},{"id":"f35621d220372782","type":"change","z":"c9ac6da.8acb79","name":"返信メッセージのたたき台","rules":[{"t":"set","p":"hookEvent.events.0.message.type","pt":"msg","to":"flex","tot":"str"},{"t":"set","p":"hookEvent.events.0.message.altText","pt":"msg","to":"精算お願いします","tot":"str"},{"t":"set","p":"hookEvent.events.0.message.text","pt":"msg","to":"{\"type\":\"bubble\",\"hero\":{\"type\":\"image\",\"url\":\"https://cdn.pixabay.com/photo/2015/06/24/01/15/coffee-819362_1280.jpg\",\"size\":\"full\",\"aspectRatio\":\"20:13\",\"aspectMode\":\"cover\",\"action\":{\"type\":\"uri\",\"label\":\"Action\",\"uri\":\"https://linecorp.com\"}},\"body\":{\"type\":\"box\",\"layout\":\"vertical\",\"spacing\":\"md\",\"action\":{\"type\":\"uri\",\"label\":\"Action\",\"uri\":\"https://linecorp.com\"},\"contents\":[{\"type\":\"text\",\"text\":\"お支払いをお願いします\",\"weight\":\"regular\",\"align\":\"center\",\"gravity\":\"center\",\"contents\":[]}]},\"footer\":{\"type\":\"box\",\"layout\":\"vertical\",\"contents\":[{\"type\":\"button\",\"action\":{\"type\":\"uri\",\"label\":\"LINE Payでお支払い\",\"uri\":\"https://linecorp.com\"},\"color\":\"#4EC74DFF\",\"style\":\"primary\"}]}}","tot":"json"}],"action":"","property":"","from":"","to":"","reg":false,"x":260,"y":320,"wires":[["fdb741caddc350d9"]]},{"id":"50f16f322119c2cf","type":"function","z":"c9ac6da.8acb79","name":"キャッシュに挿入するデータ","func":"msg.resBody = msg.payload;\n// キャッシュに挿入するデータ\n// transactionIdはBigIntのためそのままだと挿入できないのでString型に変換\nmsg.payload = {\n    'transaction_id': String(msg.resBody.info.transactionId),\n    'amount': msg.amount,\n    'line_user_id': msg.hookEvent.events[0].source.userId \n}\nreturn msg;","outputs":1,"noerr":0,"initialize":"","finalize":"","libs":[],"x":800,"y":360,"wires":[["61095cfc5de9b4bf"]]},{"id":"ee9b820732257f62","type":"mongodb3 in","z":"c9ac6da.8acb79","service":"_ext_","configNode":"ed3ea133b0a45842","name":"cafe_botコレクションに挿入","collection":"cafe_bot","operation":"insert","x":620,"y":460,"wires":[["4b9f357e499cf2bf"]]},{"id":"bf3c3131aaae58ba","type":"mongodb3 in","z":"c9ac6da.8acb79","service":"_ext_","configNode":"ed3ea133b0a45842","name":"cafe_botコレクションから取得","collection":"cafe_bot","operation":"find.toArray","x":810,"y":280,"wires":[["826af8199c2e112c"]]},{"id":"61095cfc5de9b4bf","type":"mongodb3 in","z":"c9ac6da.8acb79","service":"_ext_","configNode":"ed3ea133b0a45842","name":"order_cacheコレクションに挿入","collection":"order_cache","operation":"insert","x":880,"y":420,"wires":[["5773410a.e7014"]]},{"id":"544d0c5a.a6a174","type":"ReplyMessage","z":"c9ac6da.8acb79","name":"","replyMessage":"","x":1320,"y":600,"wires":[]},{"id":"a547a0ac5646d85b","type":"Request","z":"c9ac6da.8acb79","name":"","linepayConfig":"cd5113dbd94546c6","x":560,"y":360,"wires":[["50f16f322119c2cf"]]},{"id":"ed3ea133b0a45842","type":"mongodb3","uri":"mongodb://mongodb:27017/shop","name":"","options":"","parallelism":"-1"},{"id":"cd5113dbd94546c6","type":"linepay-config","name":"test","uri":"https://sandbox-api-pay.line.me","channelId":"","channelSecret":""}]
```{{copy}}

Step1のときと同様にフローエディターのハンバーガーメニューから「読み込み」を選択します。

![import-menu](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/import-menu.png)

先程コピーしたJsonを貼り付けて、「読み込み」ボタンをクリックします。

![import-flow](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/import-flow.png)

読み込み時に以下のダイアログが表示されます。これはいくつかのノードの内容に重複があるので読み込んで大丈夫かを確認するものです。

ここは内容を確認するために「ノードを参照」をクリックします。

![conflict-dialog](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/conflict-dialog.png)

すると、設定ノードにいくつか確認があるので、Mongo DBの設定ノードについてはチェックをつけた上で右側の「置換」にあるチェックボックスにもチェックを入れておいてください。

LINE Payの設定ノード(test)については、チェックボックスを外しておいてください。

以上の設定を終えたら、「選択したノードを読み込み」をクリックします。

![resolve-conflict](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/resolve-conflict.png)

読み込みが完了すると、フローエディタ上に `Step2`タブが作成されて以下のようなフローが表示されます。

![step2-flow](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/step2-flow.png)

## リクエストパラメータを設定
Step1と同様にRequest APIに必要なリクエストパラメータを設定します。

functionノードの中で `Request APIのリクエストパラメータ`をダブルクリックします。

![function-request-api](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/function-request-api.png)

ダブルクリックしたときに表示されるコードエディタ画面の1行目にある `appUrl`の値を今起動しているNode-REDのURLに変更します。

改めてになりますが、Node-REDのURLは以下のものになるので、右側のクリップボードアイコンをクリックしてURLをコピーして書き換えても大丈夫です。

`https://[[HOST_SUBDOMAIN]]-1880-[[KATACODA_HOST]].environments.katacoda.com`{{copy}}

![code-edit-step1](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/code-edit-step1.png)

ここまでできたら最後に右上の「デプロイ」ボタンをクリックして変更内容を保存します。

![deploy-button](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/deploy-button.png)

## Messaging APIの認証情報を入力
フローを読み込んだところでMessaging APIの認証情報を設定していきます。

フローの中の「ReplyMessage」ノードをダブルクリックします。

![reply-message-node](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/reply-message-node.png)

Messaging APIのチャネルシークレットとアクセストークンを入力する項目があるので、ご自分のチャネルから確認したものを入力します。

入力した「完了」ボタンをクリックして、設定を閉じます。

![set-reply-message-node](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/set-reply-message-node.png)

そして、もう一箇所アクセストークンを設定します。それは支払い完了時にユーザーにレシートを送信するためにリクエストパラメータを設定しているfunctionノードです。

「Step1」タブの中にある「レシートを作成」と書かれたfunctionノードをダブルクリックします。

![make-receipt-function](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/make-receipt-function.png)

コードエディタが表示されるので、1行目の `accessToken`の値をご自分のMessaging APIのアクセストークンに変更してください。

変更したら「完了」ボタンを押して、設定を閉じます。

![fuction-make-receipt](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/fuction-make-receipt.png)i

ここまで設定が完了したら、右上の「デプロイ」ボタンをクリックして変更内容を保存します。

## Messaging APIのWebhook URLを設定
ここからはMessaging APIのWebhook URLを設定します。

LINE Developersで今回使用するMessaging APIのチャネルの設定画面を開き、「Messaging API設定」タブを開きます。

![messaging-api-channel](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/messaging-api-channel.png)

スクロールしていくと、「Webhook設定」という項目が出てくると思うので以下のURLをWebhook URLに設定します。

`https://[[HOST_SUBDOMAIN]]-1880-[[KATACODA_HOST]].environments.katacoda.com/callback`{{copy}}

URLを設定したら、「検証」ボタンを押して、「成功」とダイアログが表示されることを確認します。

![confirm-webhook](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/confirm-webhook.png)

検証できたら、「Webhookの利用」をオンにします。

![enable-webhook](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/enable-webhook.png)

## 応答メッセージを無効にする
Webhook設定の下に「LINE公式アカウント機能」ありますが、この中の「応答メッセージ」と「あいさつメッセージ」をそれぞれ無効にします。

右端の「編集」をクリックするとLINE Official Account Managerが開きます。

![line-official-account-setting](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/line-official-account-setting.png)

遷移先の「応答設定」にある「挨拶メッセージ」と「応答メッセージ」をそれぞれ「オフ」にします。

![reply-setting](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/reply-setting.png)


## 動作確認
これでLINE botが用意できました。最後に動作確認をしていきましょう。

botを友だち追加したら、トーク画面を開き、`メニュー`と入力してみます。

するとメニューの一覧が横並びに表示されます。

![bot-call-menu](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/bot-call-menu.jpg)

メニューの中の「Add Cart」ボタンをタップするとメニュー名がメッセージとして送信されます。

返信が来たら注文内容が追加された状態です。

![bot-order](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/bot-order.jpg)

何個か適当に注文したら、最後に`支払い`と入力してみます。

すると、「LINE Payでお支払い」ボタンが表示されるので、タップしてLINE Payの決済を始めます。

![bot-pay](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/bot-pay.jpg)

ボタンをクリックするとオートログインでそのまま決済画面が表示されます。

金額を確認して「PAY NOW」ボタンを押して決済を始めます。

![bot-pay-now](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/bot-pay-now.jpg)

しばらくすると、「決済が完了しました。」と表示されて決済が完了です。

![bot-pay-complete](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/bot-pay-complete.jpg)

Step1のときと同様に決済完了画面が表示されるのと同時にLINEレシートが送信されます。

レシートの品目には先程注文した商品とその価格が表示されていることが確認できます。

![bot-receipt](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/bot-receipt.jpg)

ちなみに支払い完了後に遷移されるURLはStep1で作成した`/confirm`と同じです。

![confirm-url](https://raw.githubusercontent.com/Miura55/katacoda-text/main/node-red-line-pay-tutorial/imgs/confirm-url.png)
