{config, pkgs, ...};

{
    nixpkgs.config.allowUnfree = true;
}

boot.loader.grub.device = "/dev/sda";
boot.loader.grub.enable = true;

networking.hostName = "nixos";
networking.wireless.enable = true;
networking.networkmanager.enable = true;

services.openssh.enable = true;

time.timeZone = "Europe/London";

i18n.defaultLocale = "en_GB.UTF-8";
console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
};

services.xserver.displayManager.lightdm.enable = true;
services.xserver.desktopManager.xfce.enable = true;
services.xserver.windowManager.xfce.enable = true;
services.xserver.videoDrivers = [ "nvidia" ];

service.picom.enable = true;
sound.enable = true;
hardware.pulseaudio.enable = true;

users.users.root = {
    isNormalUser = false;
    extraGroups = [ "wheel" ];
};

users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "kvm" "libvirtd" ];
}

enviroment.systemPackages = with pkgs; {
    vim
    git
    firefox
    thunderbird
    neovim
    htop
    neofetch
    cargo
    python3
    python3Packages.pip
    python3Packages.virtualenv
    python3Packages.virtualenvwrapper
    python3Packages.pynvim
    python3Packages.pandas
    python3Packages.numpy
    python3Packages.scipy
    python3Packages.matplotlib
    python3Packages.jupyterlab
    php
    phpPackages.composer
    phpPackages.phpunit
    phpPackages.phpcs
    php-cli
    golang
    nodejs
    npm
    yarn
    docker
    docker-compose
    kubectl
    kubectx
    kubeseal
    kustomize
    k9s
    openlens
    gitkraken
    slack-desktop
    discord
    microsoft-teams
    powershell
    openssl
    openssh
    curl
    wget
    jq
}

fonts = {
    fonts = with pkgs;
    font-awesome
}

fonts.fontconfig = {
    enable = true;
    enableAutoHinting = true;
    enableBitmaps = true;
    enableFontDir = true;
    defaultFonts = [
        fonts.fonts.font-awesome
    ];
}

system.copySystemConfiguration = true;
system.autoUpgrade.enable = true;
system.autoUpgrade.channel = "unstable";
systrem.autoUpgrade.allowReboot = true;
system.stateVersion = "22.11";

