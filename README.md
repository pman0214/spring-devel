# Spring Framework Javaアプリ開発環境

- このレポジトリにはSpring Frameworkを使用したJavaアプリを開発するLinux環境を提供するためのVagrant関連ファイルが格納されています
- Vagrantを使用して半自動的に環境を構築できます

## 環境の概要
- OS
	- Debian GNU/Linux (jessie alpha1 release)
- ハードウェア関連
	- Architecture	- x86_64
	- Number of CPU cores	- 2
	- Memory	- 4096MB
- 導入済み主要ソフト
	- git (debian package)
	- java (oracle jdk7)
	- maven (3.1.1)
	- tomcat (debian package)
	- eclipse (4.3 kepler)
		- plugins - egit, m2e, spring tool suite
	- mosquitto (debian package)
		- server, client, and libraries as well as development header files
- ホストへのPort forwarding
	- SSH - guest:22 -> host:2222
	- Tomcat - guest:8080 -> host:8080
	- Mosquitto - guest:1883 -> host:1883

## 環境構築手順
- `doc/Setup.md`参照


## Copyright, License
- Copyright (c) 2014, Shigemi ISHIDA
- This software is released under the BSD 3-clause license: See `LICENSE`.