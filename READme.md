Photo Shoot Appointment Database

Description:
My wife and I would like to start are own little side hustle booking, shooting, and selling photography mini sessions. Mini session is exactly what its sounds like: a smaller version of the portrait photo packages you see offered by photographers. This database is for storing data for each account, customer, event, location along with photo shoots that have been booked. Additionally, there is an customers_events that stores type of session and the price in which the photography package cost. 

  
    _______________________________________________________________________________
    |           API endpoints           |       Description                       |
    |___________________________________|_________________________________________|
    | http://localhost:5000/acconts     | Creates a user account                  |
    |___________________________________|_________________________________________|
    | http://localhost:5000/accounts/1  | Shows the stored data for the account   |
    |                                   | with the corresponding id               |
    |___________________________________|_________________________________________|
    | http://localhost:5000/accounts    | Indexes through all accounts            |
    |___________________________________|_________________________________________|
    | http://localhost:5000/accounts/2  | Updates the stored data for the account |
    |                                   | for a corresponding id                  |
    |___________________________________|_________________________________________|
    | http://localhost:5000/accounts/11 | Delets the stored data for the account  |
    |                                   | for a corresponding id                  |
    |___________________________________|_________________________________________|
    | http://localhost:5000/customers/1 | Shows the stored data for the customer  |
    |                                   | with the corresponding id               |
    |___________________________________|_________________________________________|
    | http://localhost:5000/customers   | Indexes through all customers           |
    |___________________________________|_________________________________________|
    | http://localhost:5000/customers/3 | Updates the stored data for the customer|
    |                                   | for a corresponding id                  |
    |___________________________________|_________________________________________|
    | http://localhost:5000/events/1    | Shows the stored data for events        |
    |                                   | with the corresponding id               |
    |___________________________________|_________________________________________|
    | http://localhost:5000/events      | Indexes through all events              |
    |___________________________________|_________________________________________|
    | http://localhost:5000/locations   | Indexes through all locaations          |
    |___________________________________|_________________________________________|
    | http://localhost:5000/photo_shoots| Indexes through all photo shoots        |
    |___________________________________|_________________________________________|

Retrospective answering of the following questions:

How did the project's design evolve over time?

As it pertains to the events table, the original ER Diagram only listed the event id and the appointment time. Over time I added the appointment date, location id, and photoshoot id, along with the duration or how long the photoshoot was scheduled for. 

Did you choose to use an ORM or raw SQL? Why?

I chose to use an ORM because I wanted more practice with Python. 

What future improvements are in store, if any?

I would like to create more API endpoints. For example when an accounts is created I would also like to add the customers first/last name along with their email address. 
