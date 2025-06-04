# Evolve fitness, story of a fresh start

## Sarah is one of our clients who wants a fresh start. She needs a robust MySQL database system, and we are the data guru she hired to build it!

## Steps we took in building the database of her dream is highlighted below:

- Started from scratch by highlighting the existing pen and paper documentation / inventory
- We gathered all the necessary data, colloacted and cleaned it
- The data where imported via MYSQL benchmark
- Had a meeting with Sarah to ensure that we are on same page with her dream database, she was happy with the design concept and logical ERD we gave her.

## Phase 1 of the project
Evolve Fitness SQL Project – Tier 1 Summary Presentation
Project Overview – Sarah's Vision

Sarah Michael, the new owner of Evolve Fitness, needed a fully digital database system to manage:

* Members
* Classes & Instructors
* Bookings
* Payments
* Membership Tiers

We were tasked with designing and implementing a MySQL database system to achieve this.

---

###  Entity Identification & Database Design

Core Entities:

1. Members – Tracks users who attend the gym
2. MembershipTiers – Each member belongs to one tier
3. Instructors – Trainers who run the classes
4. Classes – Unique fitness programs (e.g., Yoga)
5. ScheduledClasses – Specific date/time offerings of each class
6. Bookings – Tracks which members book which class session
7. Payments – Tracks all payment transactions by members

Relationships:

* Members 1:1 MembershipTiers
* Instructors 1\:N ScheduledClasses
* Classes 1\:N ScheduledClasses
* Members 1\:N Bookings
* ScheduledClasses 1\:N Bookings
* Members 1\:N Payments

Business Rules Implemented:

* No double booking of the same class
* MaxCapacity enforcement on class bookings
* Payment updates automatically refresh member status

---

###  Tier 1 Queries: Member Operations & Insights

Q1 – Active Members Info:

* Fetched FirstName, LastName, Email, and TierName where status is 'Active'.

Q2 – Expired Members Count:

* Counted all members with MembershipStatus = 'Expired'.

Q3 – Upcoming Payments:

* Listed members whose NextPaymentDueDate is on/before June 10, 2025.

Q4 – Recently Registered Members:

* Queried members who joined after January 1, 2025.

Q5 & Q6 – Name Filters:

* Used pattern matching (LIKE) to find names starting with 'S' or containing 'on'/'o'.

---

###  Class Scheduling & Instructor Queries

Q7 – Unique Classes:

* Selected distinct ClassNames from the Classes table.

Q8 – Classes on June 1, 2025:

* Displayed all scheduled classes and instructor names on that date.

Q9 – Jane Doe's Schedule:

* Counted how many classes Jane Doe is teaching using JOIN and filter.

Q10 – Instructor Contact List:

* Used IFNULL() to replace null phone numbers with 'Not Provided'.

Q11 – Never Booked HIIT Blast:*

* Found members who never booked 'HIIT Blast' using NOT EXISTS.

---

###  Bookings & Payment Basics

Q12 – Morning Yoga on June 1:

* Displayed members who booked 'Morning Yoga' on that day and when.

Q13 – Total Paid Revenue:

* Summed all payments with status 'Paid' for a quick financial snapshot.

---

###  Final Notes

* Database was populated using 6 CSV datasets
* Verified totals: 50 members, 8 instructors, 25 classes, 200 bookings, 148 payments, 4 tiers
* SQL scripts include all DDL (CREATE TABLE), data imports, and query logic

This setup provides a strong analytical foundation for daily operations, strategic insights, and future automation (via triggers, events, and stored procedures).


## Phase 2
Tier 2 SQL Analytics Summary – Evolve Fitness

Member Engagement & Value

Q14 – Contact Email List

> We used a UNION query to combine emails from both 'Active' members and all instructors, ensuring no duplicates. The result is a clean contact list for outreach, named ContactEmail.

Q15 – Top 3 Paying Members

> We queried the members table and sorted by TotalPaymentsMade in descending order. The LIMIT 3 clause was used to return the top contributors.

Q16 – Highest Revenue Tier

> By joining members, payments, and membershiptiers, and summing only 'Paid' payments, we determined which membership tier has generated the most revenue overall.

Q17 – At-Risk Members

> We filtered for 'Active' members with a NextPaymentDueDate within 7 days and checked if they’ve made any bookings in the last 2 months. If not, they may be likely to churn.

---

Performance Metrics

Q18 – Class Booking Percentage

> We calculated how full each scheduled class is by dividing the number of bookings by the max capacity, and presented the result as a clean percentage using ROUND().

Q19 – Most Popular Classes

> We aggregated bookings by ClassName to see which class offerings have received the highest number of total bookings a direct insight into popularity.

Q20 – Instructor Booking Performance

> For each instructor, we calculated the average booking percentage across the classes they teach by joining bookings, classes, and scheduled sessions.

Q21 – Overbooked Instructors

> We identified instructors teaching more than one class per day by grouping on InstructorID and ClassDate and applying a HAVING COUNT(*) > 1 clause.

Q22 – Class Size Category

> We created a new column CapacityCategory using a CASE statement to label each scheduled class as 'Small', 'Medium', or 'Large' based on its MaxCapacity.

Q23 – Monthly Revenue with Running Totals

> We grouped Paid payments by class and month. We also used window functions to compute cumulative revenue:

RunningTotalByClass (per class)
 RunningTotalByMonth (across all classes)

Q24 – Ranking Members in Each Tier

> We used the RANK() window function to rank members within their tier by TotalPaymentsMade, helping identify top-paying members per tier.

Q25 – Over 80% Capacity

> We filtered scheduled classes where booking percentage exceeded 80% using a HAVING clause, and included the instructor's full name.

Q26 – Booking History + Previous Class

> We created a booking history for each member. Using LEFT JOIN, we attempted to retrieve details of the previous class booked (if any), giving us a timeline view of activity.

# Advanced and Final Phase:
Locking (Conceptual Explanation for ProcessMemberPayment)

In a highly concurrent system, if multiple ProcessMemberPayment calls for the same member happen almost simultaneously, there's a risk of a "race condition". For example:

Procedure A reads TotalPaymentsMade (e.g., $100).
Procedure B reads TotalPaymentsMade (e.g., $100).
Procedure A updates TotalPaymentsMade to $100 + $30 = $130.
Procedure B updates TotalPaymentsMade to $100 + $30 = $130 (it used the outdated $100).
The correct total should be $160.

To prevent this, SELECT ... FOR UPDATE can be used. When you SELECT ... FOR UPDATE on a row (or set of rows), it places an exclusive lock on those rows, preventing other transactions from modifying them until the current transaction is committed or rolled back.

- This ensures that once a transaction has started processing a member's payment and has acquired a lock, no other transaction can read or modify that member's financial state until the first transaction completes, guaranteeing atomicity and correctness for concurrent updates.


# Team Members:

- Abubakar nana Aishat (abubakarnanaaishah@gmail.com)

- Brenda Okonofua (brenvaltessy@yahoo.com)

- Khadijat Abubakar (lifeisgood4yemisi@gmail.com)

- Rosheedat Dasola (rosheedatdasolabusari@gmail.com)

