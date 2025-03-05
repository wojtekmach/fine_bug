# App

```sh
$ mix deps.get && mix test
```

errors:

```
==> fine1
mkdir -p priv
clang++ -std=c++17 -fPIC -I/Users/wojtek/.local/share/mise/installs/erlang/27.2.2/usr/include -I/Users/wojtek/bug/fine_bug/deps/fine/include -dynamiclib -undefined dynamic_lookup -o priv/fine1.so c_src/fine1.cpp
Compiling 1 file (.ex)
Generated fine1 app
==> fine2
mkdir -p priv
clang++ -std=c++17 -fPIC -I/Users/wojtek/.local/share/mise/installs/erlang/27.2.2/usr/include -I/Users/wojtek/bug/fine_bug/deps/fine/include -dynamiclib -undefined dynamic_lookup -o priv/fine2.so c_src/fine2.cpp
Compiling 1 file (.ex)

09:55:00.359 [warning] The on_load function for module Elixir.Fine2 returned:
{:error, {:bad_lib, ~c"Function not found 'Elixir.Fine2':fine1_add/2"}}

Generated fine2 app
==> app
Compiling 1 file (.ex)
Generated app app
Running ExUnit with seed: 475542, max_cases: 16


09:55:00.495 [warning] The on_load function for module Elixir.Fine2 returned:
{:error, {:bad_lib, ~c"Function not found 'Elixir.Fine2':fine1_add/2"}}


09:55:00.505 [warning] The on_load function for module Elixir.Fine2 returned:
{:error, {:bad_lib, ~c"Function not found 'Elixir.Fine2':fine1_add/2"}}



  1) test fine2 (AppTest)
     test/app_test.exs:8
     ** (UndefinedFunctionError) function Fine2.fine2_add/2 is undefined (module Fine2 is not available). Make sure the module name is correct and has been specified in full (or that an alias has been defined)
     code: assert Fine2.fine2_add(1, 2) == 3
     stacktrace:
       (fine2 0.1.0) Fine2.fine2_add(1, 2)
       test/app_test.exs:9: (test)

.
Finished in 0.01 seconds (0.00s async, 0.01s sync)
2 tests, 1 failure
```

Note:

```
{:error, {:bad_lib, ~c"Function not found 'Elixir.Fine2':fine1_add/2"}}
                                                      ^      ^
```

Commenting out fine1 `@on_load`:

```diff
--- a/fine1/lib/fine1.ex
+++ b/fine1/lib/fine1.ex
@@ -1,5 +1,5 @@
 defmodule Fine1 do
-  @on_load :load_nif
+  # @on_load :load_nif

   defp load_nif do
     :erlang.load_nif(~c"#{__DIR__}/../priv/fine1", 0)
```

makes fine2 succeed:

```
==> app
Running ExUnit with seed: 564530, max_cases: 16



  1) test fine1 (AppTest)
     test/app_test.exs:4
     ** (ErlangError) Erlang error: "nif not loaded"
     code: assert Fine1.fine1_add(1, 2) == 3
     stacktrace:
       :erlang.nif_error("nif not loaded")
       (fine1 0.1.0) lib/fine1.ex:9: Fine1.fine1_add/2
       test/app_test.exs:5: (test)

.
Finished in 0.01 seconds (0.00s async, 0.01s sync)
2 tests, 1 failure
```
