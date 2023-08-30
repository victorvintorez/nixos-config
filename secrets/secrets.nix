let
  victorvintorez = "";
  users = [ victorvintorez ];

  test = "";
  systems = [ test ];
in
{
  "github-token.age".publicKeys = users ++ systems;
}
