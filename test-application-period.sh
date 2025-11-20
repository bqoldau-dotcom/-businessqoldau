#!/bin/bash

API_URL="http://localhost:4000"

echo "=========================================="
echo "Тестирование системы периода подачи заявок"
echo "API: $API_URL"
echo "=========================================="

# Получаем токен администратора (должен быть admin@businesscamp.kz)
echo -e "\n1. Логин администратора для управления настройками..."
ADMIN_RESPONSE=$(curl -s -X POST $API_URL/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@businesscamp.kz","password":"AdminPass123"}')

echo "$ADMIN_RESPONSE" | jq '.'

ADMIN_TOKEN=$(echo "$ADMIN_RESPONSE" | jq -r '.accessToken')

if [ "$ADMIN_TOKEN" == "null" ] || [ -z "$ADMIN_TOKEN" ]; then
  echo "❌ Ошибка: не удалось получить токен администратора"
  exit 1
fi

echo "✅ Токен администратора получен"

# Проверяем текущие настройки периода
echo -e "\n2. Проверка текущих настроек периода..."
curl -s -X GET $API_URL/api/settings/application-period | jq '.'

# Устанавливаем период в будущем (блокировка)
echo -e "\n3. Установка периода в будущем (с 2026-01-01 по 2026-02-01)..."
curl -s -X PUT $API_URL/api/settings/application-period \
  -H "Authorization: Bearer $ADMIN_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "start_date": "2026-01-01T00:00:00.000Z",
    "end_date": "2026-02-01T23:59:59.999Z"
  }' | jq '.'

# Попытка регистрации (должна быть заблокирована)
echo -e "\n4. Попытка регистрации вне периода (должна быть заблокирована)..."
REGISTER_RESPONSE=$(curl -s -X POST $API_URL/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test.period@example.com",
    "password": "TestPass123"
  }')

echo "$REGISTER_RESPONSE" | jq '.'

if echo "$REGISTER_RESPONSE" | jq -e '.code == "APPLICATION_PERIOD_INACTIVE"' > /dev/null; then
  echo "✅ Регистрация заблокирована корректно"
else
  echo "❌ Ошибка: регистрация не была заблокирована"
fi

# Попытка входа (должна быть заблокирована)
echo -e "\n5. Попытка входа вне периода (должна быть заблокирована)..."
LOGIN_RESPONSE=$(curl -s -X POST $API_URL/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@businesscamp.kz",
    "password": "AdminPass123"
  }')

echo "$LOGIN_RESPONSE" | jq '.'

if echo "$LOGIN_RESPONSE" | jq -e '.code == "APPLICATION_PERIOD_INACTIVE"' > /dev/null; then
  echo "✅ Вход заблокирован корректно"
else
  echo "❌ Ошибка: вход не был заблокирован"
fi

# Устанавливаем активный период (разрешение доступа)
echo -e "\n6. Установка активного периода (с 2025-01-01 по 2026-12-31)..."
curl -s -X PUT $API_URL/api/settings/application-period \
  -H "Authorization: Bearer $ADMIN_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "start_date": "2025-01-01T00:00:00.000Z",
    "end_date": "2026-12-31T23:59:59.999Z"
  }' | jq '.'

# Попытка регистрации (должна пройти)
echo -e "\n7. Попытка регистрации в активном периоде (должна пройти)..."
REGISTER_RESPONSE2=$(curl -s -X POST $API_URL/api/auth/register \
  -H "Content-Type: application/json" \
  -d "{
    \"email\": \"test.period.$(date +%s)@example.com\",
    \"password\": \"TestPass123\"
  }")

echo "$REGISTER_RESPONSE2" | jq '.'

if echo "$REGISTER_RESPONSE2" | jq -e '.message == "User registered successfully"' > /dev/null; then
  echo "✅ Регистрация прошла успешно"
else
  echo "⚠️  Регистрация не прошла (возможно, пользователь уже существует)"
fi

# Попытка входа (должна пройти)
echo -e "\n8. Попытка входа в активном периоде (должна пройти)..."
LOGIN_RESPONSE2=$(curl -s -X POST $API_URL/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@businesscamp.kz",
    "password": "AdminPass123"
  }')

echo "$LOGIN_RESPONSE2" | jq '.'

if echo "$LOGIN_RESPONSE2" | jq -e '.message == "Login successful"' > /dev/null; then
  echo "✅ Вход прошел успешно"
else
  echo "❌ Ошибка: вход не прошел"
fi

echo -e "\n=========================================="
echo "Тестирование завершено"
echo "=========================================="
