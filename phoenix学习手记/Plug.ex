Plug is a specification for composable modules in between web applications.
It is also an abstraction layer for connection adapters of different web servers.
The basic idea of Plug is to unify the concept of a “connection” that we operate on.
This differs from other HTTP middleware layers such as Rack, where the request and
response are separated in the middleware stack.

### Function Plugs
# In order to act as a plug, a function simply needs to accept a connection struct
# (%Plug.Conn{}) and options. It also needs to return a connection struct. Any
# function that meets those criteria will do. Here’s an example.
def put_headers(conn, key_values) do
  Enum.reduce key_values, conn, fn {k, v}, conn ->
    Plug.Conn.put_resp_header(conn, to_string(k), v)
  end
end
