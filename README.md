## Инсталл ноды
- скачать и заинсталить gaia
        
        git clone -b v6.0.4 https://github.com/cosmos/gaia && cd gaia && make install
- скачать скачать cosmoshub-4 genesis, распаковать переименовать в `genesis.json`, положить в `~/.gaia/config`
        
        wget https://github.com/cosmos/mainnet/raw/master/genesis.cosmoshub-4.json.gz
        gzip -d genesis.cosmoshub-4.json.gz
        mv genesis.cosmoshub-4.json ~/.gaia/config/genesis.json
- скачать дамп [cosmos](https://dl2.quicksync.io/cosmoshub-4-pruned.20220401.0310.tar.lz4) на https://quicksync.io/networks/cosmos.html 
    и положить в `~/.gaia/data`
## Запуск ноды
    gaiad start --x-crisis-skip-assert-invariants --home {путь до .gaia}

## Настройки ноды
    настройки можно изменить в файлах config.toml и app.toml
    данные файлы должны лежать в `~/.gaia/config` или поменять путь 
    запустив ноду с флагом --home {путь до конфига (по умолчанию ~/.gaia)} 