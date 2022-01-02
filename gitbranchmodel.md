- [git-flow cheatsheet](http://danielkummer.github.io/git-flow-cheatsheet/index.ja_JP.html)

## 【開発作業の流れ】
1. masterブランチからdevelopブランチを作成
2. developブランチから実装する機能毎にfeatureブランチを作成
3. featureブランチで実装完了した機能はdevelopブランチにマージ
4. リリース作業開始時点で、developからreleaseブランチを作成
5. リリース作業完了時点で、releaseからdevelop, masterブランチにマージ
## 【リリース後の障害対応の流れ】
1. masterブランチからhotfixブランチを作成
2. hotfixブランチで障害対応が完了した時点で、develop, masterブランチにマージ
## 【登場するブランチ】
- master:
    リリースした時点のソースコードを管理するブランチ

- develop (masterから派生):
    開発作業の主軸となるブランチ

- feature (developから派生):
    実装する機能毎のブランチ (feature/◯◯, feature/xxなど)

- release (developから派生):
    developでの開発作業完了後、リリース時の微調整を行うブランチ
    (バージョン番号の変更などで使用。)

- hotfix (masterから派生):
    リリースされた製品に致命的なバグ(クラッシュなど)があった場合に緊急対応をするためのブランチ
