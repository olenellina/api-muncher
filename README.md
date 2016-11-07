## Reflection:

1. What do you understand better after doing this project?
I definitely understand APIs much better after this project. I also feel like I understand Rails better as well. This is mostly because I decided to start the project over on Thursday, so I got extra practice in having to set the project up again :) Prior to Thursday, I was struggling to connect the Lib folder files with the Rails MVC model, so I decided to try and do the project utilizing a model to understand how they would work together. In retrospect, a model is not needed, so I'll probably spend some time this week reverting back to my previous version. Other than that, I finally got the Foundation grids to work on my recipe show page! So that was a great learning experience as well. 

2. What do you want more practice with?
I would like more practice with APIs - it's a critical concept and I'm excited to finally be learning about them. I'd also like more practice in learning and understanding how the Lib folder relates to the MVC framework. 

3. What is something you saw done differently? 
During the project, there was a lot of great conversation amongst the students regarding their approaches, so I think I was inspired by a lot of what I heard. In particular, some of the students setup their page loads to be a new API call each time. I want to try to implement that as well!


# Recipe API Consumer

## Learning Goals:
- Configure an API for consumption
- Create authenticated API requests using HTTParty
- Consume JSON responses from an API
- Map response to application-specific data
- Separate API logic from application logic

## Purpose
Create a web application that will display recipes based on a search term. We will utilize an API from Edamam called the [Recipe Search API](https://developer.edamam.com/edamam-recipe-api).


### Baseline
Before you start writing _any_ code:

- Explore the API documentation to become familiar with the request(s) you can make
- If desired, create a Trello board to manage tasks

Once you've explored the API docs, this project:

- requires an individual **branch** and fork
- Use better_errors for debugging purposes
- requires you to create a Rails application
  - conform to Rails conventions on naming and inflection
  - by using `rails new .` you will create a new rails app _inside_ of the fork folder instead of creating a _new_ folder for your rails app
  
**You shall submit a pull request _with a meaningful pull request description_ once you are done with the baseline which shall be merged before moving onto implementing the requirements. _Do not push any additional code until your baseline PR has been merged_**


### Detailed Requirements  
**Search**:  
- The user shall type in a search term that will:
  - Make a request to the API using the search term
  - Display the results in a list to the user
  
**List View**:  
- This shall show a **paged** list of recipes for a given search term, _ten at a time_
- This view shall show the name of the recipe and the corresponding photo
- The view shall have a link from the recipe to a recipe show view

**Show View**:  
- This shall show the details about a given recipe. These details include:
  - Name
  - Link to the original recipe (opens in a new tab)
  - Ingredients
  - Dietary information
  
**Additional Requirements**:  
- One of the things that permits us to use this API, it providing attibution to the API's created. We must provide this somewhere on our site. Example locations include the footer or an about page. 
  - [Examples from the API site](https://www.dropbox.com/sh/ss34tnh4kyfxkxu/AADNJ_pB7Ou8_MVrYxgM4aQYa?dl=0&preview=Attribution+examples.pdf)
- You must also create tests for your API Wrapper & any classes as well as controller tests using VCR
- Your site must have a **responsive** look and feel, use semantic HTML as well as any grid formatting using Zurb Foundation

### Important Notes:
- Using this API as a developer limits the number of API calls in a month to 5000. This means that we must try to minimize API calls for testing purposes as much as possible, to ensure you do not exceed this number of API calls in the one week of development we have.


### Optional Requirements:
- Keep track of most recent search terms and allow user's to return to those searches
- Implement an OAuth strategy using Google
  - Allow users to save recipes to a "favorites" section that they can return to
-  Provide checkboxes or other controls to limit the search to options such as:
	-  Peanut Free
	-  Soy Free
	-  High Protein
	-  Etc
 
