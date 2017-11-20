# An anonymous function is created using the fn keyword.
fn
  parameter-list -> body
  parameter-list -> body ...
end

# At its simplest, a function has a parameter list and a body, separated by ->.
iex> sum = fn (a, b) -> a + b end
iex> f1 = fn a, b -> a * b end
iex> f2 = fn -> 99 end

# The do...end block is one way of grouping expressions and passing them to other code.
# They are used in module and named function definitions, control structures...any place
# in Elixir where code needs to be handled as an entity.
defmodule Times do
  def double(n) do
    n*2
  end
end
# However, do...end is not actually the underlying syntax. The actual syntax looks like this:
def double(n), do: n * 2

# guard clauses are predicates that are attached to a function definition using one or more when keywords.
defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts "#{x} is a number" end
  def what_is(x) when is_list(x) do IO.puts "#{inspect(x)} is a list"
  end
  def what_is(x) when is_atom(x) do
    IO.puts "#{x} is an atom"
  end
end
Guard.what_is(99) # => 99 is a number
Guard.what_is(:cat) # => cat is an atom
Guard.what_is([1,2,3]) # => [1,2,3] is a list

# When you define a named function, you can give a default value to any of its
# parameters by using the syntax param \\ value.
defmodule Example do
def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
end end
Example.func("a", "b") # => ["a",2,3,"b"]
Example.func("a", "b", "c") # => ["a","b",3,"c"]
Example.func("a", "b", "c", "d") # => ["a","b","c","d"]
