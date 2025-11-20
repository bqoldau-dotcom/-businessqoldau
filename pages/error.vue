<template>
  <div class="min-h-screen bg-gradient-to-b from-gray-50 to-white flex items-center justify-center px-4">
    <div class="max-w-2xl w-full text-center">
      <!-- Error Code -->
      <div class="mb-8">
        <h1 class="text-9xl font-bold text-primary-600 mb-4">
          {{ error?.statusCode || 404 }}
        </h1>
        <h2 class="text-3xl md:text-4xl font-semibold text-gray-900 mb-4">
          {{ getErrorTitle() }}
        </h2>
        <p class="text-xl text-gray-600">
          {{ getErrorMessage() }}
        </p>
      </div>

      <!-- Illustration -->
      <div class="mb-8">
        <img
          src="~/uploads/documents/og-image.svg"
          alt="Ошибка"
          class="w-full max-w-md mx-auto"
        />
      </div>

      <!-- Actions -->
      <div class="flex flex-col sm:flex-row gap-4 justify-center">
        <NuxtLink
          to="/"
          class="btn-primary"
        >
          {{ $t('error.backHome') }}
        </NuxtLink>
        <button
          @click="handleError"
          class="btn-outline border-primary-600 text-primary-600 hover:bg-primary-600 hover:text-white"
        >
          {{ $t('error.tryAgain') }}
        </button>
      </div>

      <!-- Additional Help -->
      <div class="mt-12 text-sm text-gray-500">
        <p>{{ $t('error.needHelp') }}</p>
        <NuxtLink
          to="/contacts"
          class="text-primary-600 hover:underline"
        >
          {{ $t('error.contactUs') }}
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const props = defineProps({
  error: {
    type: Object,
    required: true
  }
})

const { t } = useI18n()

const getErrorTitle = () => {
  const statusCode = props.error?.statusCode || 404

  if (statusCode === 404) {
    return t('error.notFound')
  } else if (statusCode === 500) {
    return t('error.serverError')
  } else {
    return t('error.somethingWrong')
  }
}

const getErrorMessage = () => {
  const statusCode = props.error?.statusCode || 404

  if (statusCode === 404) {
    return t('error.notFoundMessage')
  } else if (statusCode === 500) {
    return t('error.serverErrorMessage')
  } else {
    return t('error.somethingWrongMessage')
  }
}

const handleError = () => {
  clearError({ redirect: '/' })
}

useSeoMeta({
  title: `${getErrorTitle()} - Business Qoldau 2025`,
  robots: 'noindex, nofollow'
})
</script>
