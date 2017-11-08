# CLEAN NEST

## Table of Contents

[OVERVIEW](#overview)  
[BUSINESS PROBLEM](#businessproblem)   
[BUSINESS SOLUTION](#businesssolution)  
[PROJECT PLANNING](#businesssolution)
* [User Stories](#userstories)


<a name="overview"/>
## OVERVIEW
</a>

Clean Nest is two-way market place that aims to be the leading provider of household cleaning services in Australia.

Clean Nest allows identity-verified cleaners to select the dates that they are available for cleaning, as well as the location they prefer to clean in, and set their own hourly rate. The platform also allows customers to search cleaners by availability and location (searching within a 20km radius of their specified location) and book their services. While the cleaners and customers can communicate via an internal messaging system on the platform, both the booking and payment process is handled by Clean Nest. Finally, both cleaners and customers can review each other upon completion of a booking.

<a name="businessproblem"/>
## BUSINESS PROBLEM
</a>

The Australian Bureau of Statistics reports that the number of households in Australia is projected to increase around 50% from 2011 until 2036, and that the net worth of households will continue to grow. Similarly, despite relatively high labor costs in Australia, research firm IbisWorld predicts significant growth in the household cleaning market due to the aging and growing Australian population, increasing number of households, and greater disposable income. In 2014-2015, the residential cleaning service industry had a market size of around $711 million, and it is forecast to continue growing steadily over the next five years, with revenue rising at an annualized 1.7% to reach around $900m in 2019-20.

Currently, the household cleaning market in Australia is dominated by agencies and small business owners, many of which do not offer an online booking platform. For the booking platforms that do exist, they are run by specific agencies; they are not designed for individual cleaners, which means that cleaners (or those looking for casual work such as students) are required to sign up with an agency before they are able to offer their services, and are unable to dictate their own hourly rate.

The agency is given full control over which cleaner they send for each booking, and takes a significant commission (estimated to be around 40% of the fee charged to the customer - as opposed to Clean Nest's proposed 8% fee). From the customer's perspective, there is no transparency over which cleaner they are provided with, as there is no peer-review or star rating system. Even platforms like Helpling[www.helpling.com.au], which do allow you to view cleaner profiles, only allow you to do so if you have a subscription package with them. Finally, booking through a cleaning agency can be burdensome, sometimes requiring more than two days' advance notice.


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

### Workflow Diagram

Below is a workflow diagram of the user journey.

### Wireframes

Below are wireframes for at least five screens.


Entity Relationship Diagram (ERD).
Project plan and estimation.


## TOOLS & METHODOLOGIES

Tools and methodologies
Trello or similar project management tool to be used to track progress of build.
Code review. Demonstrate that you have had your code reviewed by other students and that you have provided a code review for others.
GitHub. Demonstrate use of frequent commits, pull requests, documentation.
Use Agile development methodologies.
Provide evidence you have used code quality tools (eg. Traceroute, Bullet, Brakeman, Rails Best Practices tool, RuboCop, RubyCritic, CodeClimate).


## CODING


- [x]


Rails application code
Demonstrate Ruby on Rails development skills.

Create your application using Ruby on Rails.
Demonstrate knowledge of Rails conventions.
Use postgresql database in development.
Use an API (eg. Omniauth, Geocoding, Maps, other..).
Use appropriate gems.
Use environmental variables to protect API keys etc. (dotenv)
Implement a payment system for your product. (e.g. Stripe)
Your app must send transactional emails (eg. using Mailgun).
Your app should have an internal user messaging system.
Your app will have some type of searching, sorting and/or filtering capability.
Your app will have some type of file uploading capability (eg. images).
Your app will have authentication (eg. Devise, must have full functionality in place).
Your app will have authorisation (users have restrictions on what they can see and edit).
Document your application with a README that explains how to setup, configure and use your application.

Deployed application
Your application is to be deployed to Heroku (recommended) or AWS.

## Further Work


Additional features that are to be developed include:

- the ability to specify times when the cleaner is available / when the customer wishes to book a cleaner;
- a GPS based check in / check out system where the cleaner can check in and out of the apartment so that the customer has a record of when they have arrived and when they have left.
