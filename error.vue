<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-50">
    <div class="max-w-md w-full text-center px-4">
      <div class="mb-8">
        <h1 class="text-6xl font-bold text-primary-600 mb-4">{{ error?.statusCode || '404' }}</h1>
        <h2 class="text-2xl font-semibold text-gray-900 mb-4">
          {{ error?.statusCode === 404 ? 'Страница не найдена' : 'Произошла ошибка' }}
        </h2>
        <p class="text-gray-600 mb-8">
          {{ error?.statusCode === 404
            ? 'К сожалению, запрашиваемая страница не существует.'
            : 'Извините, произошла непредвиденная ошибка. Пожалуйста, попробуйте позже.' }}
        </p>
      </div>

      <div class="space-y-4">
        <NuxtLink to="/" class="btn-primary inline-block">
          Вернуться на главную
        </NuxtLink>

        <div v-if="error?.statusCode !== 404">
          <button @click="handleError" class="btn-secondary">
            Попробовать снова
          </button>
        </div>
      </div>

      <!-- Error details for development -->
      <div v-if="isDevelopment && error?.message" class="mt-8 p-4 bg-red-50 border border-red-200 rounded-lg text-left">
        <p class="text-xs font-mono text-red-800 break-all">{{ error.message }}</p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps({
  error: Object
})

const isDevelopment = process.env.NODE_ENV === 'development'

const handleError = () => clearError({ redirect: '/' })

// SEO for error page
useSeoMeta({
  title: '404 - Страница не найдена | Business Qoldau 2025',
  description: 'Страница не найдена. Вернитесь на главную страницу Business Qoldau 2025 - гранта для предпринимателей Казахстана.',
  robots: 'noindex, nofollow'
})
</script>
