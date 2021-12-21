![microverse-logo](https://img.shields.io/badge/Microverse-blueviolet)

# My Blog App

This is my Blogs app where, you can find a warm environment for you to share cheap wisdom, enchanting crowds, and more. Users here are so competent that they can distribute wisdom without being consulted, they can make posts, receive commentaries on those posts, and receive likes.

## Built With

- Ruby
- Rails
- JavaScript
- HTML/CSS

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Git/GitHub;
- Optional ( IDE installed in your machine ) - recommended IDE: Vscode, Rubymine;
- Ruby Installed in your machine;
- Rails gem installed in your machine;

### Setup

- To clone this repo:
  - Open the Terminal(Mac/Linux) or the Cmd (Windows);
  - Navigate to where you want to paste the Repo folder;
  - Type `git clone https://github.com/Laylo309/My-blog-app.git`;
  - With you preffered IDE open the folder that you cloned before;
- Configuring DB access:
  - Inside the database.yml file modify the Env variables for getting the username and password to access psql database;
- Creating DB (if needed):
  - Run `rails db:create` to create a empty databse for the project.   
  
### Run Website  

- Run `rails s` for starting the server;
- Access [http://localhost:3000/](http://localhost:3000/) in a browser of your choice.
  
### Run Linters

- Run rubocop locally with: `Rspec .` to run all tests or `Rspec [file]` for testing a specific file;
- Run stylelint locally with : `npx stylelint "**/*.{css,scss}"` or `npx stylelint "**/*.{css,scss}" --fix` for autofixing errors.

### Run Tests

-  Run `rails spec`

## Author

👤 **Laylo Khodjaeva**

- GitHub: [@Laylo309](https://github.com/Laylo309)
- Twitter: [@Laylo](https://twitter.com/home?lang=en)
- LinkedIn: [LayloKhodjaeva](https://www.linkedin.com/in/laylo-khodjaeva-05a972207/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
