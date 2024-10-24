#!/usr/bin/env bash

PLATFORM=$1

BASE_INCLUDE="-I./ -I/usr/include -L/usr/include -I/usr/local/include -I./util "
BASE_INLCUDE_LIB="-L/usr/local/include"

COMPILE_FLAGS="-lpthread -ldl -lm"

DEFS="-DSOKOL_GLCORE"

echo "Building for platform ${PLATFORM}"

if [ "${PLATFORM}" = "linux" ]; then
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-dll.c -o ./bin/sokol_dll.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-debug-dll.c -o ./bin/sokol_debug_dll.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-shape-dll.c -o ./bin/sokol_shape_dll.so ${COMPILE_FLAGS}
    gcc -c -I./lib/nuklear ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-nuklear-dll.c -o ./bin/sokol_nuklear_dll.so ${COMPILE_FLAGS}
    # gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-imgui-dll.c -o ./bin/sokol_imgui_dll.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/hmm-dll.c -o ./bin/hmm_dll.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} -DRMT_DLL lib/remotery/Remotery.c -o ./bin/remotery_dll.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/stb-dll.c -o ./bin/stb_dll.so ${COMPILE_FLAGS}
elif [ "${PLATFORM}" = "macosx" ]; then
DEFS="-DTARGET_OS_IPHONE -D__APPLE__ -DSOKOL_GLCORE"
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-dll.c -o ./bin/sokol_dll_macos.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-debug-dll.c -o ./bin/sokol_debug_dll_macos.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-shape-dll.c -o ./bin/sokol_shape_dll_macos.so ${COMPILE_FLAGS}
    gcc -c -I./lib/nuklear ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-nuklear-dll.c -o ./bin/sokol_nuklear_dll_macos.so ${COMPILE_FLAGS}
    # gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-imgui-dll.c -o ./bin/sokol_imgui_dll_macos.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/hmm-dll.c -o ./bin/hmm_dll_macos.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} -DRMT_DLL lib/remotery/Remotery.c -o ./bin/remotery_dll_macos.so ${COMPILE_FLAGS}
    gcc -c ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/stb-dll.c -o ./bin/stb_dll_macos.so ${COMPILE_FLAGS}
elif [ "${PLATFORM}" = "ios64" ]; then
DEFS="-D__APPLE__ -DSOKOL_GLCORE"
    g++ -c -xobjective-c++ ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-dll.c -o ./bin/sokol_dll_ios64.so ${COMPILE_FLAGS}
    g++ -c -xobjective-c++ ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-debug-dll.c -o ./bin/sokol_debug_dll_ios64.so ${COMPILE_FLAGS}
    g++ -c -xobjective-c++ ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-shape-dll.c -o ./bin/sokol_shape_dll_ios64.so ${COMPILE_FLAGS}
    g++ -c -xobjective-c++ -I./lib/nuklear ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-nuklear-dll.c -o ./bin/sokol_nuklear_dll_ios64.so ${COMPILE_FLAGS}
    # g++ -c -xobjective-c++ ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/sokol-imgui-dll.c -o ./bin/sokol_imgui_dll_ios64.so ${COMPILE_FLAGS}
    g++ -c -xobjective-c++ ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/hmm-dll.c -o ./bin/hmm_dll_ios64.so ${COMPILE_FLAGS}
    g++ -c -xobjective-c++ ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} -DRMT_DLL lib/remotery/Remotery.c -o ./bin/remotery_dll_ios64.so ${COMPILE_FLAGS}
    g++ -c -xobjective-c++ ${BASE_INCLUDE} ${BASE_INLCUDE_LIB} ${DEFS} lib/stb-dll.c -o ./bin/stb_dll_ios64.so ${COMPILE_FLAGS}
elif [ "${PLATFORM}" = "android" ]; then
    export PATH="android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH"
    export PATH="android-ndk/toolchains/llvm/prebuilt/linux-x86_64/:$PATH"
    
    aarch64-linux-android21-clang -c -I./ -D__ANDROID__ -DSOKOL_GLES3 -Iandroid-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include lib/sokol-dll.c -o ./bin/sokol_dll_aarch64.so -D__ANDROID__ -D__ANDROID_MIN_SDK_VERSION__=21 -lpthread -lm -fPIC -static
    rm sokol-dll.o
    armv7a-linux-androideabi19-clang -c -I./ -D__ANDROID__ -DSOKOL_GLES3 -Iandroid-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include lib/sokol-dll.c -o ./bin/sokol_dll_armv7.so -D__ANDROID__ -D__ANDROID_MIN_SDK_VERSION__=19 -lpthread -lm -fPIC -static
fi

