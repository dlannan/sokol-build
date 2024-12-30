#define SOKOL_IMPL
#define SOKOL_DLL
#define SOKOL_NO_ENTRY

/* sokol 3D-API defines are provided by build options */
#define SOKOL_GP_IMPL
#define FONTSTASH_IMPLEMENTATION

#include "sokol_app.h"
#include "sokol_gfx.h"

#include "util/sokol_gl.h"
#include "lib/fontstash/fontstash.h"
#include "util/sokol_fontstash.h"
#include "sokol_gp.h"

#include "sokol_time.h"
#include "sokol_audio.h"
#include "sokol_fetch.h"
#include "sokol_log.h"
#include "sokol_glue.h"

