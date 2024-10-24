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

#define NK_INCLUDE_FIXED_TYPES
#define NK_INCLUDE_STANDARD_IO
#define NK_INCLUDE_DEFAULT_ALLOCATOR
#define NK_INCLUDE_VERTEX_BUFFER_OUTPUT
#define NK_INCLUDE_FONT_BAKING
#define NK_INCLUDE_DEFAULT_FONT
#define NK_INCLUDE_STANDARD_VARARGS
#define NK_IMPLEMENTATION

#if defined(__clang__)
#pragma GCC diagnostic ignored "-Wunknown-warning-option"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wnull-pointer-subtraction"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#if defined(__GNUC__) && !defined(__clang__)
#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#endif
#if defined(_MSC_VER)
#pragma warning(disable:4996)   // sprintf,fopen,localtime: This function or variable may be unsafe
#endif
#include "nuklear.h"

#define SOKOL_NUKLEAR_IMPL
#include "sokol_nuklear.h"

nk_bool nk_tree_push(struct nk_context* ctx, enum nk_tree_type type, const char *title, enum nk_collapse_states initial_state) {
    return nk_tree_push_hashed(ctx, type, title, initial_state, NK_FILE_LINE, nk_strlen(NK_FILE_LINE), (int)(uintptr_t)title);
}

nk_bool nk_tree_push_id(struct nk_context* ctx, enum nk_tree_type type, const char *title, enum nk_collapse_states initial_state, int seed) {
    return nk_tree_push_hashed(ctx, type, title, initial_state, NK_FILE_LINE,nk_strlen(NK_FILE_LINE),seed);
}

nk_bool nk_tree_element_push(struct nk_context*ctx, enum nk_tree_type type, const char *title, enum nk_collapse_states initial_state, nk_bool *selected) {
    return nk_tree_element_push_hashed(ctx, type, title, initial_state, selected, NK_FILE_LINE,nk_strlen(NK_FILE_LINE),(int)(uintptr_t)title);
}

nk_bool nk_tree_element_push_id(struct nk_context*ctx, enum nk_tree_type type, const char *title, enum nk_collapse_states initial_state, nk_bool *selected, int seed) {
    return nk_tree_element_push_hashed(ctx, type, title, initial_state, selected, NK_FILE_LINE,nk_strlen(NK_FILE_LINE),seed);
}
