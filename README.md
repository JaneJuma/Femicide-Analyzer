<p align="center">
  <img src="public/images/femicide-logo.png" alt="Femicide Analyzer Logo" width="200"/>
</p>

# Femicide Crime Pattern Analyzer (Kenya)

This project is my final year school project developed using **Laravel 12**, **TailwindCSS**, and **MySQL**.  
It is a web application designed to collect, analyze, and report **femicide cases** in Kenya.  
The system allows reporting, tracking, and exporting of cases while providing useful statistics.

---

## 🚀 Features

-   📊 **Dashboard**

    -   Total reported cases
    -   Arrested perpetrators count
    -   Recent cases table
    -   Cases by County (charts)

-   📝 **Case Reporting**

    -   Add victim & perpetrator details
    -   Store incident details (date, method, OB number, description)
    -   Capture location (county & location type)

-   🔎 **Case Management**

    -   View all cases in card format
    -   Filter by **County, Age Range, and Location Type**
    -   Case details page

-   📤 **Export & Reports**
    -   Export cases as **CSV**
    -   Export cases as **PDF**

---

## 📽️ Demonstration Video

👉 [Watch Demo on YouTube](https://youtube.com/your-demo-link-here)

---

## 🛠️ Tech Stack

-   **Backend:** Laravel 12 (PHP)
-   **Frontend:** TailwindCSS
-   **Database:** MySQL
-   **Exports:** Laravel DOMPDF (PDF), Native CSV

---

## ⚙️ Installation

Clone the repository:

```bash
git clone https://github.com/JaneJuma/Femicide-Analyzer.git
cd Femicide-Analyzer
```

Install dependencies:

composer install
npm install && npm run build

Setup environment:

cp .env.example .env

Configure database in .env file:

DB_DATABASE=femicide_analyzer
DB_USERNAME=root
DB_PASSWORD=

Run migrations & seeders:

php artisan migrate --seed

Serve the application:

php artisan serve

Visit http://127.0.0.1:8000

📂 Project Structure

app/Models → Eloquent models (Victim, Perpetrator, CaseModel, Location)

resources/views → Blade views with TailwindCSS

app/Http/Controllers → Handles logic (Dashboard, Cases, Export)

✨ Future Improvements

User authentication & roles (Admin, Researcher, Public Reporter)

Advanced analytics & data visualization

Integration with government open data sources

👨‍💻 Author

Jane Juma – GitHub Profile: https://github.com/JaneJuma
