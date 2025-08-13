-- # 1️⃣ **CREATE (INSERT) — 5 ta topshiriq**

-- **Vazifa:** `books` jadvaliga ma’lumot qo‘shish.

-- 1. `"Clean Code"`, `"Robert C. Martin"`, `25.50`
-- 2. `"The Pragmatic Programmer"`, `"Andrew Hunt"`, `30.00`
-- 3. `"Python Crash Course"`, `"Eric Matthes"`, `22.99`
-- 4. `"Atomic Habits"`, `"James Clear"`, `18.75`
-- 5. `"Deep Work"`, `"Cal Newport"`, `27.45`

book_store_db=# INSERT INTO books (title, author, price)
book_store_db-# VALUES
book_store_db-#     ('Clean Code', 'Robert C. Martin', 25.50),
book_store_db-#     ('The Pragmatic Programmer', 'Andrew Hunt', 30.00),
book_store_db-#     ('Python Crash Course', 'Eric Matthes', 22.99),
book_store_db-#     ('Atomic Habits', 'James Clear', 18.75),
book_store_db-#     ('Deep Work', 'Cal Newport', 27.45);


book_store_db=# SELECT * FROM books;

 id |          title           |      author      | price | is_availabe
----+--------------------------+------------------+-------+-------------
  1 | Clean Code               | Robert C. Martin | 25.50 |
  2 | The Pragmatic Programmer | Andrew Hunt      | 30.00 |
  3 | Python Crash Course      | Eric Matthes     | 22.99 |
  4 | Atomic Habits            | James Clear      | 18.75 |
  5 | Deep Work                | Cal Newport      | 27.45 |
(5 rows)

-- ## 2️⃣ **READ (SELECT) — 5 ta topshiriq**

-- **Vazifa:** `books` jadvalidan ma’lumot o‘qish.

-- 1. Barcha kitoblarni chiqar.
-- 2. Faqat `title` va `price` ustunlarini chiqar.
-- 3. Narxi `25.00` dan katta bo‘lgan kitoblarni chiqar.
-- 4. `is_available = TRUE` bo‘lgan kitoblarni chiqar.
-- 5. Kitoblarni narx bo‘yicha kamayish tartibida chiqar.

book_store_db=# SELECT * FROM books;
 id |          title           |      author      | price | is_availabe
----+--------------------------+------------------+-------+-------------
  1 | Clean Code               | Robert C. Martin | 25.50 |
  2 | The Pragmatic Programmer | Andrew Hunt      | 30.00 |
  3 | Python Crash Course      | Eric Matthes     | 22.99 |
  4 | Atomic Habits            | James Clear      | 18.75 |
  5 | Deep Work                | Cal Newport      | 27.45 |
(5 rows)


book_store_db=# SELECT title, price FROM books;
          title           | price
--------------------------+-------
 Clean Code               | 25.50
 The Pragmatic Programmer | 30.00
 Python Crash Course      | 22.99
 Atomic Habits            | 18.75
 Deep Work                | 27.45
(5 rows)

book_store_db=# SELECT * FROM books WHERE price > 25.00;
 id |          title           |      author      | price | is_availabe
----+--------------------------+------------------+-------+-------------
  1 | Clean Code               | Robert C. Martin | 25.50 |
  2 | The Pragmatic Programmer | Andrew Hunt      | 30.00 |
  5 | Deep Work                | Cal Newport      | 27.45 |
(3 rows)


book_store_db=# SELECT * FROM books
book_store_db-# ORDER BY price DESC;
 id |          title           |      author      | price | is_availabe
----+--------------------------+------------------+-------+-------------
  2 | The Pragmatic Programmer | Andrew Hunt      | 30.00 |
  5 | Deep Work                | Cal Newport      | 27.45 |
  1 | Clean Code               | Robert C. Martin | 25.50 |
  3 | Python Crash Course      | Eric Matthes     | 22.99 |
  4 | Atomic Habits            | James Clear      | 18.75 |
(5 rows)

-- ## 3️⃣ **UPDATE — 5 ta topshiriq**

-- **Vazifa:** `books` jadvalidagi ma’lumotlarni yangilash.

-- 1. `"Clean Code"` kitobining narxini `27.00` ga o‘zgartir.
-- 2. `"Atomic Habits"` kitobining narxini `20.00` ga o‘zgartir.
-- 3. `"Python Crash Course"` kitobining `is_available` ustunini `FALSE` ga o‘zgartir.
-- 4. Narxi `30.00` bo‘lgan kitoblarning `is_available` ustunini `FALSE` ga o‘zgartir.
-- 5. Barcha kitoblarning narxini `+2.00` ga oshir.

book_store_db=# UPDATE books SET price = 27.00 WHERE title = 'Clean Code';
UPDATE 1

book_store_db=# SELECT * FROM books;
 id |          title           |      author      | price | is_availabe
----+--------------------------+------------------+-------+-------------
  2 | The Pragmatic Programmer | Andrew Hunt      | 30.00 |
  3 | Python Crash Course      | Eric Matthes     | 22.99 |
  4 | Atomic Habits            | James Clear      | 18.75 |
  5 | Deep Work                | Cal Newport      | 27.45 |
  1 | Clean Code               | Robert C. Martin | 27.00 |


book_store_db=# UPDATE books SET price = 20.00 WHERE title = 'Atomic Habits';
UPDATE 1
book_store_db=# SELECT * FROM books;
 id |          title           |      author      | price | is_availabe
----+--------------------------+------------------+-------+-------------
  2 | The Pragmatic Programmer | Andrew Hunt      | 30.00 |
  3 | Python Crash Course      | Eric Matthes     | 22.99 |
  5 | Deep Work                | Cal Newport      | 27.45 |
  1 | Clean Code               | Robert C. Martin | 27.00 |
  4 | Atomic Habits            | James Clear      | 20.00 |
(5 rows)


book_store_db=# UPDATE books SET is_available = false WHERE title = 'Python Crash Course';
UPDATE 1
book_store_db=# SELECT * FROM books;
 id |          title           |      author      | price | is_available
----+--------------------------+------------------+-------+--------------
  2 | The Pragmatic Programmer | Andrew Hunt      | 30.00 |
  5 | Deep Work                | Cal Newport      | 27.45 |
  1 | Clean Code               | Robert C. Martin | 27.00 |
  4 | Atomic Habits            | James Clear      | 20.00 |
  3 | Python Crash Course      | Eric Matthes     | 22.99 | f
(5 rows)

book_store_db=# UPDATE books
book_store_db-# SET is_available = false WHERE price = 30.00;
UPDATE 1
book_store_db=# SELECT * FROM books;
 id |          title           |      author      | price | is_available
----+--------------------------+------------------+-------+--------------
  5 | Deep Work                | Cal Newport      | 27.45 |
  1 | Clean Code               | Robert C. Martin | 27.00 |
  4 | Atomic Habits            | James Clear      | 20.00 |
  3 | Python Crash Course      | Eric Matthes     | 22.99 | f
  2 | The Pragmatic Programmer | Andrew Hunt      | 30.00 | f
(5 rows)

book_store_db=# UPDATE books SET price = price + 2.00;
UPDATE 5
book_store_db=# SELECT * FROM books;
 id |          title           |      author      | price | is_available
----+--------------------------+------------------+-------+--------------
  5 | Deep Work                | Cal Newport      | 29.45 |
  1 | Clean Code               | Robert C. Martin | 29.00 |
  4 | Atomic Habits            | James Clear      | 22.00 |
  3 | Python Crash Course      | Eric Matthes     | 24.99 | f
  2 | The Pragmatic Programmer | Andrew Hunt      | 32.00 | f
(5 rows)


-- ## 4️⃣ **DELETE — 5 ta topshiriq**

-- **Vazifa:** `books` jadvalidan ma’lumot o‘chirish.

-- 1. `"Deep Work"` kitobini o‘chir.
-- 2. Narxi `20.00` dan kichik bo‘lgan kitoblarni o‘chir.
-- 3. `is_available = FALSE` bo‘lgan kitoblarni o‘chir.
-- 4. `"Atomic Habits"` va `"Clean Code"` kitoblarini o‘chir.
-- 5. Jadvaldagi barcha kitoblarni o‘chir.


book_store_db=# DELETE FROM books WHERE title = 'Deep Work';
DELETE 1
book_store_db=# SELECT * FROM books;
 id |          title           |      author      | price | is_available
----+--------------------------+------------------+-------+--------------
  1 | Clean Code               | Robert C. Martin | 29.00 |
  4 | Atomic Habits            | James Clear      | 22.00 |
  3 | Python Crash Course      | Eric Matthes     | 24.99 | f
  2 | The Pragmatic Programmer | Andrew Hunt      | 32.00 | f
(4 rows)

book_store_db=# DELETE FROM books WHERE is_available = false;
DELETE 2
book_store_db=# select * from books;
 id |     title     |      author      | price | is_available
----+---------------+------------------+-------+--------------
  1 | Clean Code    | Robert C. Martin | 29.00 |
  4 | Atomic Habits | James Clear      | 22.00 |
(2 rows)

book_store_db=# DELETE FROM books WHERE title = 'Clean Code';
DELETE 1
book_store_db=# select * from books;
 id |     title     |   author    | price | is_available
----+---------------+-------------+-------+--------------
  4 | Atomic Habits | James Clear | 22.00 |
(1 row)

book_store_db=# DELETE FROM books;
DELETE 1
book_store_db=# SELECT * FROM books;
 id | title | author | price | is_available
----+-------+--------+-------+--------------
(0 rows)

