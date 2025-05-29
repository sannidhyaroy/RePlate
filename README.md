# RePlate

[![Netlify Status](https://api.netlify.com/api/v1/badges/1f5898f9-62ea-4651-bd54-ec9d783a6b4a/deploy-status)](https://app.netlify.com/sites/replate-recipes/deploys)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)
[![Nuxt 3](https://img.shields.io/badge/Nuxt-3-4FC08D?style=flat-square)](https://nuxt.com)
[![TypeScript](https://img.shields.io/badge/TypeScript-4.5-blue?style=flat-square)](https://www.typescriptlang.org)

Refill your plate with LeftOvers 🍽️

---

## Table of Contents

1. [Overview](#overview)
   - [Problem](#problem)
   - [Solution](#solution)
2. [Tech Stack](#tech-stack)
3. [Hosted Instance](#hosted-instance)
4. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
5. [Roadmap](#roadmap)
   - [Current Status](#current-status)
   - [Future Enhancements](#future-enhancements)
6. [Our Team](#our-team)
7. [License](#license)

---

## Overview

RePlate is a Nuxt web application designed to help users manage their food waste by analyzing recipes and suggesting ways to use leftover ingredients. It features a user-friendly interface, an enourmous recipe database of 6871 recipes, selectable search filters and uses suitable algorithms and remote procedure calls to provide users a better way to replate their leftovers.

**Hosted Instance:** RePlate is deployed to Netlify at [replate.thenoton.com](https://replate.thenoton.com).

### Problem

Food waste is a pressing global issue, contributing significantly to environmental degradation, depletion of natural resources, and economic strain. Discarding edible food not only wastes the food itself but also the valuable water, energy, and labor invested in its production. At the household level, the improper use of available ingredients often leads to daily challenges such as budget imbalances, unnecessary wastage, and reliance on unhealthy fast food—especially among individuals with busy lifestyles who struggle to plan meals with what's already at hand.

As the global population continues to rise, so does the demand for food production. This makes it increasingly important for every individual to take responsibility for consuming and utilizing food efficiently.

### Solution

In this context, RePlate emerges as a smart solution to tackle household food waste. Through its intelligent recipe suggestions based on available ingredients, RePlate helps users make the most of what they already have. By doing so, it not only reduces food wastage but also supports better grocery planning and promotes healthier eating habits.

---

## Tech Stack

#### Frontend

[![Nuxt.js](https://img.shields.io/badge/Nuxt.js-00DC82?style=flat-square&logo=nuxt&logoColor=white)](https://nuxt.com/) [![Vue.js](https://img.shields.io/badge/Vue.js-4FC08D?style=flat-square&logo=vuedotjs&logoColor=white)](https://vuejs.org/) [![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=flat-square&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/) [![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=typescript&logoColor=white)](https://www.typescriptlang.org/) [![Nuxt UI](https://img.shields.io/badge/Nuxt_UI-0275d8?style=flat-square&logo=nuxt)](https://ui.nuxt.com/)

#### Backend & Auth

[![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=flat-square&logo=supabase&logoColor=white)](https://supabase.com/)

#### Database

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white)](https://www.postgresql.org/)

#### Deployment

[![Netlify](https://img.shields.io/badge/Netlify-00C7B7?style=flat-square&logo=netlify&logoColor=white)](https://www.netlify.com/)

---

## Hosted Instance

RePlate is deployed to Netlify at [replate.thenoton.com](https://replate.thenoton.com).

**`NOTE`**: This project uses [Supabase](https://supabase.com) for [authentication](https://supabase.com/auth) and [database](https://supabase.com/database)([PostgreSQL](https://www.postgresql.org)) services. If you encounter issues with authentication or database-related functions, please visit [Supabase Status](https://status.supabase.com) to check if Supabase services are fully operational. Also, Supabase by default imposes rate-limits to 2 emails/hour, unless increased manually. Note that we are not affiliated with Supabase, and any outages or disruptions related to Supabase are beyond our control.

---

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v16 or later)
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/)

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/sannidhyaroy/RePlate.git
    cd RePlate
    ```
2.  Install node modules:
    ```bash
    npm install
    ```
3.  Configure a Supabase Project:
    - From the [Supabase Dashboard](https://supabase.com/dashboard/projects), select `New Project`.
    - Follow the on-screen instructions to choose your Organization, enter a Project name, a database password and your region (preferably closest to you for lower latency).
    - Keep the default Security Options and Advanced Configuration, and click on `Create Project`.
4.  Note your API details:
    - Select your Supabase Project from the [Supabase Dashboard](https://supabase.com/dashboard/projects).
    - Navigate to `Project Settings` from the left toolbar menu.
    - Navigate to the `Data API` page under `Configuration` from the left sidebar.
    - Note the Project URL, it's the RESTful endpoint for querying and managing your database. You'll need this later.
      Under Project API Keys, note your anon key, you'll need this key to connect to your database later.
5.  Setup Environment Variables:
    ```bash
    cp -v .env.example .env
    ```
    - Paste the Project URL from the above step into `SUPABASE_URL`.
    - Paste your anon key from the above step into `SUPABASE_KEY`.
    - It's recommended to lockdown file permissions of your environment file, as it contains confidential information like api keys. On a POSIX-compliant shells (like bash or zsh), you can use the following command:
      ```bash
      chmod 600 .env
      ```
6.  Setup PostgreSQL:
    - For detailed instructions on setting up the database, refer to the [Database README](./database/README.md).
7.  Test it out:
    - To preview, you can run the application in dev mode:
      ```bash
      npm run dev
      ```
    - Open your browser and navigate to `localhost:3000` to see the application in action.

---

## Roadmap

#### Current Status

- RePlate uses intelligent algorithm to suggest recipes with step-by-step preparation methods using the leftover ingredients available along with preparation time, cooking time, cuisine type, and various other in-depth metadata.
- It includes a secure authentication and login system to ensure personalized access for each user.

#### Future Enhancements

- Seperate `profiles` table in PostgreSQL to store user preferences, choices, custom recipes and track cooking history.
- Maintain a record of favorite dishes for quick future access for users
- Tracking algorithms for user preferences and choices to recommend custom-tailored recipes.
- Integrate with APIs for integrated features like diet-planning, pantry management, etc.

---

## Our Team

RePlate is a collaborative effort by a team of passionate developers and designers:

- **Sannidhya Roy** [![GitHub](https://img.shields.io/badge/--black?style=flat-square&logo=github&logoColor=white)](https://github.com/sannidhyaroy)  
  _frontend, backend, authentication, database, deployment and project management_
- **Anshul Ivan Ekka** [![GitHub](https://img.shields.io/badge/--black?style=flat-square&logo=github&logoColor=white)](https://github.com/Anxhul10)  
  _frontend development_
- **Soumyadeep Dutta** [![GitHub](https://img.shields.io/badge/--black?style=flat-square&logo=github&logoColor=white)](https://github.com/SimpleMan05)  
  _ideation, design and documentation_

---

## License

RePlate is licensed under the [GNU General Public License (GPL) v3.0](https://github.com/sannidhyaroy/RePlate/blob/main/LICENSE).

---
