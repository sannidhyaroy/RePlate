 ![App Logo](https://github.com/sannidhyaroy/RePlate/blob/main/public/logo.png) 
# RePlate
### _ReFill your plate with LeftOvers_ 🍽️


RePlate is a smart web application designed to help users manage their food waste by analyzing recipes and suggesting ways to use leftover ingredients. It features a user-friendly interface, a recipe database, and integration with suitable algorithm to provide users the exact solution to their problem.

## Table of Contents
* [The Problem We Solve](#the-problem-we-solve)
* [Features](#features)
* [Tech Stack](#tech-stack)
* [Deploy Link](#deploy-link)
* [How to Run Locally](#how-to-run-locally)
    * [Prerequisites](#prerequisites)
    * [Installation](#installation)
    * [Set up Supabase Environment Variables](#supabase-environment-variables)
    * [Run the development server](#run-the-development-server)
* [Project Status & Future Enhancements](#project-status--future-enhancements)
* [Our Team](#our-team)
* [License](#license)


## The Problem we Solve
Food waste is a pressing global issue, contributing significantly to environmental degradation, depletion of natural resources, and economic strain. Discarding edible food not only wastes the food itself but also the valuable water, energy, and labor invested in its production. At the household level, the improper use of available ingredients often leads to daily challenges such as budget imbalances, unnecessary wastage, and reliance on unhealthy fast food—especially among individuals with busy lifestyles who struggle to plan meals with what's already at hand.  

As the global population continues to rise, so does the demand for food production. This makes it increasingly important for every individual to take responsibility for consuming and utilizing food efficiently.  

### Solution 
In this context, RePlate emerges as a smart solution to tackle household food waste. Through its intelligent recipe suggestions based on available ingredients, RePlate helps users make the most of what they already have. By doing so, it not only reduces food wastage but also supports better grocery planning and promotes healthier eating habits.  

    

## Features
  The current version of RePlate has these features:
  - **User Registration with Email Verification:** New users can sign up securely, with a verification process to confirm their email.
  - **Login for Returning Users:** Registered users can easily log in to access their personalized experience.
  - **Smart Recipe Search:** Users input their available leftover ingredients and receive a curated list of possible recipes tailored to what's on hand



## Tech Stack

#### FRONTEND
[![Nuxt.js](https://img.shields.io/badge/Nuxt.js-00DC82?style=flat-square&logo=nuxt.js&logoColor=white)](https://nuxt.com/)     [![Vue.js](https://img.shields.io/badge/Vue.js-4FC08D?style=flat-square&logo=vuedotjs&logoColor=white)](https://vuejs.org/)     [![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=flat-square&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)       [![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)      [![Nuxt UI](https://img.shields.io/badge/Nuxt_UI-0275d8?style=flat-square)](https://ui.nuxt.com/) 
    

#### BACKEND
[![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=flat-square&logo=supabase&logoColor=white)](https://supabase.com/)


#### DATABASE
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
#### DEPLOY
[![Netlify](https://img.shields.io/badge/Netlify-00C7B7?style=flat-square&logo=netlify&logoColor=white)](https://www.netlify.com/)
  

## Deploy Link

*RePlate has been deployted on Netlify  
*Link to the app   :   [RePlate]()


## How to Run Locally?
### Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v16 or later)
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/)


### Installations


1.  Clone the repository:
    ```bash
    git clone https://github.com/sannidhyaroy/Ankaa.git
    cd Ankaa
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
    - Paste the Project URL from the above step into `VITE_SUPABASE_URL`.
    - Paste your anon key from the above step into `VITE_SUPABASE_ANON_KEY`.
    - It's recommended to lockdown file permissions of your environment file, as it contains confidential information like api keys. On a bash shell, you can use the following command:
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


## Project Status and Future Enhancements

- #### Current Status ✅
    - RePlate intelligently suggests recipes along with step-by-step preparation methods using the leftover ingredients available.
    - It includes a secure authentication and login system to ensure personalized access for each user.
- #### Future Enhancements 🕒
    - enhancing UI/UX
    - proper user profile record
    - maintain a record of favored dishes for quick future access for users
    - Tracks user preferences and choices to recommend custom-tailored recipes
    - adding premium features like diet-planning, pantry management, etc


## Our Team
The contributors of this project are :
* **Sannidhya Roy** [![GitHub](https://img.shields.io/badge/--black?style=flat-square&logo=github&logoColor=white)](https://github.com/sannidhyaroy/)  
_handling the frontend,backend development, authentication and deployment_  
* **Anshul Ivan Ekka** [![GitHub](https://img.shields.io/badge/--black?style=flat-square&logo=github&logoColor=white)](https://github.com/Anxhul10/)  
 _handling the frontend development_  
* **Soumyadeep Dutta** [![GitHub](https://img.shields.io/badge/--black?style=flat-square&logo=github&logoColor=white)](https://github.com/SimpleMan05/)  
 _handling the ideation, design and management_  


## License
RePlate is licensed under the [GNU General Public License (GPL) v3.0](https://github.com/sannidhyaroy/RePlate/blob/main/LICENSE).

