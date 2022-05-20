# selphi_cms基于selphi技术栈的starter项目

## 1. 简介

selphi的是一套技术栈的缩写。

- **s** 代表[surface](https://github.com/surface-ui/surface)，一个基于liveview的服务端spa组件库
- **e** 代表elixir，
- **l** 代表[liveview](https://hexdocs.pm/phoenix_live_view/) ，
- **phi** 代表phoenix框架

组件的样式使用 [daisyUI](https://daisyui.com/)。daisyUI是一个基于[Tailwind Css](https://tailwindcss.com/docs/installation) 的css框架。

[Selphi_daisy](https://github.com/wang-qt/selphi_daisy) 是一个**服务端渲染**组件库，允许开发者以极高的效率开发类似spa效果的应用，而只需要写极少的js。

[Selphi_dynatable](https://github.com/wang-qt/selphi_dynatable)是一个**动态表格组件**，依赖 [selphi_daisy](https://github.com/wang-qt/selphi_daisy)组件库。Selphi_dynatable提供了表格常用功能，简化表格开发难度。

selphi_csm是一个使用selphi技术栈，selphi_daisy, selphi_dynatable的starter项目，目的是简化用户配置工作，提供一个开箱即用的selphi开发环境。

## 2. 特性

后端主要依赖

- phoenix_live_view

- surface
- surface_catalogue
- surface_markdown
- selphi_daisy
- selphi_dynatable

前端主要依赖

- tailwindcss3
- daisyui2.14
- 样式使用sass
- 打包使用webpack和postcss

## 3. 使用

**开发环境需要erlang和elixir正确安装**！！

### 3.1 下载

使用 ``git clone https://github.com/wang-qt/selphi_cms.git`` 或下载zip文件。

进入安装目录

```
cs  selphi_cms

```

### 3.2 修改config/dev.exs

项目默认使用**postgreql数据库**，确保pgsql能正常工作

```
# Configure your database
config :selphi_cms, SelphiCms.Repo,
  username:  "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "selphi_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```

参数修改为和环境一致。

### 3.3 安装后端依赖

```shell
cs  selphi_cms
>  mix deps.get
```

### 3.4 安装前端依赖

```
cd assets 
> npm install
```



###  3.5 发布依赖资源

```shell
cd selphi_cms
# 发布 surface_catalogue资源
> mix assets.catalogue

# 发布 selphi_daisy 资源
> mix assets.selphi.daisy
```



### 3.6   migration

```shell
cd selphi_cms

# 创建数据库，运行migration，运行 seed.exs
> mix ecto.setup

```



### 3.7 启动

如果上述步骤一切正常，启动项目

```shell
cd selphi_cms

> iex -S mix phx.server


```

### 3.8 访问页面

- http://localhost:4000/catalogue   selphi_daisy组件库文档和示例
- http://localhost:4000/posts          mvc页面嵌入liveview
- http://localhost:4000/live-posts  直接使用live 路由



