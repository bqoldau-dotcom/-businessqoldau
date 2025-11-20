// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: process.env.NODE_ENV === 'development' },

  modules: [
    '@nuxtjs/tailwindcss',
    '@nuxtjs/i18n',
    '@nuxt/content',
    '@nuxtjs/sitemap',
    '@nuxtjs/robots'
  ],

  // i18n configuration
  i18n: {
    defaultLocale: 'ru',
    locales: [
      { code: 'ru', name: 'Русский' },
      { code: 'kk', name: 'Қазақша' }
    ],
    strategy: 'no_prefix',
    vueI18n: './i18n.config.ts',
    detectBrowserLanguage: false
  },

  // Content configuration
  content: {
    watch: {
      enabled: false
    }
  },

  // SEO Configuration
  site: {
    url: 'https://businessqoldau.kz',
    name: 'Инновационный грант Business Qoldau 2025 - Грант для предпринимателей Казахстана',
    description: 'Центр поддержки предпринимателей Казахстана организует конкурс на безвозмездные гранты начинающим и действующим предпринимателям в сумме от 2 до 10 млн тенге на развитие инновационных проектов в приоритетных секторах экономики.',
    defaultLocale: 'ru'
  },

  // Sitemap configuration
  sitemap: {
    sources: [
      '/api/__sitemap__/urls'
    ]
  },

  // Robots configuration
  robots: {
    rules: [
      {
        UserAgent: '*',
        Allow: '/',
        Disallow: ['/admin', '/api/', '/_nuxt/', '/uploads/']
      }
    ]
  },

  // App configuration
  app: {
    head: {
      charset: 'utf-8',
      viewport: 'width=device-width, initial-scale=1',
      htmlAttrs: {
        lang: 'ru'
      },
      title: 'Инновационный грант Business Qoldau 2025 - Грант для предпринимателей Казахстана',
      meta: [
        { name: 'description', content: 'Центр поддержки предпринимателей Казахстана организует конкурс на безвозмездные гранты начинающим и действующим предпринимателям в сумме от 2 до 10 млн тенге на развитие инновационных проектов в приоритетных секторах экономики.' },
        { name: 'keywords', content: 'бизнес грант казахстан, qoldau, business qoldau, предприниматели казахстан, грант для бизнеса, стартап казахстан, бизнес план, конкурс грант 2025, грант астана, грант алматы, грант шымкент, грант караганда, грант актобе, грант павлодар, поддержка предпринимателей' },
        { name: 'author', content: 'Business Qoldau 2025' },
        { name: 'robots', content: 'index, follow' },
        { property: 'og:title', content: 'Инновационный грант Business Qoldau 2025 - Грант для предпринимателей Казахстана' },
        { property: 'og:description', content: 'Центр поддержки предпринимателей Казахстана организует конкурс на безвозмездные гранты начинающим и действующим предпринимателям в сумме от 2 до 10 млн тенге на развитие инновационных проектов в приоритетных секторах экономики.' },
        { property: 'og:type', content: 'website' },
        { property: 'og:url', content: 'https://businessqoldau.kz' },
        { property: 'og:image', content: 'https://businessqoldau.kz/og-image.svg' },
        { property: 'og:site_name', content: 'Business Qoldau 2025' },
        { property: 'og:locale', content: 'ru_RU' },
        { property: 'og:locale:alternate', content: 'kk_KZ' },
        { name: 'twitter:card', content: 'summary_large_image' },
        { name: 'twitter:image', content: 'https://businessqoldau.kz/og-image.svg' },
        { name: 'twitter:title', content: 'Инновационный грант Business Qoldau 2025 - Грант для предпринимателей Казахстана' },
        { name: 'twitter:description', content: 'Центр поддержки предпринимателей Казахстана организует конкурс на безвозмездные гранты начинающим и действующим предпринимателям в сумме от 2 до 10 млн тенге на развитие инновационных проектов в приоритетных секторах экономики.' }
      ],
      link: [
        { rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg' },
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
      ]
    }
  },

  // Server configuration для Cloud Run
  server: {
    host: '0.0.0.0',
    port: process.env.PORT || 8080
  },

  // Runtime config
  runtimeConfig: {
    public: {
      baseUrl: process.env.BASE_URL || 'http://localhost:3000',
      apiUrl: process.env.NUXT_PUBLIC_API_URL || 'http://localhost:4000/api'
    }
  }
})
