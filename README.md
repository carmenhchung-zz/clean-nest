# CLEAN NEST

## Table of Contents

[OVERVIEW](#overview)  
[BUSINESS PROBLEM](#businessproblem)   
[BUSINESS SOLUTION](#businesssolution)  
[PROJECT PLANNING](#businesssolution)
* [User Stories](#userstories)


<a name="overview"/></a>
## OVERVIEW


Clean Nest is two-way market place that aims to be the leading provider of household cleaning services in Australia. It can be found online [here](www.clean-nest.herokuapp.com).

Clean Nest allows identity-verified cleaners to select the dates that they are available for cleaning, as well as the location they prefer to clean in, and set their own hourly rate. The platform also allows customers to search cleaners by availability and location (searching within a 20km radius of their specified location) and book their services. Further, customers can create home profiles with fields such as address and cleaning instructions filled in, so they can be reused and sent through to the cleaner that has been booked. While the cleaners and customers can communicate via an internal messaging system on the platform, both the booking and payment process is handled by Clean Nest. Finally, both cleaners and customers can review each other upon completion of a booking.

<a name="businessproblem"/></a>
## BUSINESS PROBLEM

The Australian Bureau of Statistics reports that the number of households in Australia is projected to increase around 50% from 2011 until 2036, and that the net worth of households will continue to grow. Similarly, despite relatively high labor costs in Australia, research firm IbisWorld predicts significant growth in the household cleaning market due to the aging and growing Australian population, increasing number of households, and greater disposable income. In 2014-2015, the residential cleaning service industry had a market size of around $711 million, and it is forecast to continue growing steadily over the next five years, with revenue rising at an annualized 1.7% to reach around $900m in 2019-20.

Currently, the household cleaning market in Australia is dominated by agencies and small business owners, many of which do not offer an online booking platform. For the booking platforms that do exist, they are run by specific agencies; they are not designed for individual cleaners, which means that cleaners (or those looking for casual work such as students) are required to sign up with an agency before they are able to offer their services, and are unable to dictate their own hourly rate.

The agency is given full control over which cleaner they send for each booking, and takes a significant commission (estimated to be around 40% of the fee charged to the customer - as opposed to Clean Nest's proposed 8% fee). From the customer's perspective, there is no transparency over which cleaner they are provided with, as there is no peer-review or star rating system. Even platforms like [Helpling](www.helpling.com.au), which do allow you to view cleaner profiles, only allow you to do so if you have a subscription package with them. Finally, booking through a cleaning agency can be burdensome, sometimes requiring more than two days' advance notice.


<a name="businesssolution"/>
## BUSINESS SOLUTION
</a>

Clean Nest will offer a platform that provides greater access, transparency, accountability and flexibility for both cleaners and customers. For example, it intends to charge a low 8% fee on all transactions through Stripe payment system, which allows cleaners to earn more than what they would usually receive through agency work (upwards of $5 per hour more), and gives them flexibility to adjust their rates accordingly. This is also attractive to customers, who are offered a competitive pool of qualified cleaners.

In addition, Clean Nest offers identification screening. Users who have uploaded their identification on the platform have a green "verified" tick appearing beside their name. At a later stage, Clean Nest staff will be verifying identities efficiently through the admin panel, with police checks being arranged. As mentioned above, a rating and review system will be implemented at a later stage for both cleaners and customers, in order to offer accountability to both parties.

Finally, Clean Nest will offer complimentary insurance to its customers, which covers damage to broken or stolen goods (up to AU$1 million), as well as insurance to the cleaners for on-the-job injuries. This will come at no extra cost to either cleaner or customer; instead, it will cost the business approximately $500 per month.

<a name="projectplanning"/>
## PROJECT PLANNING
</a>

### User Stories

Below are the user stories created for the project, divided into customer and cleaner.

### Workflow Diagram & Project Plan

Below is a workflow diagram of the user journey, with project plan and estimation.

### Wireframes

Below are wireframes for at least five screens.

### Entity Relationship Diagram (ERD)

Below is the ERD that was prepared for the project.

<a name="projectplanning"/>
## TOOLS & METHODOLOGIES

- [x] Trello was used to track progress of build (see Project Plan above).
- [x] Code was reviewed by myself, other students, and the teachers.
- [x] Frequent commits (over 100), pull requests, and documentation updates were made.
- [x] Agile development methodologies were utilised.
- [x] Rails conventions and code quality tools (like RuboCop) were used.
- [x] Postgresl database was used.
- [x] APIs such as Google maps API, Cloudinary API, and Mailgun API were used. The latter two API keys were stored in environment variables.
- [x] For functionality, gems such as geocoder (for Google maps), geocomplete (for autocompleting address searches), Bootstrap (for CSS formatting), devise (for login authentication), toastr (for customising the alerts/messages shown to the user), shrine and cloudinary (for image upload and saving with Heroku), jquery-ui-sass-rails (for the date picker), and ransack (for search functionality).
- [x] For testing, rspec-rails, rails-controller-testing, and dotenv-rails were used. Testing was done specifically on the search functionality in the pages controller to check the results of the following: (i) when

## KEY FEATURES

* Sign up / Log in (using Devise).
* Editing profile (including uploading an avatar as well as identification documentation such as a passport).
* Identification verification (with a green tick appearing beside the usernames of those who have uploaded identification documents)
* Authorisation restrictions (for example, users who have not signed up can search for cleaners, but they cannot view their profiles or message them. This is to ensure that people do not circumvent the platform by trying to contact the cleaners through the application without having signed up beforehand. Users also cannot edit other user's availabilities, and cannot book themselves.)
* Search functionality
* Internal messaging system was made available - users can see all their conversations with multiple users, and can click on each conversation to view all the messages (plus message users and delete their own messages).
* Payment system was implemented using Stripe.

## Further Work

Additional features that are to be developed include:

- the ability for the cleaner to specify times when they are available / ability for the customer to specifty times when they wish to book a cleaner;
- a GPS based check in / check out system where the cleaner can check in and out of the apartment so that the customer has a record of when they have arrived and when they have left; and
- the ability for the cleaner to adjust the hourly rate depending on the date (for example, charge extra on weekends).
