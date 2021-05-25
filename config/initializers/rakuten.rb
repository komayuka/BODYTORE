RakutenWebService.configure do |c|
  # (Required) Appliction ID for your application.
  c.application_id = '1080083902989563378'
  # (Optional) Affiliate ID for your Rakuten account.
  c.affiliate_id = '' # default: nil
  # (任意) リクエストのリトライ回数
  # 一定期間の間のリクエスト数が制限を超えた時、APIはリクエスト過多のエラーを返す。
  # その後、クライアントは少し間を空けた後に同じリクエストを再度送る。
  c.max_retries = 3 # default: 5
  # (任意) デバッグモード
  # trueの時、クライアントはすべてのHTTPリクエストとレスポンスを
  # 標準エラー出力に流す。
  c.debug = true # default: false
end
