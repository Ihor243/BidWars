# BidWars

> *"An auction where every bid changes the game"*  
> A group project by Ihor and Artem

---

## About the Project

This project solves the problem of lack of structure and anarchy inside a regular Telegram chat, which this auction used to be before.

This console application is much better than Google Sheets, Excel, and other tools because it combines everything in one place. It is a universal, convenient platform for both collectors and private clubs, where users can create a lot and place bids on it in a single location without losing any data.

---

## Installation and Usage

**Requirements:**
* Ruby version `4.0.7`

**Steps to run:**

1. Install all required gems (they are already listed in the `Gemfile`):
   ```bash
   bundle install
   ```

2. Create an administrator:
   ```bash
   rake create_admin
   ```
   > **Note:** After this command, only `user.yml` with the admin will be created. `lots.yml` and `bids.yml` will be created automatically when the project is launched. No folders need to be created manually.

3. Launch the application:
   ```bash
   ruby index.rb
   ```

---

## Project Architecture & Tech Stack

### Project Structure

```text
├── app/
│   ├── entities/        # contains all entities; each file is responsible for its own entity
│   └── render.rb        # responsible for the program output
├── database.rb          # contains all system methods
├── logic_render.rb      # responsible for the program output
├── admin_menu.rb        # responsible for the admin role menu
├── guest_menu.rb        # responsible for the guest role menu
├── user_menu.rb         # responsible for the user role menu
└── index.rb             # the main orchestrator that runs the application
```

### Technologies

* **Data storage:** `.yml` files
* **Testing & Linting:** RSpec, RuboCop

---

## Contributing

Please create new branches using the following format:

```bash
git checkout -b main/<your-branch-name>
```
