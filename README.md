# tech_uloha

    Úloha. Vyrobiť zálohovací skript:
        1. Skript bude napísaný v bash-y
        2. Skript bude spustený z plánovača v danom OS (crontab) = 1x denne
        3. Skript bude zálohovať súbory a celé zložky. Definícia týchto suborov bude v samostatnom konfiguračnom súbore.
        4. Skript nasledne vyrobi komprimovaný archív s dennym timestampom v nazve suboru. Napr backup_20211222.tar.gz
        5. Skript bude ukladať tuto zálohu na definované miesto. Napr /var/backup
        6. Skript bude automaticky po spustení mazať staršie zálohy ako X. Napr 3 dni.
        7. Skript skopiruje tuto zalohu na vzdialeny/iný server pomocou rsync s využitím ssh klucov pri prihlasovaní.
        8. Bonus -  Skript bude zálohovať databázu ktorá je nahraná na servery kde beží skript. Napr mysql/mariadb/postgresql. Zaloha celej databázy - všetky tabulky, funkcie atd tzv db dump.
    Výskumná úloha.
        Preskúmať ako funguje Amazon AWS airflow
        Čo to je?
        Na čo by sa to dalo použiť?
        Spraviť si poznamky a potom nám to so Sevom za 10min odprezentovať
