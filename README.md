# Backend Challenge: Transfer System (Pure Ruby) 💎

This project was developed as a practical study of Programming Logic and Object-Oriented Programming (OOP) using Ruby. The main goal was to implement a financial transaction system (fintech-style) without using frameworks (such as Ruby on Rails), focusing on understanding how things work "under the hood".

## 🚀 The Challenge

The system simulates a payment platform featuring two types of users: **Common Users** and **Merchants**.

### Implemented Business Rules:

* **Unique Registration:** The system prevents the registration of duplicate emails or CPFs/CNPJs by utilizing class variables (`@@`) to simulate in-memory persistence.
* **Account Types:**
* **Users:** Can both send and receive money.
* **Merchants:** Act strictly as receivers and cannot perform transfers.


* **Balance Validation:** Before any transaction, the system validates whether the sender has a sufficient balance.
* **External Authorization:** The system queries a mocked external authorization service via HTTP before finalizing any transfer.
* **Notifications:** Upon receiving funds, the system simulates sending a notification to the recipient via a POST request.

## 🏗️ Architecture & Technical Decisions

For this project, I chose an approach that prioritizes maintainability and decoupling:

* **Inheritance & Polymorphism:** Utilized a base class `Account` for shared attributes, while `User` and `Merchant` inherit specific behaviors, avoiding code duplication (DRY).
* **Encapsulation:** Used `private` methods to ensure internal logic (such as format validations) cannot be accessed inappropriately from outside the class.
* **Service Objects (Study):** Separated external API communication logic (`Net::HTTP`) into specialized methods, preparing the codebase for future refactoring into dedicated service classes.

## 🛠️ Technologies Used

* **Ruby** (Version 3.x recommended)
* **Net::HTTP** (Standard library for making HTTP requests)
* **JSON** (For parsing API responses)
