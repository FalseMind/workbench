=== Ecto.Query
Queries are used to retrieve and manipulate data from a repository (see Ecto.Repo).
# Imports only from/2 of Ecto.Query
import Ecto.Query, only: [from: 2]
# Create a query
query = from u in "users", where: u.age > 18, select: u.name
# Send the query to the repository then we are directly querying the “users” table from the database.
Repo.all(query)

# Ecto queries are composable.
# Create a query
query = from u in User, where: u.age > 18
# Extend the query
query = from u in query, select: u.name
# When using joins, the bindings should be matched in the order they are specified:
# Create a query
query = from p in Post, join: c in Comment, where: c.post_id == p.id
# Extend the query
query = from [p, c] in query, select: {p.title, c.body}
# The example will fetch all posts from the database and then do a separate
# query returning all comments associated with the given posts
Repo.all from p in Post, preload: [:comments]

=== Ecto.Repo
# A repository maps to an underlying data store, When used, the repository expects
# the :otp_app as option. The :otp_app should point to an OTP application that has
# the repository configuration.
defmodule Repo do
  use Ecto.Repo, otp_app: :my_app
end
def list_posts(author, %{date: date}) do
  from(t in Content.Post,
       where: t.author_id == ^author.id,
       where: fragment("date_trunc('day', ?)", t.published_at) == type(^date, :date))
       # Fetches all entries from the data store matching the given query.
       |> Repo.all
end
def create_post(user, attrs) do
  user
  |> Ecto.build_assoc(:posts, attrs)
  # Ecto.Repo insert/2
  # Inserts a struct defined via Ecto.Schema or a changeset.
  |> Repo.insert
end
