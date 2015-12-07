# 本地Maven编译环境

## 环境准备

1. 准备Maven仓库文件夹，每次编译使用现有的仓库，加快编译速度
* 准备工作工作文件夹，编译时在工作文件夹执行mvn package

## 执行

1. 添加host：`--add-host maven.111.com:10.6.80.65`
* 设置Volumn: `-v "/app/maven:/maven" -v "/app/user/zhangpeihao:/workspace"`


