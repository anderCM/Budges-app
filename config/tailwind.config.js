const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        'proxima-bold': ['PROXIMA NOVA BOLD'],
        'proxima-light': ['PROXIMA NOVA LIGHT'],
      },
      colors: {
        main: '#3778C2',
        secondary: '#5FB523',
        text: {
          100: '#434B54',
          50: '#86898E',
          25: '#989DA3'
        },

      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
