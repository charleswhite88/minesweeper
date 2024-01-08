# Minesweeper Board Generator App

## Introduction

This application empowers users to create custom Minesweeper boards with ease. By providing basic details like dimensions and the number of mines, users can generate a board, view it, and explore a collection of previously created boards.

## System Prerequisites

- Ruby (3.1.3)
- Rails (>= 7.0.4.3)
- PostgreSQL (14.8)

## Installation Guide

Follow these steps to set up and run the Minesweeper Board Generator App:

1. Clone the repository:

   ```bash
   git clone https://github.com/sagar381/minesweeper.git
   cd minesweeper
   ```

2. Install Dependencies:

   ```bash
   bundle install
   ```

3. Database Setup:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. (Optional) Seed the database with some sample data:

   ```bash
   rails db:seed
   ```

5. Start the Rails server:

   ```bash
   rails server
   ```

6. Open your web browser and visit `http://localhost:3000` to access the Minesweeper Board Generator App.

## How to Use

1. ### Create a Minesweeper Board:
    1. Enter your email, board dimensions, and mine count on the homepage.
    2. Click "Generate Board" to create and view your board.

2. ### Viewing Boards:

    1. Newly created boards are displayed with an X-Y grid representation.
    2. A list of the ten latest boards is available on the homepage.

3. ### Detailed Board Views:

    1. Click on a board's title to view its detailed layout.
    2. "View All Generated Boards" offers a comprehensive list of all boards.

## Architecture

This app utilizes a modular, service-based architecture for the Minesweeper board generation algorithm. It's optimized for performance across various board sizes. The core algorithm outputs a two-dimensional array, representing the pre-game state of a Minesweeper board.

## System Tests

Minesweeper Board Generator comes with comprehensive system tests implemented using RSpec. These tests cover user interactions like board generation, ensuring a seamless and error-free user experience.

## Enhancements and Customization
Feel free to personalize the app with additional features such as pagination, search, or filters. These are not mandatory for the basic functionality but are welcomed for showcasing your skills or enhancing user experience.

By following these guidelines, you'll have a fully functional and user-friendly Minesweeper Board Generator at your fingertips. Enjoy creating and exploring Minesweeper boards like never before!
