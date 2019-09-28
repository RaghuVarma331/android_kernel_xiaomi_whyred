#!/bin/bash

echo "--------------------------------------------"
echo "Kernel Source For Redmi Note 5 Pro"
echo "Lets Compile kernel sit Back Have A coffee "
echo "--------------------------------------------"

cd
git clone https://github.com/RaghuVarma331/aarch64-linux-android-4.9.git -b master aarch64-linux-android-4.9
git clone https://github.com/RaghuVarma331/clang-r365631c-9.0.8.git -b master clang
git clone https://github.com/RaghuVarma331/arm-linux-androideabi-4.9.git arm-linux-androideabi-4.9
mkdir kiwis-kernel
cd Kernel
clear
export CROSS_COMPILE_ARM32=/root/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
make O=out ARCH=arm64 whyred_defconfig
PATH="/root/clang/bin:/root/aarch64-linux-android-4.9/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-

cp -r out/arch/arm64/boot/Image.gz-dtb /root/Kernel/whyred
cd whyred
zip -r Kiwis-kernel-9.0-whyred-$(date +"%Y%m%d")-$(date +"%H%M").zip META-INF patch tools Image.gz-dtb anykernel.sh   
cp -r Kiwis-kernel-9.0-whyred-$(date +"%Y%m%d")-$(date +"%H%M").zip /root/kiwis-kernel
cd

echo "--------------------------------------------"
echo "All Right now flash at your own risk"
echo "Flashable Zip located in kiwis-kernel Folder"
echo "Good Bye ..!! @ RaghuVarma "
echo "--------------------------------------------"
