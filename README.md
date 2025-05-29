# RePlate 🍽️

#### Replate – Recipes from What’s Left...

RePlate is a Nuxt-based web application designed to help users manage their food waste by analyzing recipes and suggesting ways to use leftover ingredients. It features a user-friendly interface, a recipe database, and integration with external APIs for enhanced functionality.

---

![Vue](https://img.shields.io/badge/Vue-83.3%25-4FC08D?logo=vue.js&logoColor=white)
![PLpgSQL](https://img.shields.io/badge/PLpgSQL-12.9%25-336791?logo=postgresql&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3.3%25-3178C6?logo=typescript&logoColor=white)
![Other](https://img.shields.io/badge/Other-0.5%25-grey)
![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)

---

## 🌟 Project Overview

**RePlate** is a smart food suggestion app that helps users utilize leftover ingredients by suggesting suitable recipes from a dataset. It aims to reduce food waste and encourage creativity in the kitchen.

The project is built with **Nuxt 3**, **Vue 3**, **Supabase**, and **PostgreSQL**.

---

## ⚙️ Tech Stack

- **Frontend**: [Vue 3](https://vuejs.org/), [Nuxt 3](https://nuxt.com/)
- **Backend/DB**: [Supabase](https://supabase.com/), PLpgSQL
- **Languages**: TypeScript, SQL
- **UI Library**: [Nuxt UI](https://ui.nuxt.com/)
- **State Management**: Supabase client

---

## ⚠️ Notices

- Supabase rate limits may apply depending on your account plan.
- Ensure the Supabase project is up and running when testing locally.
- For best results, use recent versions of Node.js and package managers like `pnpm` or `npm`.

---

## 🚀 Getting Started

### ✅ Prerequisites

- Node.js v18+
- Supabase account with a project set up
- PostgreSQL locally or Supabase-hosted
- `.env` file with your Supabase credentials

### 📦 Installation
### Clone the repository
```
git clone https://github.com/yourusername/replate.git
cd replate
````
### Install dependencies
````
npm install
````
### Enviroment Setup 
**Create a .env file in the root of the project based on .env.example:**

**.env.example**
````
  SUPABASE_URL=<YOUR_SUPABASE_URL>
  SUPABASE_KEY=<YOUR_SUPABASE_ANON_KEY>
````
### Run the app locally
````
npm run dev
````

### 📄 License

This project is licensed under the GNU General Public License v3.0.
See the LICENSE file for details.
