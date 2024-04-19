
/**
* Test Case 1.1.1
* Test case index R tree
*/

        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        
/**
Outputs:
----
4789
----
Query Plan:
----------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=236.21..236.22 rows=1 width=8) (actual time=9.620..9.621 rows=1 loops=1)
->  Index Scan using start_rtree on taxi_rtree  (cost=0.54..235.78 rows=170 width=0) (actual time=0.101..9.526 rows=4789 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision))
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3000'::double precision, true)
Rows Removed by Filter: 476
Planning Time: 11.511 ms
Execution Time: 9.645 ms
----------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 1.1.2
* Test case index R tree
*/

        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        
/**
Outputs:
----
4830
----
Query Plan:
----------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=962.98..962.99 rows=1 width=8) (actual time=3.547..3.547 rows=1 loops=1)
->  Index Scan using start_rtree on taxi_rtree  (cost=0.54..962.55 rows=170 width=0) (actual time=0.066..3.451 rows=4830 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision))
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3100'::double precision, true)
Rows Removed by Filter: 522
Planning Time: 0.423 ms
Execution Time: 3.560 ms
----------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 1.1.3
* Test case index R tree
*/

        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        
/**
Outputs:
----
4871
----
Query Plan:
----------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=1161.19..1161.20 rows=1 width=8) (actual time=3.649..3.649 rows=1 loops=1)
->  Index Scan using start_rtree on taxi_rtree  (cost=0.54..1160.76 rows=170 width=0) (actual time=0.068..3.547 rows=4871 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision))
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3150'::double precision, true)
Rows Removed by Filter: 510
Planning Time: 0.181 ms
Execution Time: 3.656 ms
----------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 1.2.1
* Test case index Quad tree
*/

        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        
/**
Outputs:
----
4789
----
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=47342.18..47342.19 rows=1 width=8) (actual time=144.880..147.593 rows=1 loops=1)
->  Gather  (cost=47341.97..47342.18 rows=2 width=8) (actual time=144.823..147.585 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=46341.97..46341.98 rows=1 width=8) (actual time=136.378..136.378 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=220.41..46341.79 rows=71 width=0) (actual time=130.338..136.339 rows=1596 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3000'::double precision, true)
Rows Removed by Filter: 159
Heap Blocks: exact=3420
->  Bitmap Index Scan on start_quadtree  (cost=0.00..220.37 rows=5311 width=0) (actual time=134.314..134.314 rows=5265 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision))
Planning Time: 0.443 ms
Execution Time: 151.008 ms
------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 1.2.2
* Test case index Quad tree
*/

        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        
/**
Outputs:
----
4830
----
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=48636.05..48636.06 rows=1 width=8) (actual time=132.762..135.786 rows=1 loops=1)
->  Gather  (cost=48635.84..48636.05 rows=2 width=8) (actual time=132.709..135.783 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=47635.84..47635.85 rows=1 width=8) (actual time=126.258..126.259 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=229.56..47635.66 rows=71 width=0) (actual time=116.393..126.219 rows=1610 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3100'::double precision, true)
Rows Removed by Filter: 174
Heap Blocks: exact=3570
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.52 rows=5464 width=0) (actual time=118.227..118.228 rows=5352 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision))
Planning Time: 0.431 ms
Execution Time: 139.080 ms
------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 1.2.3
* Test case index Quad tree
*/

        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        
/**
Outputs:
----
4871
----
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=49121.53..49121.54 rows=1 width=8) (actual time=117.058..119.554 rows=1 loops=1)
->  Gather  (cost=49121.32..49121.53 rows=2 width=8) (actual time=117.007..119.552 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=48121.32..48121.33 rows=1 width=8) (actual time=110.807..110.807 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=229.99..48121.14 rows=71 width=0) (actual time=105.505..110.769 rows=1624 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3150'::double precision, true)
Rows Removed by Filter: 170
Heap Blocks: exact=3704
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.95 rows=5522 width=0) (actual time=107.197..107.197 rows=5381 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision))
Planning Time: 0.334 ms
Execution Time: 122.594 ms
------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 1.3.1
* Test case index No index
*/

        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        
/**
Outputs:
----
4789
----
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=47342.18..47342.19 rows=1 width=8) (actual time=117.780..120.347 rows=1 loops=1)
->  Gather  (cost=47341.97..47342.18 rows=2 width=8) (actual time=117.725..120.344 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=46341.97..46341.98 rows=1 width=8) (actual time=111.459..111.459 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=220.41..46341.79 rows=71 width=0) (actual time=105.639..111.421 rows=1596 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3000'::double precision, true)
Rows Removed by Filter: 159
Heap Blocks: exact=3657
->  Bitmap Index Scan on start_quadtree  (cost=0.00..220.37 rows=5311 width=0) (actual time=107.178..107.178 rows=5265 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision))
Planning Time: 0.374 ms
Execution Time: 123.489 ms
------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 1.3.2
* Test case index No index
*/

        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        
/**
Outputs:
----
4830
----
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=48636.05..48636.06 rows=1 width=8) (actual time=119.197..121.783 rows=1 loops=1)
->  Gather  (cost=48635.84..48636.05 rows=2 width=8) (actual time=119.137..121.780 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=47635.84..47635.85 rows=1 width=8) (actual time=112.776..112.776 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=229.56..47635.66 rows=71 width=0) (actual time=106.744..112.736 rows=1610 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3100'::double precision, true)
Rows Removed by Filter: 174
Heap Blocks: exact=3548
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.52 rows=5464 width=0) (actual time=108.557..108.557 rows=5352 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision))
Planning Time: 0.397 ms
Execution Time: 125.007 ms
------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 1.3.3
* Test case index No index
*/

        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        
/**
Outputs:
----
4871
----
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=49121.53..49121.54 rows=1 width=8) (actual time=113.148..115.570 rows=1 loops=1)
->  Gather  (cost=49121.32..49121.53 rows=2 width=8) (actual time=113.102..115.567 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=48121.32..48121.33 rows=1 width=8) (actual time=106.679..106.680 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=229.99..48121.14 rows=71 width=0) (actual time=101.522..106.641 rows=1624 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3150'::double precision, true)
Rows Removed by Filter: 170
Heap Blocks: exact=3744
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.95 rows=5522 width=0) (actual time=103.538..103.538 rows=5381 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision))
Planning Time: 0.356 ms
Execution Time: 118.690 ms
------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.1.1
* Test case index R tree
*/

        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
        WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
----------------------  --
InterContinental Porto  20
Porto Palácio            8
Hotel Pao de Acucar      2
Pestana Vintage Porto    1
----------------------  --
Query Plan:
-------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=45493.52..45493.56 rows=15 width=29) (actual time=3.988..3.988 rows=4 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  HashAggregate  (cost=45493.07..45493.22 rows=15 width=29) (actual time=3.986..3.986 rows=4 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=94503 width=21) (actual time=0.039..3.981 rows=31 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.002..0.002 rows=16 loops=1)
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2812.01 rows=170 width=32) (actual time=0.189..0.248 rows=2 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '1'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '1'::double precision, true)
Rows Removed by Filter: 4
Planning Time: 0.099 ms
Execution Time: 4.001 ms
-------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.1.2
* Test case index R tree
*/

        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
        WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
----------------------  ---
InterContinental Porto  235
Hotel Pao de Acucar      32
Porto Palácio            25
Pestana Vintage Porto     7
Acta The Avenue           4
Eurostars Aliados         3
Eurostars Das Artes       2
Torel Avantgarde          2
TURIM Oporto Hotel        2
Eurostars Porto Douro     1
BessaHotel Baixa          1
----------------------  ---
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=45493.52..45493.56 rows=15 width=29) (actual time=4.583..4.583 rows=11 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  HashAggregate  (cost=45493.07..45493.22 rows=15 width=29) (actual time=4.580..4.581 rows=11 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=94503 width=21) (actual time=0.037..4.552 rows=314 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.002..0.002 rows=16 loops=1)
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2812.01 rows=170 width=32) (actual time=0.112..0.283 rows=20 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '3'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '3'::double precision, true)
Rows Removed by Filter: 19
Planning Time: 0.103 ms
Execution Time: 4.593 ms
--------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.1.3
* Test case index R tree
*/

        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
        WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
-----------------------------------  ---
InterContinental Porto               537
Hotel Pao de Acucar                  100
Porto Palácio                         73
Pestana Vintage Porto                 26
Eurostars Aliados                     11
Acta The Avenue                        9
TURIM Oporto Hotel                     7
BessaHotel Baixa                       4
Torel Avantgarde                       4
Aparthotel Oporto Alves da Veiga       2
Mercure Porto Centro Santa Catarina    2
Eurostars Das Artes                    2
Eurostars Porto Douro                  1
-----------------------------------  ---
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=45493.52..45493.56 rows=15 width=29) (actual time=5.652..5.652 rows=13 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 26kB
->  HashAggregate  (cost=45493.07..45493.22 rows=15 width=29) (actual time=5.648..5.649 rows=13 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=94503 width=21) (actual time=0.035..5.578 rows=778 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.002..0.003 rows=16 loops=1)
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2812.01 rows=170 width=32) (actual time=0.077..0.346 rows=49 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '5'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '5'::double precision, true)
Rows Removed by Filter: 36
Planning Time: 0.141 ms
Execution Time: 5.671 ms
--------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.2.1
* Test case index Quad tree
*/

        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
----------------------  --
InterContinental Porto  20
Porto Palácio            8
Hotel Pao de Acucar      2
Pestana Vintage Porto    1
----------------------  --
Query Plan:
-----------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=45388.12..45388.16 rows=15 width=29) (actual time=1650.432..1650.433 rows=4 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  HashAggregate  (cost=45387.67..45387.82 rows=15 width=29) (actual time=1650.427..1650.428 rows=4 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=73423 width=21) (actual time=95.679..1650.408 rows=31 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.009..0.018 rows=16 loops=1)
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2812.01 rows=170 width=32) (actual time=92.374..99.678 rows=2 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '1'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '1'::double precision, true)
Rows Removed by Filter: 4
Planning Time: 0.165 ms
Execution Time: 1652.602 ms
-----------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.2.2
* Test case index Quad tree
*/

        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
----------------------  ---
InterContinental Porto  235
Hotel Pao de Acucar      32
Porto Palácio            25
Pestana Vintage Porto     7
Acta The Avenue           4
Eurostars Aliados         3
Eurostars Das Artes       2
Torel Avantgarde          2
TURIM Oporto Hotel        2
Eurostars Porto Douro     1
BessaHotel Baixa          1
----------------------  ---
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=45388.12..45388.16 rows=15 width=29) (actual time=1595.082..1595.082 rows=11 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  HashAggregate  (cost=45387.67..45387.82 rows=15 width=29) (actual time=1595.075..1595.076 rows=11 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=73423 width=21) (actual time=93.479..1595.011 rows=314 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.005..0.014 rows=16 loops=1)
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2812.01 rows=170 width=32) (actual time=65.756..95.747 rows=20 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '3'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '3'::double precision, true)
Rows Removed by Filter: 19
Planning Time: 0.139 ms
Execution Time: 1598.336 ms
------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.2.3
* Test case index Quad tree
*/

        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
-----------------------------------  ---
InterContinental Porto               537
Hotel Pao de Acucar                  100
Porto Palácio                         73
Pestana Vintage Porto                 26
Eurostars Aliados                     11
Acta The Avenue                        9
TURIM Oporto Hotel                     7
BessaHotel Baixa                       4
Torel Avantgarde                       4
Aparthotel Oporto Alves da Veiga       2
Mercure Porto Centro Santa Catarina    2
Eurostars Das Artes                    2
Eurostars Porto Douro                  1
-----------------------------------  ---
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=45388.12..45388.16 rows=15 width=29) (actual time=1575.472..1575.473 rows=13 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 26kB
->  HashAggregate  (cost=45387.67..45387.82 rows=15 width=29) (actual time=1575.467..1575.468 rows=13 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=73423 width=21) (actual time=95.615..1575.362 rows=778 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.004..0.012 rows=16 loops=1)
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2812.01 rows=170 width=32) (actual time=56.794..94.637 rows=49 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '5'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '5'::double precision, true)
Rows Removed by Filter: 36
Planning Time: 0.119 ms
Execution Time: 1578.720 ms
------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.3.1
* Test case index No index
*/

        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
----------------------  --
InterContinental Porto  20
Porto Palácio            8
Hotel Pao de Acucar      2
Pestana Vintage Porto    1
----------------------  --
Query Plan:
-------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=142898490.48..142898490.52 rows=15 width=29) (actual time=9184.981..9187.539 rows=4 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  Finalize GroupAggregate  (cost=142898226.31..142898490.19 rows=15 width=29) (actual time=9184.976..9187.536 rows=4 loops=1)
Group Key: hotels.hotel
->  Gather Merge  (cost=142898226.31..142898489.89 rows=30 width=29) (actual time=9184.970..9187.532 rows=8 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial GroupAggregate  (cost=142897226.28..142897486.40 rows=15 width=29) (actual time=9178.813..9178.815 rows=3 loops=3)
Group Key: hotels.hotel
->  Sort  (cost=142897226.28..142897312.94 rows=34663 width=21) (actual time=9178.809..9178.809 rows=10 loops=3)
Sort Key: hotels.hotel
Sort Method: quicksort  Memory: 25kB
Worker 0:  Sort Method: quicksort  Memory: 25kB
Worker 1:  Sort Method: quicksort  Memory: 25kB
->  Nested Loop  (cost=0.00..142894612.50 rows=34663 width=21) (actual time=38.067..9178.738 rows=10 loops=3)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '1'::double precision, true)
Rows Removed by Join Filter: 9092091
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=32) (actual time=0.227..2076.509 rows=568256 loops=3)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.000..0.001 rows=16 loops=1704769)
Planning Time: 0.129 ms
Execution Time: 9187.562 ms
-------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.3.2
* Test case index No index
*/

        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
----------------------  ---
InterContinental Porto  235
Hotel Pao de Acucar      32
Porto Palácio            25
Pestana Vintage Porto     7
Acta The Avenue           4
Eurostars Aliados         3
Eurostars Das Artes       2
TURIM Oporto Hotel        2
Torel Avantgarde          2
Eurostars Porto Douro     1
BessaHotel Baixa          1
----------------------  ---
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=142898490.48..142898490.52 rows=15 width=29) (actual time=9199.294..9201.999 rows=11 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  Finalize GroupAggregate  (cost=142898226.31..142898490.19 rows=15 width=29) (actual time=9199.276..9201.993 rows=11 loops=1)
Group Key: hotels.hotel
->  Gather Merge  (cost=142898226.31..142898489.89 rows=30 width=29) (actual time=9199.270..9201.988 rows=24 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial GroupAggregate  (cost=142897226.28..142897486.40 rows=15 width=29) (actual time=9192.557..9192.564 rows=8 loops=3)
Group Key: hotels.hotel
->  Sort  (cost=142897226.28..142897312.94 rows=34663 width=21) (actual time=9192.553..9192.556 rows=105 loops=3)
Sort Key: hotels.hotel
Sort Method: quicksort  Memory: 33kB
Worker 0:  Sort Method: quicksort  Memory: 32kB
Worker 1:  Sort Method: quicksort  Memory: 32kB
->  Nested Loop  (cost=0.00..142894612.50 rows=34663 width=21) (actual time=29.765..9188.678 rows=105 loops=3)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '3'::double precision, true)
Rows Removed by Join Filter: 9091997
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=32) (actual time=0.161..2044.284 rows=568256 loops=3)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.000..0.001 rows=16 loops=1704769)
Planning Time: 0.144 ms
Execution Time: 9203.242 ms
--------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 2.3.3
* Test case index No index
*/

        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        
/**
Outputs:
-----------------------------------  ---
InterContinental Porto               537
Hotel Pao de Acucar                  100
Porto Palácio                         73
Pestana Vintage Porto                 26
Eurostars Aliados                     11
Acta The Avenue                        9
TURIM Oporto Hotel                     7
BessaHotel Baixa                       4
Torel Avantgarde                       4
Aparthotel Oporto Alves da Veiga       2
Eurostars Das Artes                    2
Mercure Porto Centro Santa Catarina    2
Eurostars Porto Douro                  1
-----------------------------------  ---
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------
Sort  (cost=142898490.48..142898490.52 rows=15 width=29) (actual time=9085.167..9087.777 rows=13 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 26kB
->  Finalize GroupAggregate  (cost=142898226.31..142898490.19 rows=15 width=29) (actual time=9085.138..9087.773 rows=13 loops=1)
Group Key: hotels.hotel
->  Gather Merge  (cost=142898226.31..142898489.89 rows=30 width=29) (actual time=9085.115..9087.766 rows=30 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial GroupAggregate  (cost=142897226.28..142897486.40 rows=15 width=29) (actual time=9079.008..9079.026 rows=10 loops=3)
Group Key: hotels.hotel
->  Sort  (cost=142897226.28..142897312.94 rows=34663 width=21) (actual time=9079.002..9079.007 rows=259 loops=3)
Sort Key: hotels.hotel
Sort Method: quicksort  Memory: 45kB
Worker 0:  Sort Method: quicksort  Memory: 42kB
Worker 1:  Sort Method: quicksort  Memory: 45kB
->  Nested Loop  (cost=0.00..142894612.50 rows=34663 width=21) (actual time=30.236..9075.026 rows=259 loops=3)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '5'::double precision, true)
Rows Removed by Join Filter: 9091842
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=32) (actual time=0.149..2010.725 rows=568256 loops=3)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.000..0.001 rows=16 loops=1704769)
Planning Time: 0.098 ms
Execution Time: 9087.796 ms
--------------------------------------------------------------------------------------------------------------------------------
*/
