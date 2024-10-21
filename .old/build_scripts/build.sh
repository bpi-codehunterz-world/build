#!/bin/bash
# build.sh

echo -e "Armbian-Build > Builing CodeHunterz.World Customized-Armbian Image!... .. ."



build_full() {
    echo -e "Armbian-Build > Buidling Full-Image!"
    ./compile.sh BOARD="bananapim2ultra" BRANCH="current" RELEASE="noble" BUILD_MINIMAL="yes" BUILD_DESKTOP="yes" KERNEL="yes" KERNEL_CONFIGURE="no"
}

build_full2() {
    echo -e "Armbian-Build > Buidling Full-Image!"
    ./compile.sh BOARD="bananapim2ultra" BRANCH="current" RELEASE="noble" BUILD_MINIMAL="yes" BUILD_DESKTOP="yes" KERNEL="no" KERNEL_CONFIGURE="no"
}

build_minimal() {
    echo -e "Armbian-Build > Buidling Full-Image!"
    ./compile.sh BOARD="bananapim2ultra" BRANCH="current" RELEASE="noble" BUILD_MINIMAL="yes" BUILD_DESKTOP="no" KERNEL="yes" KERNEL_CONFIGURE="no"
}

build_minimal2() {
    echo -e "Armbian-Build > Buidling Full-Image!"
    ./compile.sh BOARD="bananapim2ultra" BRANCH="current" RELEASE="noble" BUILD_MINIMAL="yes" BUILD_DESKTOP="no" KERNEL="no" KERNEL_CONFIGURE="no"
}
build_standard_console() {
    echo -e "Armbian-Build > Buidling Full-Image!"
    ./compile.sh BOARD="bananapim2ultra" BRANCH="current" RELEASE="noble" BUILD_MINIMAL="no" BUILD_DESKTOP="no" KERNEL="yes" KERNEL_CONFIGURE="no"
}

build_standard_console2() {
    echo -e "Armbian-Build > Buidling Full-Image!"
    ./compile.sh BOARD="bananapim2ultra" BRANCH="current" RELEASE="noble" BUILD_MINIMAL="no" BUILD_DESKTOP="no" KERNEL="no" KERNEL_CONFIGURE="no"
}



build_docker_by_conf() {
    echo -e "Armbian-Build > Building Armbian by Docker + Conf !... .. ."
    cd userpatshces
    ls -l *.conf
    read -p "Config > " config
    ./compile.sh docker $config

}

docker_build_armbian() {
    echo -e "Armbian-Build > Building Armbian by Docker!... .. ."
    
    read -p "Board > " board
    read -p "Kernek-Only > " kernel
    read -p "Branch > " branch
    read -p "Kernel-Configure > " yn

    ./compile.sh docker KERNEL_ONLY=$kernel BOARD=$board BRANCH=$branch KERNEL_CONFIGURE=$yn


}

docker_build_console() {
    echo -e "Armbian-Build > Building Armbian by Docker!... .. ."
    read -p "Borad > " board
    read -p "Branch > " branch
    read -p "Release > " release
    ./compile.sh docker-shell BOARD=$board BRANCH=$branch RELEASE=$release
}


docker_build() {
    while true;
    do 
    echo "========================================================================"
    echo "== Armbian Builder | Menu   | v0.1        | (C)odehunterz.world       =="
    echo "========================================================================"    
    echo "== 1: Docker Build    | 2: Docker Build   || 3: Docker Build by Conf  =="
    echo "========================================================================"
    echo "==                     m|M = Main-Menu                                =="
    echo "========================================================================"

    read -p "Choice > " x
    case $x in
            1) docker_build_console; continue;;
            2) docker_build_armbian; continue;;
            3) build_docker_by_conf; continue;;
             *) echo -e "Invalid!"; main;
    esac
    done

}

main() {
    while true;
    do

    echo "========================================================================"
    echo "== Armbian Builder | Menu   | v0.1        | (C)odehunterz.world       =="
    echo "========================================================================" 
    echo "== 1: Full Desktop    | 2: Full Desktop   || 3: Minimal  | 4: Minimal =="
    echo "== 5: Console         | 6: Console        || 7: Docker Build Menu     =="
    echo "== 11: Publish Images || 12: Start Action || 13: Push Repository      =="
    echo "========================================================================"
    echo "==                       q|Q = Quit                                   =="
    echo "========================================================================"

    read -p "Armbian-Build > " choice
    case $choice in
            1) build_full; continue;;
            2) build_full2; continue;;
            3) build_minimal; continue;;
            4) build_minimal2; continue;;
            5) build_standard_console; continue;;
            6) build_standard_console2; continue;;
            q|Q) break; exit;;
            *) echo "invalid"; continue;;
            esac
            done




}
echo 

main;

#./compile.sh BOARD="bananapim2ultra" BRANCH="current" RELEASE="noble" BUILD_MINIMAL="yes" BUILD_DESKTOP="yes" KERNEL="no" KERNEL_CONFIGURE="no"