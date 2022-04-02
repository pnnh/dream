//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <pillow/pillow_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) pillow_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PillowPlugin");
  pillow_plugin_register_with_registrar(pillow_registrar);
}
