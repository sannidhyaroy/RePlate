# Database Setup

This document provides instructions for setting up the database for the RePlate project. The database is hosted on Supabase, which provides PostgreSQL as a service with additional features like edge-functions, remote call procedures and row-level security.

---

## Prerequisites

Before setting up the database, ensure you have the following:

- A Supabase account. You can sign up at [Supabase](https://supabase.com) or Self-Host [Supabase](https://supabase.com/docs/guides/self-hosting) and [Supabase Studio](https://supabase.com/blog/supabase-studio) on your own infrastructure.

---

## Set Up the Database

### 1. Create a New Supabase Project

1. Log in to the [Supabase Dashboard](https://supabase.com/dashboard/projects).
2. Click on `New Project`.
3. Enter the project details:
   - **Organization**: Select your organization.
   - **Project Name**: Enter a name for your project.
   - **Database Password**: Set a secure password for your database.
   - **Region**: Choose a region close to your location for better performance.
4. Click `Create Project`.

### 2. Import the Schema

1. Open a new query tab in the `SQL Editor`.
2. Copy the contents of the `schema.sql` file from this repository.
3. Paste the SQL commands into the editor and click `Run`.

### 3. Import the Recipes Dataset

1. Access the `Table Editor` page of your Project in Supabase.
2. Select the `recipes` table.
3. From the `Import` button dropdown, select `Import data from CSV`.
4. Drag and drop the `recipes.csv` file under the `database` folder of this repository into the import area.
5. Deselect the `id` column option if it is selected as we don't want to import the `id` column.
6. Click `Import data` to upload the dataset.

### 4. Upload Columns

1. Open a new query tab in the `SQL Editor`.
2. Copy the contents of the `update.sql` file.
3. Paste the SQL commands into the editor and click `Run`.

### 5. Set Up Indexing

1. Open a new query tab in the `SQL Editor`.
2. Copy the contents of the `index.sql` file.
3. Paste the SQL commands into the editor and click `Run`.

### 6. Generate Supabase Remote Call Procedures

1. Open a new query tab in the `SQL Editor`.
2. Copy the contents of the `rpc.sql` file.
3. Paste the SQL commands into the editor and click `Run`.

---

For more details about the RePlate project, refer to the main [README](../README.md).
