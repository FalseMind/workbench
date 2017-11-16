Plug is a specification for composable modules in between web applications.
It is also an abstraction layer for connection adapters of different web servers.
The basic idea of Plug is to unify the concept of a “connection” that we operate on.
This differs from other HTTP middleware layers such as Rack, where the request and
response are separated in the middleware stack.

两种类型的Plug
函数的Plug
函数Plug是一个接受%Plug.Conn和一个选项列表作为参数, 并返回一个%Plug.Conn的函数, 例如：
def my_plug(conn, opts) do
  conn
end
模块的Plug
模块Plug是一个实现了init/1, 和run/2函数的模块:
module MyPlug do
  def init(opts) do
    opts
  end
  def call(conn, opts) do
    conn
  end
end
模块Plug有一个特点是: init/1在编译时运行, run/2在运行时运行. 由init/1返回的值会被传递给run/2
因此尽量吧繁重的工作安排到init/1去执行对Plug的性能有非常大的提升

在Phoenix中, 可以使用管道pipeline把多个Plug组合到一起
比如:
针对浏览器的管道(输出HTML):
pipeline :browser do
  plug :accepts, ["html"]
  plug :fetch_session
  plug :fetch_flash
  plug :protect_from_forgery
  plug :put_secure_browser_headers
end
针对API接口的管道(输出JSON)
pipeline :api do
  plug :accepts, ["json"]
end



可用的Plugs
Plug.CSRFProtection 添加跨站点请求保护, 如果要使用Plug.Session,这个是必须的;
Plug.Head 把HEAD请求转换为GET请求;
Plug.Logger 记录请求;
Plug.MethodOverride 重写指定在请求头中指定的方法;
Plug.Parsers  根据Content-Type负责解析请求体;
Plug.RequestId  设置一个请求ID, 用在日志中;
Plug.Session  处理会话管理和存储;
Plug.SSL  强制请求通过SSL;
Plug.Static 处理静态文件;
Plug.Debugger 调试页面
Plug.ErrorHandler 允许开发者定制错误页面, 而不是发送一个空页面
