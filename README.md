# Career Connect Project

**Career Connect** is a full-stack job-seeking platform designed to connect candidates and employers, streamlining job discovery and application processes. The platform incorporates advanced features such as automated skill matching, real-time messaging, and secure authentication.

**Working Video:** https://youtu.be/j2N_ow5lPnA

![image](https://github.com/user-attachments/assets/9ce3616c-9492-464e-abaf-aec9d7d71352)

## **Features**

1. **Authentication and Role-Based Access**:
   - Implemented secure login and role-based access using the `Devise` gem.
   - Ensures data protection and tailored user experiences for recruiters and candidates.

2. **Automated Skill Matching**:
   - Designed a system to automatically match job posts and applicants when skill alignment exceeds 80%.
   - Optimizes recruitment efficiency and reduces manual effort.

3. **Real-Time Notifications**:
   - Integrated `Action Mailer` to send real-time notifications about job matches and profile updates.

4. **User-Friendly UI**:
   - Built with **Ruby on Rails**, **HTML**, **Bootstrap**, **CSS**, and **JavaScript** to provide a clean, responsive interface.


---

## **Tech Stack**

- **Backend**: Ruby on Rails
- **Frontend**: React, Bootstrap, HTML, CSS, JavaScript
- **Database**: PostgreSQL (Production), SQLite3 (Development)
- **Real-Time Features**: Action Cable, Redis
- **Authentication**: Devise gem
- **Image Handling**: Shrine gem
- **Pagination**: Will Paginate gem

---

## **Installation Instructions**

Follow these steps to install and run the Career Connect application:

### **1. Prerequisites**
Ensure you have the following installed:
- **Ruby**: Version `2.7.0`
- **Rails**: Version `~> 7.0.5`
- **Bundler**: Install using `gem install bundler`
- **Node.js** and **Yarn**: Required for frontend assets.
- **PostgreSQL**: For production database.

---

### **2. Clone the Repository**

### **3. Install Dependencies**

Run the following commands:

```bash
bundle install
yarn install
```

---

### **4. Database Setup**

For **development** and **test** environments, use SQLite3. For **production**, configure PostgreSQL.

**Development Setup**:
```bash
rails db:create
rails db:migrate
rails db:seed
```

**Production Setup**:
Ensure you have PostgreSQL installed and configured, then run:
```bash
RAILS_ENV=production rails db:create
RAILS_ENV=production rails db:migrate
```

---

### **5. Start the Server**

Run the Rails server:
```bash
rails server
```

The application will be available at `http://localhost:3000`.

---

### **6. Run Tests**

To ensure everything works correctly, run the test suite:
```bash
rails test
```

---

## **Gemfile**

A brief overview of the important gems used in this project:

- **Devise**: For authentication and role-based access.
- **Will Paginate**: To add pagination functionality.
- **Action Mailer**: For real-time notifications via email.
- **Action Cable**: To implement real-time messaging.
- **Shrine**: For image uploads and processing.
- **Turbo Rails**: For SPA-like experience using Hotwire.

---

## **Some Images and Key Functionalities **

![image](https://github.com/user-attachments/assets/9ce3616c-9492-464e-abaf-aec9d7d71352)

1. **Job Posts**:
   - Recruiters can post jobs with required skills and descriptions.
   ![image](https://github.com/user-attachments/assets/5c96e9d1-6193-4d7e-83bf-f3d7e17c57b4)

2. **Candidate Profiles**:
   - Candidates can create profiles, add skills, and upload resumes.

3. **Automated required Skill Matching**:
   - Matches candidates to job posts if the skill alignment exceeds 80%.
   ![image](https://github.com/user-attachments/assets/79166db1-566c-4362-b455-5e047efa8466)

4. **Notifications**:
   - Sends real-time updates about job matches and profile changes.

5. **Chat System**:
   - Real-time communication between recruiters and candidates.
   ![image](https://github.com/user-attachments/assets/aecd85a3-d735-4dfa-bafd-3439b150a8b7)


---
Let me know if you'd like any modifications or additions!
