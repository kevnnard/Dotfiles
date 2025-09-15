#!/bin/zsh

echo "🧼 Limpieza profunda de macOS - Versión automática"
echo "--------------------------------------------------"
read "?⚠️ ¿Deseas ejecutar TODAS las limpiezas recomendadas? Esto puede liberar 10-20GB. [y/N] " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo "🚀 Iniciando limpieza..."

  echo "🧹 Borrando pnpm store..."
  rm -rf ~/Library/pnpm/store

  echo "🧹 Eliminando simuladores de Xcode no disponibles..."
  xcrun simctl delete unavailable

  echo "🧹 Borrando AVDs y build-cache de Android..."
  rm -rf ~/.android/avd ~/.android/build-cache

  echo "🧹 Borrando system-images del Android SDK..."
  rm -rf ~/Library/Android/sdk/system-images

  echo "🧹 Borrando emuladores del Android SDK..."
  rm -rf ~/Library/Android/sdk/emulator

  echo "🧹 Vaciando la papelera..."
  sudo rm -rf ~/.Trash/*

  echo "✅ Limpieza completada."
  df -h /
else
  echo "❌ Cancelado por el usuario."
fi
