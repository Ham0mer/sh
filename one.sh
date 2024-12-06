#!/bin/bash

# 检查是否安装了 curl
if ! command -v curl &> /dev/null; then
    echo "curl 未安装，正在尝试安装 curl..."

    # 检测包管理器并安装 curl
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y curl
    elif command -v yum &> /dev/null; then
        sudo yum install -y curl
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y curl
    elif command -v pacman &> /dev/null; then
        sudo pacman -Sy curl
    else
        echo "无法检测到支持的包管理器，请手动安装 curl。"
        exit 1
    fi
fi

echo "请选择要执行的操作:"
echo "1) 融合怪"
echo "2) 流媒体解锁"
echo "3) 三网回程路由"
echo "4) 3x-ui"
echo "5) 安装 1Panel"
echo "6) 全部执行"
read -p "输入选项 (1-6): " option

case $option in
    1)
        # 下载并执行融合怪脚本
        curl -L https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh -o ecs.sh && chmod +x ecs.sh && bash ecs.sh
        ;;
    2)
        # 执行流媒体解锁脚本
        bash <(curl -sL IP.Check.Place)
        ;;
    3)
        # 执行三网回程路由脚本
        curl https://raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh
        ;;
    4)
        # 执行 3x-ui 脚本
        bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
        ;;
    5)
        # 安装 1Panel
        if command -v apt-get &> /dev/null; then
            curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sudo bash quick_start.sh
        elif command -v yum &> /dev/null || command -v dnf &> /dev/null; then
            curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
        elif command -v pacman &> /dev/null; then
            curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh
        else
            # openEuler / 其他
            echo "安装 Docker"
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
            echo "安装 1Panel"
            curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
        fi
        ;;
    6)
        # 全部执行
        curl -L https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh -o ecs.sh && chmod +x ecs.sh && bash ecs.sh
        bash <(curl -sL IP.Check.Place)
        curl https://raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh
        bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
        if command -v apt-get &> /dev/null; then
            curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sudo bash quick_start.sh
        elif command -v yum &> /dev/null || command -v dnf &> /dev/null; then
            curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
        elif command -v pacman &> /dev/null; then
            curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh
        else
            # openEuler / 其他
            echo "安装 Docker"
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
            echo "安装 1Panel"
            curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
        fi
        ;;
    *)
        echo "无效选项"
        ;;
esac
