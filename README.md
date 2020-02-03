<h1 align="center">[Ruby] Capstone Project / Create your own Linter </h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT " src="https://img.shields.io/badge/License-MIT -yellow.svg" />
  </a>
  <a href="https://twitter.com/ae_cordova" target="_blank">
    <img alt="Twitter: ae_cordova " src="https://img.shields.io/twitter/follow/ae_cordova .svg?style=social" />
  </a>
</p>


## Description of the project 

>The purpose of this project is to create a basic Linter that can  detect errors on spacing, indentation and line format.
><br>In this case I chose CSS as the language to inspect. 
><br>Style checks are based on an unnoficial style guide provided by Paul G Allen School, you can visit the link here: [CSE 154 — Unofficial Style Guide
](https://courses.cs.washington.edu/courses/cse154/17au/styleguide/html-css/spacing-indentation-css.html#indentation)

<br><h3 align="center">Style Rules</h3>
**Indentation:** 
<br><li> 2 space indentation or 'soft tabs' for each level

```
bad code :(

div {
 font-size: 18pt;
  color: #222222;
}

  img {
width: 50%;
  }

good code:

div {
  font-size: 18pt;
  color: #222222;
}

img {
  width: 50%;
}
```
**Line Format:** 
<br><li>Just one line per rule
<br><li>Place an empty line between blocks 
```
bad code :(

a { color: #111111;
    font-size: 16pt;
}
div {
  color: #222222; font-size: 18pt;
}

good code

a {
  color: #111111; 
  font-size: 16pt; 
}

div {
  color: #222222; 
  font-size: 18pt; 
}
```
**Spacing:**
<br><li>Line break after a { or }, and between each property declaration.
<br><li>Spaces between selectors and { } 
<br><li>Space after a colon or a comma. 
```
bad code :(

p,h1{color:red; font-family:serif; font-size:16pt;}
a {text-decoration:none}

good code

a {
    text-decoration: none;
}

h1, p {
    color: red;
    font-family: serif;
    font-size: 16pt;
}
```
## ⭐️ How it works
```
The linter scans file line by line  looking for key characters,
if a certain rule corresponding to each character is not  complied with, it prints an error.

The error message will give you the line number and where applicable, the column it appears at

These  are the possile erros you may encounter:
 - Wrong Indentation, expected X spaces
 - Spacing, expected single space before '{' and'('
 - Spacing, expected single space after ')', ':' and ','
 - Line Format, Expected line break after '{', '}' and ';'
 - Line Format, Expected one empty line after '}'

*Go to Instructions section for an example
```


## Built with
<ul>
  <li>Ruby</li>
</ul>

## Dev Environment Requirement:
Ruby needs to be installed to run the code check [here](https://www.ruby-lang.org/en/documentation/installation/) for further steps

## ⭐️ Running the code
```
Inside The project Repository run the following command in the "Command line":
> bin/main.rb
```
## ⭐️ Instructions

1. Clone the repo
2. Navigate to the bin folder and run 
```
$ ruby main.rb [path-to-file]

for example:

    $ ruby main.rb ../example.css
```
2. Program will scan the file and show you the errors 

![Screenshot](linter_shot.png)

<!-- CONTRIBUTING -->
## Contributing

Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Author

👤 **Angel Cordova** 

* Github: [@aecordova](https://github.com/https:\/\/github.com\/aecordova)  
