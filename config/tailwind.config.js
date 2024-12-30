const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        'body': ['Quicksand', ...defaultTheme.fontFamily.sans],
        'sans': ['Quicksand', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'brown': {
          50: '#f9f5f3',
          100: '#f1e9e3',
          200: '#e7dad1',
          300: '#cfb3a2',
          400: '#ba907d',
          500: '#ac7863',
          600: '#9f6757',
          700: '#84544a',
          800: '#6c4540',
          900: '#583b36',
          950: '#2f1d1b',
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin')({
      theme: {
        fontFamily: {
          'body': ['Quicksand', ...defaultTheme.fontFamily.sans],
          'sans': ['Quicksand', ...defaultTheme.fontFamily.sans],
        },
      }
    })
  ]
}
