select * from craigslist_search_urls;

SELECT cls.keyword_id, k.keyword, k.category_id, count(*) from craigslist_search_urls as cls
join keywords k on k.id = cls.keyword_id group by k.keyword, k.category_id;

SELECT k.keyword from craigslist_search_urls as cls
join keywords k on k.id = cls.keyword_id group by k.keyword order by k.keyword;

SELECT DISTINCT keyword from keywords order by keyword;

CALL get_craigslist_listings();

SELECT * from keywords;
SELECT * from subcategories;

SELECT * from keywords where keyword like "%accounting%";

-- DELETE FROM craigslist_search_urls where keyword_id=102 or keyword_id=103;

INSERT INTO keywords (category_id, keyword, zip_code, within, subcategory_id)
VALUES (
    (SELECT id FROM categories WHERE name='jobs'),
    '',
    '55555',
    50000,
--     (SELECT id FROM subcategories WHERE name='computer' and id='cpg')
--     (SELECT id FROM subcategories WHERE name='software')
	(SELECT id FROM subcategories WHERE id='jjj')
),(
    (SELECT id FROM categories WHERE name='gigs'),
    '',
    '55555',
    50000,
--     (SELECT id FROM subcategories WHERE name='computer' and id='cpg')
--     (SELECT id FROM subcategories WHERE name='software')
	(SELECT id FROM subcategories WHERE id='ggg')
);

SELECT id FROM subcategories WHERE id='ggg'

delete from keywords where id>50;