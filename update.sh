#!/bin/bash
REPO="Em4nnn/em4nhackui"   # senin repo
LOCAL_VERSION="v1.0.0"     # şu anki sürüm

echo "🔎 Güncelleme kontrol ediliyor..."

# GitHub API'den en son sürümü al
LATEST_VERSION=$(curl -s https://api.github.com/repos/$REPO/releases/latest | grep tag_name | cut -d '"' -f4)

if [ "$LOCAL_VERSION" != "$LATEST_VERSION" ]; then
    echo "⚡ Yeni sürüm bulundu: $LATEST_VERSION"
    echo "📥 Güncelleniyor..."
    
    # en son sürümü indir ve yükle
    git fetch --all
    git reset --hard origin/main

    echo "✅ Güncelleme tamamlandı!"
else
    echo "✅ Zaten güncelsiniz ($LOCAL_VERSION)"
fi
