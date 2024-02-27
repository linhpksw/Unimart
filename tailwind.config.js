/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ['./src/main/webapp/**/*.jsp'],
    theme: {
        extend: {},
    },
    plugins: [
        // ...
        require('@tailwindcss/forms'),
        require('@tailwindcss/aspect-ratio'),
    ],
}
