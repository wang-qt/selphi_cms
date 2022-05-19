
# 当前路径为执行 mix 命令的路径
{:ok, cwd} = File.cwd()

IO.puts "发布 css 资源 \n"
IO.puts "当前路径: #{cwd}"

# umbrella
#src_path  = Path.expand("../selphi_daisy/assets/css")

# gitee
src_path  = Path.expand("deps/selphi_daisy/assets/css")
dest_path = Path.expand("assets/css")

IO.puts "源路径: \n #{src_path}"
IO.puts "目标路径:  \n #{dest_path}"

# 目录拷贝 selphi_daisy 的 scss 文件到 selphi_cms_web 的 css路径
{:ok, files_and_directories} =
  File.cp_r(src_path,dest_path, fn source,destination ->
     IO.gets("Overwriting #{destination} \n by #{source}. \n Type y to confirm. ") == "y\n"
  end )

IO.puts "替换文件，files_and_directories: #{inspect files_and_directories} \n"
IO.puts "拷贝完成，请手动修改app.scss 添加新scss文件的引用！ \n\n\n"

# 拷贝完成， 修改app.scss 添加 新 scss文件的引用！！

#######################################################
IO.puts "发布 js 资源 \n"
IO.puts "当前路径: #{cwd}"

# umbrella
#src_path  = Path.expand("../selphi_daisy/assets/js")

# gitee
src_path  = Path.expand("deps/selphi_daisy/assets/js")
dest_path = Path.expand("assets/js")

IO.puts "源路径: \n #{src_path}"
IO.puts "目标路径:  \n #{dest_path}"

# 目录拷贝 selphi_daisy 的 js 文件到 selphi_cms_web 的 js 路径
{:ok, files_and_directories} =
  File.cp_r(src_path,dest_path, fn source,destination ->
    IO.gets("Overwriting #{destination} \n by #{source}. \n Type y to confirm. ") == "y\n"
  end )

IO.puts "替换文件，files_and_directories: #{inspect files_and_directories} \n"
IO.puts "拷贝 js 完成，请手动修改 app.js 添加新js文件的引用！  \n\n\n"


#######################################################
IO.puts "发布 icon 资源 \n"

# umbrella
#src_path  = Path.expand("../selphi_daisy/assets/icons")

# gitee
src_path  = Path.expand("deps/selphi_daisy/assets/icons")
dest_path = Path.expand("assets/static/icons")

IO.puts "源路径: \n #{src_path}"
IO.puts "目标路径:  \n #{dest_path}"
# 目录拷贝 selphi_daisy 的 icons 文件到 selphi_cms_web 的 static/icons 路径
{:ok, files_and_directories} =
  File.cp_r(src_path,dest_path, fn source,destination ->
    IO.gets("Overwriting #{destination} \n by #{source}. \n Type y to confirm. ") == "y\n"
  end )

IO.puts "替换文件，files_and_directories: #{inspect files_and_directories} \n"
IO.puts "拷贝icons完成!!! \n\n\n"
