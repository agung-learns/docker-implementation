// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  runtimeConfig: {
    public: {
      appUrl: process.env.APP_URL
    }
  },
  devtools: { enabled: true }
})
