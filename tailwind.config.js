/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ['./src/main/webapp/**/*.jsp', "./src/main/webapp/**/*.js"],
    theme: {
        extend: {},
    },
    plugins: [
        // ...
        require('@tailwindcss/forms'),
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/typography'),
    ],
}
