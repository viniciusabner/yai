/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        brand: {
          blue: '#0052cc', // Strong trustworthy blue
          yellow: '#fbbf24', // Warm energetic yellow
          dark: '#0f172a',
          light: '#f8fafc',
        }
      }
    },
  },
  plugins: [],
}

