#if defined(_WINDLL) 
#define CGLTF_EXPORT __declspec(dllexport)
#else
#define CGLTF_EXPORT extern
#endif

/* Expose api for use by external */
#include "cgltf/cgltf.h"
#include "cgltf/cgltf_write.h"

/* cgltf files to make a simple cgltf lib */
#define CGLTF_IMPLEMENTATION
#include "cgltf/cgltf.h"

#define CGLTF_WRITE_IMPLEMENTATION
#include "cgltf/cgltf_write.h"
