<template>
  <div class="overflow-hidden">
    <!-- Hero Section -->
    <section class="relative bg-gradient-to-br from-primary-600 via-primary-700 to-primary-900 text-white section-padding overflow-hidden">
      <!-- Decorative elements -->
      <div class="absolute inset-0 opacity-10">
        <div class="absolute top-20 right-20 w-72 h-72 bg-white rounded-full blur-3xl"></div>
        <div class="absolute bottom-20 left-20 w-96 h-96 bg-primary-400 rounded-full blur-3xl"></div>
      </div>

      <div class="container-custom relative z-10">
        <div class="grid lg:grid-cols-2 gap-12 items-center">
          <!-- Content -->
          <div class="animate-fade-in-up">
            <div class="inline-flex items-center space-x-2 bg-white/20 backdrop-blur-sm rounded-full px-4 py-2 mb-6">
              <span class="w-2 h-2 bg-secondary-500 rounded-full animate-pulse"></span>
              <span class="text-sm font-semibold">Конкурс грант 2025</span>
            </div>

            <h1 class="mb-6 leading-tight">
              {{ $t('home.title') }}
            </h1>
            <p class="text-xl md:text-2xl mb-8 text-white/90 leading-relaxed">
              {{ $t('home.subtitle') }}
            </p>

            <!-- Application Period -->
            <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 mb-8 border border-white/20 shadow-xl">
              <div v-if="loading" class="text-center py-4">
                <div class="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-white"></div>
              </div>

              <div v-else-if="settings && periodStatus">
                <div class="flex items-start space-x-4">
                  <div class="flex-shrink-0">
                    <div class="w-12 h-12 bg-white/20 rounded-xl flex items-center justify-center">
                      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                      </svg>
                    </div>
                  </div>
                  <div class="flex-1">
                    <div class="text-sm font-medium opacity-90 mb-1">Период подачи заявок на регистрацию</div>
                    <div class="text-xl md:text-2xl font-bold">
                      {{ formatDate(settings.start_date) }} — {{ formatDate(settings.end_date) }}
                    </div>
                    <div v-if="periodStatus.message" class="text-sm opacity-90 mt-3 bg-white/10 rounded-lg px-3 py-2">
                      {{ periodStatus.message }}
                    </div>
                  </div>
                </div>
              </div>

              <div v-else class="text-center text-sm opacity-90 py-4">
                Информация о периоде подачи заявок временно недоступна
              </div>
            </div>

            <div class="flex flex-col sm:flex-row gap-4">
              <NuxtLink to="/app" class="btn-outline border-white text-white hover:bg-white hover:text-primary-600">
                {{ $t('home.cta.button') }}
              </NuxtLink>
              <NuxtLink to="/how-to-apply" class="btn-outline border-white text-white hover:bg-white hover:text-primary-600">
                {{ $t('home.learnMoreBtn') }}
              </NuxtLink>
            </div>
          </div>
        </div> 
      </div>  



    <!-- Этапы конкурса -->
    <section class="section-padding bg-white">
      <div class="container-custom">
        <div class="text-center max-w-3xl mx-auto mb-16">
          <h2 class="mb-4 bg-gradient-to-r from-primary-600 to-primary-800 bg-clip-text text-transparent">{{ $t('home.stages.title') }}</h2>
          <p class="text-xl text-gray-600">{{ $t('home.simpleProcess') }}</p>
        </div>

        <!-- Первый ряд: этапы 1-3 -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 relative mb-8">
          <!-- Connection lines for desktop -->
          <div class="hidden md:block absolute top-24 left-0 right-0 h-1 bg-gradient-to-r from-primary-200 via-primary-300 to-primary-400 z-0" style="width: 66%; left: 17%;"></div>

          <!-- Stage 1: Подача заявок -->
          <div class="card p-8 relative z-10 group">
            <div class="flex justify-center mb-6">
              <div class="w-20 h-20 rounded-2xl bg-gradient-to-br from-primary-500 to-primary-600 flex items-center justify-center text-white text-3xl font-bold shadow-lg group-hover:scale-110 transition-transform duration-300">
                01
              </div>
            </div>
            <div class="flex justify-center mb-6">
              <img
                src="/image_svg/undraw_data-input_whqw.svg"
                alt="Подача заявок"
                class="w-32 h-32 object-contain"
              />
            </div>
            <h3 class="mb-4 text-center">{{ $t('home.stages.step1.title') }}</h3>
            <p class="text-gray-600 text-center leading-relaxed">
              {{ $t('home.stages.step1.description') }}
            </p>
          </div>

          <!-- Stage 2: Обучение -->
          <div class="card p-8 relative z-10 group">
            <div class="flex justify-center mb-6">
              <div class="w-20 h-20 rounded-2xl bg-gradient-to-br from-primary-600 to-primary-700 flex items-center justify-center text-white text-3xl font-bold shadow-lg group-hover:scale-110 transition-transform duration-300">
                02
              </div>
            </div>
            <div class="flex justify-center mb-6">
              <img
                src="/image_svg/undraw_conference-speaker_kl0d.svg"
                alt="Обучение"
                class="w-32 h-32 object-contain"
              />
            </div>
            <h3 class="mb-4 text-center">{{ $t('home.stages.step2.title') }}</h3>
            <p class="text-gray-600 text-center leading-relaxed">
              {{ $t('home.stages.step2.description') }}
            </p>
          </div>

          <!-- Stage 3: Подача бизнес-планов -->
          <div class="card p-8 relative z-10 group">
            <div class="flex justify-center mb-6">
              <div class="w-20 h-20 rounded-2xl bg-gradient-to-br from-primary-700 to-primary-800 flex items-center justify-center text-white text-3xl font-bold shadow-lg group-hover:scale-110 transition-transform duration-300">
                03
              </div>
            </div>
            <div class="flex justify-center mb-6">
              <img
                src="/image_svg/undraw_add-file_lf11.svg"
                alt="Подача бизнес-планов"
                class="w-32 h-32 object-contain"
              />
            </div>
            <h3 class="mb-4 text-center">{{ $t('home.stages.step3.title') }}</h3>
            <p class="text-gray-600 text-center leading-relaxed">
              {{ $t('home.stages.step3.description') }}
            </p>
          </div>
        </div>

        <!-- Второй ряд: этапы 4-6 -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 relative">
          <!-- Connection lines for desktop -->
          <div class="hidden md:block absolute top-24 left-0 right-0 h-1 bg-gradient-to-r from-primary-400 via-secondary-300 to-secondary-500 z-0" style="width: 66%; left: 17%;"></div>

          <!-- Stage 4: Защита проектов -->
          <div class="card p-8 relative z-10 group">
            <div class="flex justify-center mb-6">
              <div class="w-20 h-20 rounded-2xl bg-gradient-to-br from-primary-800 to-secondary-500 flex items-center justify-center text-white text-3xl font-bold shadow-lg group-hover:scale-110 transition-transform duration-300">
                04
              </div>
            </div>
            <div class="flex justify-center mb-6">
              <img
                src="/image_svg/undraw_visual-data_1eya.svg"
                alt="Защита проектов"
                class="w-32 h-32 object-contain"
              />
            </div>
            <h3 class="mb-4 text-center">{{ $t('home.stages.step4.title') }}</h3>
            <p class="text-gray-600 text-center leading-relaxed">
              {{ $t('home.stages.step4.description') }}
            </p>
          </div>

          <!-- Stage 5: Отбор экспертами -->
          <div class="card p-8 relative z-10 group">
            <div class="flex justify-center mb-6">
              <div class="w-20 h-20 rounded-2xl bg-gradient-to-br from-secondary-500 to-secondary-600 flex items-center justify-center text-white text-3xl font-bold shadow-lg group-hover:scale-110 transition-transform duration-300">
                05
              </div>
            </div>
            <div class="flex justify-center mb-6">
              <img
                src="/image_svg/undraw_data-analysis_b7cp.svg"
                alt="Отбор экспертами"
                class="w-32 h-32 object-contain"
              />
            </div>
            <h3 class="mb-4 text-center">{{ $t('home.stages.step5.title') }}</h3>
            <p class="text-gray-600 text-center leading-relaxed">
              {{ $t('home.stages.step5.description') }}
            </p>
          </div>

          <!-- Stage 6: Финал и награждение -->
          <div class="card p-8 relative z-10 group">
            <div class="flex justify-center mb-6">
              <div class="w-20 h-20 rounded-2xl bg-gradient-to-br from-secondary-600 to-secondary-700 flex items-center justify-center text-white text-3xl font-bold shadow-lg group-hover:scale-110 transition-transform duration-300">
                06
              </div>
            </div>
            <div class="flex justify-center mb-6">
              <img
                src="/image_svg/undraw_success_288d.svg"
                alt="Финал и награждение"
                class="w-32 h-32 object-contain"
              />
            </div>
            <h3 class="mb-4 text-center">{{ $t('home.stages.step6.title') }}</h3>
            <p class="text-gray-600 text-center leading-relaxed">
              {{ $t('home.stages.step6.description') }}
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- FAQ Section -->
    <section class="section-padding bg-gray-50">
      <div class="container-custom">
        <div class="text-center max-w-3xl mx-auto mb-16">
          <h2 class="mb-4 text-gray-900">{{ $t('faq.title') }}</h2>
          <p class="text-xl text-gray-600">{{ $t('faq.subtitle') }}</p>
        </div>

        <div class="max-w-4xl mx-auto space-y-4">
          <!-- FAQ Item 1 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(1)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q1.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 1 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 1"
              class="px-6 pb-5 text-gray-600 leading-relaxed"
            >
              {{ $t('faq.q1.answer') }}
            </div>
          </div>

          <!-- FAQ Item 2 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(2)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q2.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 2 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 2"
              class="px-6 pb-5 text-gray-600 leading-relaxed"
            >
              {{ $t('faq.q2.answer') }}
            </div>
          </div>

          <!-- FAQ Item 3 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(3)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q3.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 3 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 3"
              class="px-6 pb-5 text-gray-600 leading-relaxed"
            >
              {{ $t('faq.q3.answer') }}
            </div>
          </div>

          <!-- FAQ Item 4 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(4)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q4.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 4 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 4"
              class="px-6 pb-5 text-gray-600 leading-relaxed"
            >
              {{ $t('faq.q4.answer') }}
            </div>
          </div>

          <!-- FAQ Item 5 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(5)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q5.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 5 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 5"
              class="px-6 pb-5 text-gray-600 leading-relaxed space-y-2"
            >
              <p>{{ $t('faq.q5.answer') }}</p>
              <p class="text-sm text-gray-500">{{ $t('faq.q5.note') }}</p>
            </div>
          </div>

          <!-- FAQ Item 6 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(6)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q6.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 6 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 6"
              class="px-6 pb-5 text-gray-600"
            >
              <ul class="space-y-2 list-disc list-inside">
                <li v-for="(item, index) in $tm('faq.q6.items')" :key="index">{{ item }}</li>
              </ul>
            </div>
          </div>

          <!-- FAQ Item 7 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(7)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q7.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 7 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 7"
              class="px-6 pb-5 text-gray-600 leading-relaxed"
            >
              {{ $t('faq.q7.answer') }}
            </div>
          </div>

          <!-- FAQ Item 8 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(8)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q8.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 8 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 8"
              class="px-6 pb-5 text-gray-600 leading-relaxed"
            >
              {{ $t('faq.q8.answer') }}
            </div>
          </div>

          <!-- FAQ Item 9 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(9)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q9.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 9 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 9"
              class="px-6 pb-5 text-gray-600 leading-relaxed"
            >
              {{ $t('faq.q9.answer') }}
            </div>
          </div>

          <!-- FAQ Item 10 -->
          <div class="bg-white rounded-xl shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md">
            <button
              @click="toggleFaq(10)"
              class="w-full px-6 py-5 text-left flex items-center justify-between gap-4 hover:bg-gray-50 transition-colors duration-200"
            >
              <span class="font-semibold text-gray-900 text-lg pr-8">{{ $t('faq.q10.question') }}</span>
              <svg
                class="w-6 h-6 text-primary-600 flex-shrink-0 transition-transform duration-300"
                :class="{ 'rotate-180': openFaq === 10 }"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div
              v-show="openFaq === 10"
              class="px-6 pb-5 text-gray-600 leading-relaxed space-y-2"
            >
              <p v-for="(part, index) in $tm('faq.q10.parts')" :key="index">{{ part }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="section-padding bg-gradient-to-br from-primary-600 via-primary-700 to-primary-900 text-white relative overflow-hidden">
      <!-- Decorative elements -->
      <div class="absolute inset-0 opacity-10">
        <div class="absolute top-0 right-0 w-96 h-96 bg-white rounded-full blur-3xl"></div>
        <div class="absolute bottom-0 left-0 w-96 h-96 bg-secondary-500 rounded-full blur-3xl"></div>
      </div>

      <div class="container-custom relative z-10">
        <div class="grid lg:grid-cols-2 gap-12 items-center">
          <!-- Illustration -->
          <div class="hidden lg:block animate-float">
            <img
              src="/image_svg/undraw_ideas-flow_lwpa.svg"
              alt="Ideas Flow"
              class="w-full h-auto drop-shadow-2xl"
            />
          </div>

          <!-- Content -->
          <div class="text-center lg:text-left">
            <h2 class="mb-6 leading-tight">{{ $t('home.cta.title') }}</h2>
            <p class="text-xl md:text-2xl mb-8 text-white/90 leading-relaxed">
              {{ $t('home.cta.description') }}
            </p>

            <div class="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
              <NuxtLink to="/app" class="px-8 py-4 bg-gradient-to-r from-secondary-500 to-secondary-600 text-white rounded-xl font-semibold shadow-xl hover:shadow-2xl hover:from-secondary-600 hover:to-secondary-700 transition-all duration-300 transform hover:-translate-y-0.5 active:translate-y-0 flex items-center justify-center space-x-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
                </svg>
                <span>{{ $t('home.cta.button') }}</span>
              </NuxtLink>
              <NuxtLink to="/contacts" class="btn-outline border-white text-white hover:bg-white hover:text-primary-600">
                {{ $t('home.contactUsBtn') }}
              </NuxtLink>
            </div>

            <!-- Trust indicators -->
            <div class="mt-12 pt-8 border-t border-white/20">
              <div class="grid grid-cols-2 gap-6">
                <div class="flex items-center space-x-3">
                  <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center flex-shrink-0">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                    </svg>
                  </div>
                  <div class="text-left">
                    <div class="text-sm font-semibold">{{ $t('home.security') }}</div>
                    <div class="text-xs text-white/70">{{ $t('home.dataProtection') }}</div>
                  </div>
                </div>

                <div class="flex items-center space-x-3">
                  <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center flex-shrink-0">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd" d="M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                    </svg>
                  </div>
                  <div class="text-left">
                    <div class="text-sm font-semibold">{{ $t('home.transparency') }}</div>
                    <div class="text-xs text-white/70">{{ $t('home.fairEvaluation') }}</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
const { settings, periodStatus, loading, getApplicationSettings, formatDate } = useSettings()
const { getOrganizationSchema, getEventSchema, getWebSiteSchema } = useStructuredData()

// FAQ accordion state
const openFaq = ref<number | null>(null)

const toggleFaq = (id: number) => {
  openFaq.value = openFaq.value === id ? null : id
}

// Structured data
const organizationSchema = getOrganizationSchema()
const eventSchema = getEventSchema()
const webSiteSchema = getWebSiteSchema()

// Загрузить настройки периода при монтировании
onMounted(async () => {
  await getApplicationSettings()
})

// SEO: canonical and hreflang
const { setCanonicalAndHreflang } = useSeoHelpers()
setCanonicalAndHreflang()

// Enhanced SEO meta
useSeoMeta({
  title: 'Инновационный грант Business Qoldau 2025 - Грант для предпринимателей Казахстана',
  description: 'Центр поддержки предпринимателей Казахстана организует конкурс на безвозмездные гранты начинающим и действующим предпринимателям в сумме от 2 до 10 млн тенге на развитие инновационных проектов в приоритетных секторах экономики.',
  keywords: 'бизнес грант казахстан, qoldau, business qoldau, предприниматели казахстан, грант для бизнеса, стартап казахстан, бизнес план, конкурс грант 2025, финансирование бизнеса, грант астана, грант алматы, грант шымкент, грант караганда, грант актобе, грант павлодар, поддержка предпринимателей',
  ogTitle: 'Инновационный грант Business Qoldau 2025 - Грант для предпринимателей Казахстана',
  ogDescription: 'Центр поддержки предпринимателей Казахстана организует конкурс на безвозмездные гранты начинающим и действующим предпринимателям в сумме от 2 до 10 млн тенге на развитие инновационных проектов в приоритетных секторах экономики.',
  ogImage: 'https://businessqoldau.kz/og-image.svg',
  ogType: 'website',
  ogUrl: 'https://businessqoldau.kz',
  twitterCard: 'summary_large_image',
  twitterTitle: 'Инновационный грант Business Qoldau 2025 - Грант для предпринимателей Казахстана',
  twitterDescription: 'Центр поддержки предпринимателей Казахстана организует конкурс на безвозмездные гранты начинающим и действующим предпринимателям в сумме от 2 до 10 млн тенге на развитие инновационных проектов в приоритетных секторах экономики.',
  twitterImage: 'https://businessqoldau.kz/og-image.svg'
})

// Additional head tags
useHead({
  link: [
    { rel: 'canonical', href: 'https://businessqoldau.kz' },
    { rel: 'alternate', hreflang: 'ru', href: 'https://businessqoldau.kz' },
    { rel: 'alternate', hreflang: 'kk', href: 'https://businessqoldau.kz' },
    { rel: 'alternate', hreflang: 'x-default', href: 'https://businessqoldau.kz' }
  ],
  script: [
    {
      type: 'application/ld+json',
      children: JSON.stringify(organizationSchema)
    },
    {
      type: 'application/ld+json',
      children: JSON.stringify(eventSchema)
    },
    {
      type: 'application/ld+json',
      children: JSON.stringify(webSiteSchema)
    }
  ]
})
</script>
