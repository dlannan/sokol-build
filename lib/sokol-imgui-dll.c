#define SOKOL_IMPL
#define SOKOL_DLL
#define SOKOL_NO_ENTRY

/* sokol 3D-API defines are provided by build options */
#include "sokol_app.h"
#include "sokol_gfx.h"
#include "sokol_time.h"
#include "sokol_audio.h"
#include "sokol_fetch.h"
#include "sokol_log.h"
#include "sokol_glue.h"

#define CIMGUI_DEFINE_ENUMS_AND_STRUCTS
#include "cimgui.h"

#define SOKOL_IMGUI_IMPL
#include "sokol_imgui.h"

