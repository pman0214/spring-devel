## 九大内で環境を構築する際の手順

- ダウンロード元のネットワーク負荷を軽減するため，プロキシサーバの設定を追加する．

- 基本的には`Setup.md`に書かれている手順と同様．
- 「環境構築」内の「レポジトリのclone」の作業を終えた後に以下を実行する．
	- 以下を実行後は「仮想マシンの起動と設定」へと手順を進める．

### Macの場合
- `spring-devel`ディレクトリ直下で以下のコマンドを実行する．

```
$ patch -p1 < kyudai.patch
```

### Windowsの場合
- `Vagrantfile`を開き，`# network`の部分に以下のように追記する．

```ruby
  #----------------------------------------------------------------------
  # network
  #----------------------------------------------------------------------
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://vmproxy.f.ait.kyushu-u.ac.jp:13128"
    config.proxy.https    = "https://vmproxy.f.ait.kyushu-u.ac.jp:13128"
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end
```