### Alma Linux 9 + GNOME (Container)

Alma Linux 9 + GUI(GNOME) のDockerコンテナです。
RDP接続でGUIにアクセスできます。
最小限のパッケージしかインストールしてないのでどこまでできるかは分かりませんが、とりあえず表示できました。

1. イメージをビルド 
```
docker build -t al9gnome .
```

2. 以下のどちらかを実行 必要に応じてポート番号などオプションを変更してください。  
privilegedオプションが有効になっているので取り扱いには注意してください。
```
# 起動のみ 
docker run -d -p 13389:3389 --privileged --name al9gnome al9gnome /sbin/init

# ホームディレクトリを永続化
docker run -d -p 13389:3389 -v ./data:/home/abc --privileged --name al9gnome al9gnome /sbin/init
```

3. xrdpを開始
```
docker exec al9gnome systemctl start xrdp
```

4. Microsoft Remote Desktop で接続 
```
rdp://localhost:13380
```
