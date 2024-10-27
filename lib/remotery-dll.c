#include <stdlib.h>
#include <math.h>
#include <signal.h>
#include <stdio.h>

#define RMT_USE_OPENGL      1
#define RMT_DLL             1
#define RMT_IMPL

#include "remotery/Remotery.h"

#if defined(__cplusplus)
extern "C" {
#endif

RMT_API void * CreateGlobalInstance() {

    Remotery *rmt = malloc( sizeof(Remotery*) );
    rmtError error;
    error = rmt_CreateGlobalInstance(&rmt);
    return rmt;
}

RMT_API void DestroyGlobalInstance(void *rmt) {

    rmt_DestroyGlobalInstance(rmt);
}

RMT_API void SetGlobalInstance(void *rmt) {

    rmt_SetGlobalInstance(rmt);
}

RMT_API void * GetGlobalInstance() {

    return (void *)rmt_GetGlobalInstance();
}

#if defined(__cplusplus)
}
#endif
