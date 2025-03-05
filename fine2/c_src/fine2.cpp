#include <fine.hpp>

int64_t fine2_add(ErlNifEnv *env, int64_t x, int64_t y) {
  return x + y;
}

FINE_NIF(fine2_add, 0);

FINE_INIT("Elixir.Fine2");
