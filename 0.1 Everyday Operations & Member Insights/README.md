# Evolve fitness, story of a fresh start

## Sarah is one of our clients who wants a fresh start. She needs a robust MySQL database system, and we are the data guru she hired to build it!

## Steps we took in building the database of her dream is highlighted below:

- Started from scratch by highlighting the existing pen and paper documentation / inventory
- We gathered all the necessary data, colloacted and cleaned it
- The data where imported via MYSQL benchmark
- Had a meeting with Sarah to ensure that we are on same page with her dream database, she was happy with the design concept and logical ERD we gave her.

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








# Team Members:

- abubakarnanaaishah@gmail.com

- Brenda Okonofua (brenvaltessy@yahoo.com)

- Khadijat Abubakar lifeisgood4yemisi@gmail.com

- Rosheedat Dasola (rosheedatdasolabusari@gmail.com)

