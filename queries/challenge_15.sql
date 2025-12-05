-- A query that creates or replaces a user-defined SQL function, count_vowels

-- The function should accept a string and return an integer representing the number of vowels in the string

-- Y should be counted as a vowel

-- Vowels are not case-sensitive
CREATE FUNCTION count_vowels(input_string VARCHAR)
RETURNS INT AS $$
BEGIN
    RETURN LENGTH(input_string) - LENGTH(REGEXP_REPLACE(LOWER(input_string), '[aeiouy]', '', 'g'));
END;
$$ LANGUAGE plpgsql;