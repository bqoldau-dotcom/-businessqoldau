module.exports = {
  apps: [
    {
      name: 'businessqoldau-nuxt',
      script: '.output/server/index.mjs',
      cwd: '/home/rus/projects/businessqoldau',
      instances: 1,
      exec_mode: 'fork',
      env: {
        NODE_ENV: 'production',
        PORT: 3004,
        NITRO_PORT: 3004
      },
      error_file: './logs/nuxt-error.log',
      out_file: './logs/nuxt-out.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
      merge_logs: true,
      autorestart: true,
      max_restarts: 10,
      min_uptime: '10s',
      max_memory_restart: '500M'
    },
    {
      name: 'businessqoldau-backend',
      script: 'dist/index.js',
      cwd: '/home/rus/projects/businessqoldau/backend',
      instances: 1,
      exec_mode: 'fork',
      env: {
        NODE_ENV: 'production',
        PORT: 3001
      },
      error_file: '../logs/backend-error.log',
      out_file: '../logs/backend-out.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
      merge_logs: true,
      autorestart: true,
      max_restarts: 10,
      min_uptime: '10s',
      max_memory_restart: '300M'
    }
  ]
};