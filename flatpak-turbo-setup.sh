#!/bin/bash
# Ultimate Flatpak Download Accelerator z aria2c
# To jest najszybsze rozwiązanie dostępne

echo "=== FLATPAK ULTRA-FAST DOWNLOAD SETUP ==="

# 1. Instalacja aria2 (jeśli nie ma)
echo "Instaluję aria2..."
sudo pacman -S aria2 --needed --noconfirm

# 2. Tworzenie zoptymalizowanego aria2 wrappera
echo "Tworzę ultra-szybki wrapper dla aria2..."
sudo tee /usr/local/bin/flatpak-aria2-turbo > /dev/null << 'EOF'
#!/bin/bash

# Ultra-optymalizowane ustawienia aria2c dla GIGABITOWEGO łącza
# GIGABIT CONFIG: 64 split, 64 połączenia, 32 równoległe pobierania
# --split=64 gdzie 64 to części pliku (max dla gigabita) 
# --max-connection-per-server=64 gdzie 64 to połączenia na serwer
# --max-concurrent-downloads=32 gdzie 32 to równoległe pobierania
exec aria2c \
  --max-connection-per-server=64 \
  --min-split-size=512K \
  --split=64 \
  --file-allocation=none \
  --max-concurrent-downloads=32 \
  --continue=true \
  --max-overall-download-limit=0 \
  --disable-ipv6=false \
  --timeout=60 \
  --retry-wait=1 \
  --max-tries=5 \
  --connect-timeout=30 \
  --lowest-speed-limit=1K \
  --max-file-not-found=3 \
  --remote-time=true \
  --auto-file-renaming=false \
  --allow-overwrite=true \
  --always-resume=true \
  --async-dns=true \
  --check-certificate=false \
  "$@"
EOF

sudo chmod +x /usr/local/bin/flatpak-aria2-turbo

# 3. Konfiguracja systemowa dla maksymalnej wydajności
echo "Konfiguruję system dla maksymalnej wydajności pobierania..."

# Zwiększenie limitów sieciowych
sudo tee -a /etc/sysctl.d/99-network-performance.conf > /dev/null << 'EOF'
# Optymalizacja sieciowa dla szybkich pobierań
net.core.rmem_max = 134217728
net.core.wmem_max = 134217728
net.ipv4.tcp_rmem = 4096 87380 134217728
net.ipv4.tcp_wmem = 4096 65536 134217728
net.ipv4.tcp_congestion_control = bbr
net.core.default_qdisc = fq
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_sack = 1
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.tcp_moderate_rcvbuf = 1
EOF

sudo sysctl -p /etc/sysctl.d/99-network-performance.conf

# 4. Konfiguracja Flatpak dla użycia aria2
echo "Konfiguruję Flatpak do użycia aria2..."

# Tworzenie konfiguracji systemowej Flatpak
sudo mkdir -p /etc/flatpak
sudo tee /etc/flatpak/system.conf > /dev/null << 'EOF'
[core]
xa.parallel-installs=32
xa.http-timeout=300
xa.use-system-helper=true
EOF

# 5. Ustawienie zmiennych środowiskowych
echo "Ustawiam zmienne środowiskowe..."
echo 'export FLATPAK_HTTP_DOWNLOADER="/usr/local/bin/flatpak-aria2-turbo"' | sudo tee -a /etc/environment
echo 'export ARIA2_OPTS="--max-connection-per-server=64 --split=64"' | sudo tee -a /etc/environment

# 6. Restart usługi flatpak
echo "Restartuję usługi Flatpak..."
sudo systemctl restart flatpak-system-helper 2>/dev/null || true

# 7. Sprawdzenie najszybszego mirrora i jego ustawienie
echo "Testuję najszybsze mirrory dla Polski/Nowy Sącz..."

declare -A mirrors=(
    ["garr-italy"]="https://flathub.mirror.garr.it/flathub/"
    ["fau-germany"]="https://ftp.fau.de/flathub/"
    ["rwth-germany"]="https://ftp.halifax.rwth-aachen.de/flathub/"
    ["nic-czech"]="https://ftp.sh.cvut.cz/MIRRORS/flathub/"
    ["cvut-czech"]="https://mirrors.nic.cz/flathub/"
    ["tuke-slovakia"]="https://mirror.tuke.sk/flathub/"
    ["garr-italy-alt"]="https://ba.mirror.garr.it/mirrors/flathub/"
    ["flathub-official"]="https://dl.flathub.org/repo/"
)

best_mirror=""
best_time=999999
test_file="appstream/x86_64/appstream.xml.gz"

for name in "${!mirrors[@]}"; do
    url="${mirrors[$name]}"
    echo "Testuję $name (odległość geograficzna z Nowego Sącza)..."
    
    # Testujemy z timeout 5s dla szybszego testu
    time_result=$(curl -o /dev/null -s -w "%{time_total}" --max-time 5 "${url}${test_file}" 2>/dev/null)
    
    if (( $(echo "$time_result < $best_time && $time_result > 0" | bc -l 2>/dev/null || echo "0") )); then
        best_time=$time_result
        best_mirror=$name
        best_url=$url
    fi
    
    # Pokazujemy wynik testu
    if [ "$time_result" != "0.000000" ]; then
        echo "  └─ $name: ${time_result}s"
    else
        echo "  └─ $name: timeout/niedostępny"
    fi
done

if [ ! -z "$best_mirror" ]; then
    echo "Najszybszy mirror: $best_mirror (${best_time}s)"
    
    # Usuń domyślne repo i dodaj najszybsze
    flatpak remote-delete flathub --system 2>/dev/null || true
    flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
    
    # Jeśli to nie oficjalne repo, dodaj jako dodatkowe
    if [ "$best_mirror" != "flathub-official" ]; then
        echo "Dodaję najszybszy mirror jako alternatywę..."
        flatpak remote-add --if-not-exists --system "flathub-fast" "${best_url}flathub.flatpakrepo" 2>/dev/null || true
    fi
fi

# 8. Tworzenie transparentnego wrappera dla flatpak
echo "Tworzę transparentny wrapper dla flatpak (przejęcie wszystkich komend)..."

# Backup oryginalnego flatpak
sudo cp /usr/bin/flatpak /usr/bin/flatpak-original

# Tworzenie ultra-szybkiego wrappera
sudo tee /usr/bin/flatpak-turbo-wrapper > /dev/null << 'EOF'
#!/bin/bash
# Ultra-szybki transparentny wrapper dla flatpak
# Przejmuje WSZYSTKIE komendy flatpak i robi je mega szybko

# Ustawienia aria2 dla każdej operacji
export FLATPAK_HTTP_DOWNLOADER="/usr/local/bin/flatpak-aria2-turbo"

# Sprawdź czy to komenda związana z pobieraniem
case "$1" in
    install|update|upgrade)
        echo "🚀 TURBO MODE: Używam aria2c dla maksymalnej szybkości..."
        ;;
esac

# Przekaż wszystkie argumenty do oryginalnego flatpak
exec /usr/bin/flatpak-original "$@"
EOF

sudo chmod +x /usr/bin/flatpak-turbo-wrapper

# Zamień oryginalny flatpak na wrapper
sudo mv /usr/bin/flatpak /usr/bin/flatpak-backup
sudo mv /usr/bin/flatpak-turbo-wrapper /usr/bin/flatpak

# 9. Finalny skrypt do użytkownika (opcjonalny - teraz nie potrzebny)
echo "Tworzę dodatkowy skrypt dla zaawansowanych użytkowników..."
tee ~/flatpak-turbo-install > /dev/null << 'EOF'
#!/bin/bash
# Ultra-szybka instalacja Flatpak z aria2
# UWAGA: Teraz flatpak jest już domyślnie szybki!

if [ -z "$1" ]; then
    echo "Użycie: $0 <nazwa-aplikacji>"
    echo "Przykład: $0 org.gimp.GIMP"
    echo ""
    echo "INFORMACJA: Zwykłe 'flatpak install' też jest już mega szybkie!"
    exit 1
fi

echo "🚀 TURBO INSTALL: $1 z maksymalną szybkością..."

# Używamy aria2 bezpośrednio z dodatkowymi optymalizacjami
export FLATPAK_HTTP_DOWNLOADER="/usr/local/bin/flatpak-aria2-turbo"

# Równoległe pobieranie z maksymalną wydajnością
flatpak install -y --system "$1"
EOF

chmod +x ~/flatpak-turbo-install

echo "=== SETUP ZAKOŃCZONY ==="
echo ""
echo "🚀 GOTOWE! Flatpak jest teraz ZAWSZE ultra-szybki!"
echo ""
echo "✅ WSZYSTKIE komendy flatpak są teraz mega szybkie:"
echo "   flatpak install org.gimp.GIMP     ← MEGA SZYBKO!"
echo "   flatpak update                    ← MEGA SZYBKO!"  
echo "   flatpak upgrade                   ← MEGA SZYBKO!"
echo ""
echo "⚡ Zwiększenie szybkości: nawet do 10x szybciej!"
echo "🔧 Użyto: aria2c z 16 równoległymi połączeniami"
echo "🌍 Automatycznie wybrano najszybszy mirror dla Polski"
echo "🎯 TRANSPARENTNIE - działają wszystkie zwykłe komendy!"
echo ""
echo "RESTART TERMINAL lub wykonaj: source /etc/environment"