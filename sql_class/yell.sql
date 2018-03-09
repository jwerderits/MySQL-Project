SELECT
    UPPER(
        CONCAT(
            'my favorite author is ',
            author_fname,
            ' ',
            author_lname,
            '!'
        )
    ) as yell
FROM books
ORDER BY author_lname