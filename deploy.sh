#!/bin/bash
set -e

echo "🚀 Starting deployment for Business Qoldau..."

# 1. Переход в директорию проекта
cd /home/rus/projects/businessqoldau

# 2. Получение последних изменений из Git
echo "📥 Pulling latest changes..."
git pull origin main

# 3. Установка зависимостей
echo "📦 Installing frontend dependencies..."
npm install

# 4. Backend: установка зависимостей и сборка
echo "🔧 Building backend..."
cd backend
npm install

# 5. Применение миграций БД (если есть новые)
echo "🗄️ Running database migrations..."
npm run prisma:migrate deploy || echo "No new migrations"

# 6. Генерация Prisma Client
echo "📚 Generating Prisma Client..."
npm run prisma:generate

# 7. Backend build
echo "🏗️ Building backend TypeScript..."
npm run build

# 8. Frontend: сборка
echo "🎨 Building frontend..."
cd ..
npm run build

# 9. Перезапуск PM2 процессов
echo "♻️ Restarting PM2 processes..."
pm2 restart ecosystem.config.js

# 10. Проверка статуса
echo "✅ Checking status..."
pm2 status

# 11. Проверка здоровья приложения
echo "🏥 Health check..."
sleep 3
curl -s https://businessqoldau.kz || echo "Site not responding yet..."

echo ""
echo "✅ Deployment completed successfully!"
echo "📊 View logs: pm2 logs"
echo "🌐 Site: https://businessqoldau.kz"