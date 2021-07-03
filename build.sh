export LANG=en_US.UTF-8

if [ ! -f out/.config ]; then
    grep -v '_CLANG' arch/arm64/configs/syberia_defconfig > arch/arm64/configs/local_defconfig
    cat arch/arm64/configs/local_append >> arch/arm64/configs/local_defconfig
    make O=out mrproper
    make O=out local_defconfig
fi

if [ "x" != "x$1" ]; then
    make O=out "$@"
else
    make O=out -j33
fi
