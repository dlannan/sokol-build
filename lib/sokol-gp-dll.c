#define SOKOL_IMPL
#define SOKOL_DLL
#define SOKOL_NO_ENTRY

// Includes Sokol GFX, Sokol GP and Sokol APP, doing all implementations.
#define SOKOL_GP_IMPL
#define FONTSTASH_IMPLEMENTATION

#include "sokol_gfx.h"

#include "util/sokol_gl.h"
#include "lib/fontstash/fontstash.h"
#include "util/sokol_fontstash.h"
#include "sokol_gp.h"

#include "sokol_app.h"
#include "sokol_glue.h"
#include "sokol_log.h"

