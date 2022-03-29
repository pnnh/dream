#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct payload_t {
  const uint8_t *data;
  int len;
} payload_t;

int32_t post_image(const char *c_url, const struct payload_t *payload_ptr);
