
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
Aggregate  (cost=21.48..21.49 rows=1 width=8) (actual time=7.735..7.736 rows=1 loops=1)
->  Index Scan using start_rtree on taxi_rtree  (cost=0.54..21.05 rows=170 width=0) (actual time=0.072..7.639 rows=4789 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision))
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3000'::double precision, true)
Rows Removed by Filter: 476
Planning Time: 0.397 ms
Execution Time: 7.747 ms
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
Aggregate  (cost=21.48..21.49 rows=1 width=8) (actual time=3.379..3.379 rows=1 loops=1)
->  Index Scan using start_rtree on taxi_rtree  (cost=0.54..21.05 rows=170 width=0) (actual time=0.062..3.283 rows=4830 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision))
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3100'::double precision, true)
Rows Removed by Filter: 522
Planning Time: 0.254 ms
Execution Time: 3.386 ms
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
Aggregate  (cost=21.48..21.49 rows=1 width=8) (actual time=3.238..3.238 rows=1 loops=1)
->  Index Scan using start_rtree on taxi_rtree  (cost=0.54..21.05 rows=170 width=0) (actual time=0.065..3.143 rows=4871 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision))
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3150'::double precision, true)
Rows Removed by Filter: 510
Planning Time: 0.431 ms
Execution Time: 3.249 ms
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
----------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=47342.18..47342.19 rows=1 width=8) (actual time=107.430..109.892 rows=1 loops=1)
->  Gather  (cost=47341.97..47342.18 rows=2 width=8) (actual time=107.380..109.890 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=46341.97..46341.98 rows=1 width=8) (actual time=96.966..96.967 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=220.41..46341.79 rows=71 width=0) (actual time=91.959..96.928 rows=1596 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3000'::double precision, true)
Rows Removed by Filter: 159
Heap Blocks: exact=3603
->  Bitmap Index Scan on start_quadtree  (cost=0.00..220.37 rows=5311 width=0) (actual time=98.156..98.156 rows=5265 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision))
Planning Time: 0.320 ms
Execution Time: 112.566 ms
----------------------------------------------------------------------------------------------------------------------------------
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
Finalize Aggregate  (cost=48636.05..48636.06 rows=1 width=8) (actual time=113.372..115.962 rows=1 loops=1)
->  Gather  (cost=48635.84..48636.05 rows=2 width=8) (actual time=113.326..115.959 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=47635.84..47635.85 rows=1 width=8) (actual time=107.017..107.018 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=229.56..47635.66 rows=71 width=0) (actual time=101.398..106.976 rows=1610 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3100'::double precision, true)
Rows Removed by Filter: 174
Heap Blocks: exact=3654
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.52 rows=5464 width=0) (actual time=103.289..103.289 rows=5352 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision))
Planning Time: 0.325 ms
Execution Time: 119.347 ms
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
----------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=49121.53..49121.54 rows=1 width=8) (actual time=105.199..107.741 rows=1 loops=1)
->  Gather  (cost=49121.32..49121.53 rows=2 width=8) (actual time=105.153..107.738 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=48121.32..48121.33 rows=1 width=8) (actual time=98.961..98.961 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=229.99..48121.14 rows=71 width=0) (actual time=94.042..98.924 rows=1624 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3150'::double precision, true)
Rows Removed by Filter: 170
Heap Blocks: exact=3773
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.95 rows=5522 width=0) (actual time=95.789..95.789 rows=5381 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision))
Planning Time: 0.375 ms
Execution Time: 110.453 ms
----------------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=47342.18..47342.19 rows=1 width=8) (actual time=104.201..106.587 rows=1 loops=1)
->  Gather  (cost=47341.97..47342.18 rows=2 width=8) (actual time=104.152..106.585 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=46341.97..46341.98 rows=1 width=8) (actual time=97.932..97.932 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=220.41..46341.79 rows=71 width=0) (actual time=93.147..97.896 rows=1596 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3000'::double precision, true)
Rows Removed by Filter: 159
Heap Blocks: exact=3750
->  Bitmap Index Scan on start_quadtree  (cost=0.00..220.37 rows=5311 width=0) (actual time=94.907..94.907 rows=5265 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision))
Planning Time: 0.324 ms
Execution Time: 109.348 ms
----------------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=48636.05..48636.06 rows=1 width=8) (actual time=104.592..107.093 rows=1 loops=1)
->  Gather  (cost=48635.84..48636.05 rows=2 width=8) (actual time=104.543..107.090 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=47635.84..47635.85 rows=1 width=8) (actual time=98.413..98.414 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=229.56..47635.66 rows=71 width=0) (actual time=93.421..98.377 rows=1610 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3100'::double precision, true)
Rows Removed by Filter: 174
Heap Blocks: exact=3724
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.52 rows=5464 width=0) (actual time=95.184..95.184 rows=5352 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision))
Planning Time: 0.383 ms
Execution Time: 109.881 ms
----------------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------------
Finalize Aggregate  (cost=49121.53..49121.54 rows=1 width=8) (actual time=104.373..106.837 rows=1 loops=1)
->  Gather  (cost=49121.32..49121.53 rows=2 width=8) (actual time=104.326..106.834 rows=3 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial Aggregate  (cost=48121.32..48121.33 rows=1 width=8) (actual time=98.159..98.160 rows=1 loops=3)
->  Parallel Bitmap Heap Scan on taxi_quad  (cost=229.99..48121.14 rows=71 width=0) (actual time=93.239..98.121 rows=1624 loops=3)
Filter: st_dwithin('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, start_point, '3150'::double precision, true)
Rows Removed by Filter: 170
Heap Blocks: exact=3806
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.95 rows=5522 width=0) (actual time=94.946..94.946 rows=5381 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision))
Planning Time: 0.332 ms
Execution Time: 109.556 ms
----------------------------------------------------------------------------------------------------------------------------------
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
Sort  (cost=45432.44..45432.48 rows=15 width=29) (actual time=3.872..3.873 rows=4 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  HashAggregate  (cost=45432.00..45432.15 rows=15 width=29) (actual time=3.870..3.871 rows=4 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=82288 width=21) (actual time=0.040..3.866 rows=31 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.002..0.003 rows=16 loops=1)
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2812.01 rows=170 width=32) (actual time=0.184..0.241 rows=2 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '1'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '1'::double precision, true)
Rows Removed by Filter: 4
Planning Time: 0.130 ms
Execution Time: 3.885 ms
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
Sort  (cost=45432.44..45432.48 rows=15 width=29) (actual time=4.527..4.527 rows=11 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  HashAggregate  (cost=45432.00..45432.15 rows=15 width=29) (actual time=4.524..4.525 rows=11 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=82288 width=21) (actual time=0.038..4.495 rows=314 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.002..0.002 rows=16 loops=1)
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2812.01 rows=170 width=32) (actual time=0.112..0.280 rows=20 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '3'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '3'::double precision, true)
Rows Removed by Filter: 19
Planning Time: 0.077 ms
Execution Time: 4.536 ms
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
Sort  (cost=45432.44..45432.48 rows=15 width=29) (actual time=5.292..5.292 rows=13 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 26kB
->  HashAggregate  (cost=45432.00..45432.15 rows=15 width=29) (actual time=5.290..5.290 rows=13 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=82288 width=21) (actual time=0.033..5.230 rows=778 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.002..0.002 rows=16 loops=1)
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2812.01 rows=170 width=32) (actual time=0.077..0.324 rows=49 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '5'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '5'::double precision, true)
Rows Removed by Filter: 36
Planning Time: 0.097 ms
Execution Time: 5.306 ms
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
Sort  (cost=45388.12..45388.16 rows=15 width=29) (actual time=1506.231..1506.231 rows=4 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  HashAggregate  (cost=45387.67..45387.82 rows=15 width=29) (actual time=1506.227..1506.227 rows=4 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=73423 width=21) (actual time=94.472..1506.205 rows=31 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.005..0.012 rows=16 loops=1)
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2812.01 rows=170 width=32) (actual time=84.001..91.323 rows=2 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '1'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '1'::double precision, true)
Rows Removed by Filter: 4
Planning Time: 0.134 ms
Execution Time: 1508.852 ms
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
Sort  (cost=45388.12..45388.16 rows=15 width=29) (actual time=1478.404..1478.404 rows=11 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  HashAggregate  (cost=45387.67..45387.82 rows=15 width=29) (actual time=1478.396..1478.396 rows=11 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=73423 width=21) (actual time=89.789..1478.345 rows=314 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.004..0.011 rows=16 loops=1)
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2812.01 rows=170 width=32) (actual time=61.302..89.713 rows=20 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '3'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '3'::double precision, true)
Rows Removed by Filter: 19
Planning Time: 0.168 ms
Execution Time: 1481.631 ms
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
Sort  (cost=45388.12..45388.16 rows=15 width=29) (actual time=1472.560..1472.561 rows=13 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 26kB
->  HashAggregate  (cost=45387.67..45387.82 rows=15 width=29) (actual time=1472.554..1472.555 rows=13 loops=1)
Group Key: hotels.hotel
Batches: 1  Memory Usage: 24kB
->  Nested Loop  (cost=0.54..45020.56 rows=73423 width=21) (actual time=95.062..1472.472 rows=778 loops=1)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.003..0.008 rows=16 loops=1)
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2812.01 rows=170 width=32) (actual time=53.910..89.482 rows=49 loops=16)
Index Cond: (end_point && _st_expand(hotels.geom, '5'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '5'::double precision, true)
Rows Removed by Filter: 36
Planning Time: 0.210 ms
Execution Time: 1475.293 ms
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
Sort  (cost=142898490.48..142898490.52 rows=15 width=29) (actual time=6957.931..6960.651 rows=4 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  Finalize GroupAggregate  (cost=142898226.31..142898490.19 rows=15 width=29) (actual time=6957.924..6960.648 rows=4 loops=1)
Group Key: hotels.hotel
->  Gather Merge  (cost=142898226.31..142898489.89 rows=30 width=29) (actual time=6957.921..6960.644 rows=8 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial GroupAggregate  (cost=142897226.28..142897486.40 rows=15 width=29) (actual time=6951.930..6951.932 rows=3 loops=3)
Group Key: hotels.hotel
->  Sort  (cost=142897226.28..142897312.94 rows=34663 width=21) (actual time=6951.924..6951.925 rows=10 loops=3)
Sort Key: hotels.hotel
Sort Method: quicksort  Memory: 25kB
Worker 0:  Sort Method: quicksort  Memory: 25kB
Worker 1:  Sort Method: quicksort  Memory: 25kB
->  Nested Loop  (cost=0.00..142894612.50 rows=34663 width=21) (actual time=30.480..6951.863 rows=10 loops=3)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '1'::double precision, true)
Rows Removed by Join Filter: 9092091
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=32) (actual time=0.017..164.668 rows=568256 loops=3)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.000..0.001 rows=16 loops=1704769)
Planning Time: 1.866 ms
Execution Time: 6960.669 ms
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
Sort  (cost=142898490.48..142898490.52 rows=15 width=29) (actual time=6951.721..6954.311 rows=11 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 25kB
->  Finalize GroupAggregate  (cost=142898226.31..142898490.19 rows=15 width=29) (actual time=6951.708..6954.309 rows=11 loops=1)
Group Key: hotels.hotel
->  Gather Merge  (cost=142898226.31..142898489.89 rows=30 width=29) (actual time=6951.705..6954.304 rows=22 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial GroupAggregate  (cost=142897226.28..142897486.40 rows=15 width=29) (actual time=6945.736..6945.747 rows=7 loops=3)
Group Key: hotels.hotel
->  Sort  (cost=142897226.28..142897312.94 rows=34663 width=21) (actual time=6945.732..6945.734 rows=105 loops=3)
Sort Key: hotels.hotel
Sort Method: quicksort  Memory: 32kB
Worker 0:  Sort Method: quicksort  Memory: 33kB
Worker 1:  Sort Method: quicksort  Memory: 33kB
->  Nested Loop  (cost=0.00..142894612.50 rows=34663 width=21) (actual time=19.698..6945.610 rows=105 loops=3)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '3'::double precision, true)
Rows Removed by Join Filter: 9091997
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=32) (actual time=0.016..159.906 rows=568256 loops=3)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.000..0.001 rows=16 loops=1704769)
Planning Time: 1.683 ms
Execution Time: 6954.335 ms
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
Sort  (cost=142898490.48..142898490.52 rows=15 width=29) (actual time=6944.557..6947.242 rows=13 loops=1)
Sort Key: (count(*)) DESC
Sort Method: quicksort  Memory: 26kB
->  Finalize GroupAggregate  (cost=142898226.31..142898490.19 rows=15 width=29) (actual time=6944.534..6947.239 rows=13 loops=1)
Group Key: hotels.hotel
->  Gather Merge  (cost=142898226.31..142898489.89 rows=30 width=29) (actual time=6944.519..6947.233 rows=33 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Partial GroupAggregate  (cost=142897226.28..142897486.40 rows=15 width=29) (actual time=6938.185..6938.200 rows=11 loops=3)
Group Key: hotels.hotel
->  Sort  (cost=142897226.28..142897312.94 rows=34663 width=21) (actual time=6938.181..6938.186 rows=259 loops=3)
Sort Key: hotels.hotel
Sort Method: quicksort  Memory: 44kB
Worker 0:  Sort Method: quicksort  Memory: 43kB
Worker 1:  Sort Method: quicksort  Memory: 45kB
->  Nested Loop  (cost=0.00..142894612.50 rows=34663 width=21) (actual time=19.926..6937.996 rows=259 loops=3)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '5'::double precision, true)
Rows Removed by Join Filter: 9091842
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=32) (actual time=0.020..154.811 rows=568256 loops=3)
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=53) (actual time=0.000..0.001 rows=16 loops=1704769)
Planning Time: 0.100 ms
Execution Time: 6947.394 ms
--------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.1.1
* Test case index R tree
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_rtree
        ORDER BY sim ASC
        LIMIT 5

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9099219.21..9099219.79 rows=5 width=8) (actual time=34141.807..34143.778 rows=5 loops=1)
->  Gather Merge  (cost=9099219.21..9264908.17 rows=1420092 width=8) (actual time=34141.806..34143.777 rows=5 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9098219.18..9099994.30 rows=710046 width=8) (actual time=34135.233..34135.234 rows=4 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 25kB
Worker 0:  Sort Method: top-N heapsort  Memory: 25kB
Worker 1:  Sort Method: top-N heapsort  Memory: 25kB
->  Parallel Seq Scan on taxi_rtree  (cost=0.00..9086425.57 rows=710046 width=8) (actual time=0.308..34110.259 rows=568256 loops=3)
Planning Time: 0.092 ms
Execution Time: 34143.791 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.1.2
* Test case index R tree
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_rtree
        ORDER BY sim ASC
        LIMIT 10

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
0.000274758
0.000293115
0.000295223
0.000334093
0.000340695
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9102769.44..9102770.60 rows=10 width=8) (actual time=32115.570..32117.526 rows=10 loops=1)
->  Gather Merge  (cost=9102769.44..9268458.40 rows=1420092 width=8) (actual time=32115.569..32117.524 rows=10 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9101769.41..9103544.53 rows=710046 width=8) (actual time=32108.911..32108.912 rows=8 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 25kB
Worker 0:  Sort Method: top-N heapsort  Memory: 25kB
Worker 1:  Sort Method: top-N heapsort  Memory: 25kB
->  Parallel Seq Scan on taxi_rtree  (cost=0.00..9086425.57 rows=710046 width=8) (actual time=0.296..32083.595 rows=568256 loops=3)
Planning Time: 0.102 ms
Execution Time: 32117.536 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.1.3
* Test case index R tree
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_rtree
        ORDER BY sim ASC
        LIMIT 15

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
0.000274758
0.000293115
0.000295223
0.000334093
0.000340695
0.000355449
0.000504975
0.000956078
0.00102498
0.00125565
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9104846.19..9104847.94 rows=15 width=8) (actual time=31586.642..31588.036 rows=15 loops=1)
->  Gather Merge  (cost=9104846.19..9270535.16 rows=1420092 width=8) (actual time=31586.641..31588.029 rows=15 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9103846.16..9105621.28 rows=710046 width=8) (actual time=31579.779..31579.779 rows=12 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 26kB
Worker 0:  Sort Method: top-N heapsort  Memory: 26kB
Worker 1:  Sort Method: top-N heapsort  Memory: 26kB
->  Parallel Seq Scan on taxi_rtree  (cost=0.00..9086425.57 rows=710046 width=8) (actual time=0.582..31555.834 rows=568256 loops=3)
Planning Time: 0.077 ms
Execution Time: 31588.049 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.2.1
* Test case index Quad tree
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_quad
        ORDER BY sim ASC
        LIMIT 5

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9102652.19..9102652.77 rows=5 width=8) (actual time=33095.022..33096.223 rows=5 loops=1)
->  Gather Merge  (cost=9102652.19..9268405.09 rows=1420640 width=8) (actual time=33095.022..33096.222 rows=5 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9101652.16..9103427.96 rows=710320 width=8) (actual time=33087.718..33087.718 rows=4 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 25kB
Worker 0:  Sort Method: top-N heapsort  Memory: 25kB
Worker 1:  Sort Method: top-N heapsort  Memory: 25kB
->  Parallel Seq Scan on taxi_quad  (cost=0.00..9089854.00 rows=710320 width=8) (actual time=0.382..33062.817 rows=568256 loops=3)
Planning Time: 0.115 ms
Execution Time: 33096.235 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.2.2
* Test case index Quad tree
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_quad
        ORDER BY sim ASC
        LIMIT 10

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
0.000274758
0.000293115
0.000295223
0.000334093
0.000340695
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9106203.79..9106204.95 rows=10 width=8) (actual time=34126.725..34128.129 rows=10 loops=1)
->  Gather Merge  (cost=9106203.79..9271956.69 rows=1420640 width=8) (actual time=34126.724..34128.124 rows=10 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9105203.76..9106979.56 rows=710320 width=8) (actual time=34119.777..34119.778 rows=7 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 25kB
Worker 0:  Sort Method: top-N heapsort  Memory: 25kB
Worker 1:  Sort Method: top-N heapsort  Memory: 25kB
->  Parallel Seq Scan on taxi_quad  (cost=0.00..9089854.00 rows=710320 width=8) (actual time=0.582..34093.208 rows=568256 loops=3)
Planning Time: 0.107 ms
Execution Time: 34128.138 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.2.3
* Test case index Quad tree
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_quad
        ORDER BY sim ASC
        LIMIT 15

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
0.000274758
0.000293115
0.000295223
0.000334093
0.000340695
0.000355449
0.000504975
0.000956078
0.00102498
0.00125565
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9108281.34..9108283.09 rows=15 width=8) (actual time=33971.359..33972.679 rows=15 loops=1)
->  Gather Merge  (cost=9108281.34..9274034.25 rows=1420640 width=8) (actual time=33971.359..33972.678 rows=15 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9107281.32..9109057.12 rows=710320 width=8) (actual time=33962.229..33962.229 rows=12 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 26kB
Worker 0:  Sort Method: top-N heapsort  Memory: 26kB
Worker 1:  Sort Method: top-N heapsort  Memory: 26kB
->  Parallel Seq Scan on taxi_quad  (cost=0.00..9089854.00 rows=710320 width=8) (actual time=0.649..33935.856 rows=568256 loops=3)
Planning Time: 0.119 ms
Execution Time: 33972.691 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.3.1
* Test case index No index
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi
        ORDER BY sim ASC
        LIMIT 5

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9082981.48..9082982.06 rows=5 width=8) (actual time=32940.264..32941.517 rows=5 loops=1)
->  Gather Merge  (cost=9082981.48..9248368.03 rows=1417500 width=8) (actual time=32940.264..32941.516 rows=5 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9081981.46..9083753.33 rows=708750 width=8) (actual time=32933.717..32933.717 rows=4 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 25kB
Worker 0:  Sort Method: top-N heapsort  Memory: 25kB
Worker 1:  Sort Method: top-N heapsort  Memory: 25kB
->  Parallel Seq Scan on taxi  (cost=0.00..9070209.38 rows=708750 width=8) (actual time=0.159..32886.703 rows=568256 loops=3)
Planning Time: 0.066 ms
Execution Time: 32941.530 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.3.2
* Test case index No index
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi
        ORDER BY sim ASC
        LIMIT 10

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
0.000274758
0.000293115
0.000295223
0.000334093
0.000340695
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9086525.23..9086526.40 rows=10 width=8) (actual time=32848.232..32850.549 rows=10 loops=1)
->  Gather Merge  (cost=9086525.23..9251911.78 rows=1417500 width=8) (actual time=32848.230..32850.548 rows=10 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9085525.21..9087297.08 rows=708750 width=8) (actual time=32840.036..32840.038 rows=8 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 25kB
Worker 0:  Sort Method: top-N heapsort  Memory: 25kB
Worker 1:  Sort Method: top-N heapsort  Memory: 25kB
->  Parallel Seq Scan on taxi  (cost=0.00..9070209.38 rows=708750 width=8) (actual time=0.164..32810.816 rows=568256 loops=3)
Planning Time: 0.050 ms
Execution Time: 32850.563 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 3.3.3
* Test case index No index
*/

        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi
        ORDER BY sim ASC
        LIMIT 15

/**
Outputs:
-----------
0
0.000228211
0.000237607
0.000243
0.000253105
0.000274758
0.000293115
0.000295223
0.000334093
0.000340695
0.000355449
0.000504975
0.000956078
0.00102498
0.00125565
-----------
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Limit  (cost=9088598.19..9088599.94 rows=15 width=8) (actual time=32736.754..32738.604 rows=15 loops=1)
->  Gather Merge  (cost=9088598.19..9253984.74 rows=1417500 width=8) (actual time=32736.753..32738.601 rows=15 loops=1)
Workers Planned: 2
Workers Launched: 2
->  Sort  (cost=9087598.17..9089370.04 rows=708750 width=8) (actual time=32730.072..32730.073 rows=12 loops=3)
Sort Key: (st_hausdorffdistance('01020000003F000000EB36A8FDD65E21C07C9E3F6D54954440511212691B5F21C0A26131EA5A9544403788D68A365F21C02F52280B5F954440386BF0BE2A5F21C0CF15A5846095444005FBAF73D35E21C0828FC18A53954440520DFB3DB15E21C0F5BBB0355B954440ECC20FCEA75E21C0BB421F2C639544409FABADD85F5E21C008AC1C5A6495444055850662D95C21C07C9E3F6D549544408B338639415B21C0F581E49D439544408C683BA6EE5A21C062A06B5F409544400F9D9E77635921C082380F2730954440910BCEE0EF5721C042942F68219544409240834D9D5721C00FEF39B01C954440AE9E93DE375621C0DC2C5E2C0C9544407D1F0E12A25421C0A96A82A8FB94444019AE0E80B85321C0967A1684F294444066868DB27E5321C09C6B98A1F19444409AEC9FA7015321C0CFF3A78DEA9444409D2FF65E7C5121C09C31CC09DA944440D3DD7536E44F21C0706072A3C8944440A2410A9E424E21C0E94317D4B79444408B34F10EF04C21C04963B48EAA944440F261F6B2ED4C21C0505436ACA99444402593533BC34C21C0B6813B50A7944440DBC35E28604B21C076DD5B9198944440A93121E6924A21C003B16CE6909444402BC24D46954921C04A0C022B87944440AB3FC230604921C0B72A89EC839444402B14E97E4E4921C063D009A183944440E014562AA84821C043FE99417C9444407973B8567B4821C0EAB298D87C944440C7BAB88D064821C00AA2EE03909444402F185C73474721C0BD72BD6DA6944440494BE5ED084721C03D81B053AC9444404A0C022B874621C090F8156BB8944440CB2DAD86C44521C0569C6A2DCC94444019AA622AFD4421C0096D3997E2944440B4E6C75F5A4421C0293FA9F6E9944440E869C020E94321C0E36F7B82C4944440EA42ACFE084321C0639B5434D69444403811FDDAFA4121C043209738F29444406EA7AD11C14021C0BC202235ED944440BC7A15191D4021C0D6E429ABE9944440A2B60DA3204021C0D6E429ABE99444403B8908FF224021C0838AAA5FE994444008AA46AF064021C0838AAA5FE9944440A48AE255D63E21C0709A3E3BE09444408D43FD2E6C3D21C0707D586FD4944440F661BD512B3C21C0569C6A2DCC9444402BA6D24F383B21C08333F8FBC594444093E1783E033A21C009168733BF9444407A8CF2CCCB3921C023DA8EA9BB9444407B4D0F0A4A3921C09DDA19A6B6944440C84274081C3921C056629E95B49444402E7079AC193921C0B69E211CB3944440E38DCC237F3821C0D653ABAFAE944440B05758703F3821C0D653ABAFAE944440B01D8CD8273821C096CCB1BCAB944440FDC0559E403821C0B056ED9A9094444016A243E0483821C01684F23E8E944440630B410E4A3821C0C32973F38D94444030664B56453821C0FDA204FD85944440'::geometry, (polyline)::geometry))
Sort Method: top-N heapsort  Memory: 26kB
Worker 0:  Sort Method: top-N heapsort  Memory: 26kB
Worker 1:  Sort Method: top-N heapsort  Memory: 26kB
->  Parallel Seq Scan on taxi  (cost=0.00..9070209.38 rows=708750 width=8) (actual time=0.169..32703.019 rows=568256 loops=3)
Planning Time: 0.066 ms
Execution Time: 32738.619 ms
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/


/**
* Test Case 4.1.1
* Test case index R-tree
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi_rtree, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi_rtree.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi_rtree
            WHERE ST_DWithin(taxi_rtree.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3000)
        )

/**
Outputs:
----
1350
----
Query Plan:
----------------------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=2847.25..2847.27 rows=1 width=32) (actual time=8.194..8.195 rows=1 loops=1)
Buffers: shared hit=7727
->  Hash Join  (cost=24.96..2847.12 rows=1 width=821) (actual time=7.231..8.188 rows=5 loops=1)
Hash Cond: (taxi_rtree.trip_id = taxi_rtree_1.trip_id)
Buffers: shared hit=7727
->  Nested Loop  (cost=1.78..2819.46 rows=1705 width=834) (actual time=0.071..2.188 rows=1524 loops=1)
Buffers: shared hit=2313
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.015..0.015 rows=1 loops=1)
Buffers: shared hit=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.014..0.014 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared hit=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.004..0.005 rows=16 loops=1)
Buffers: shared hit=1
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2816.51 rows=170 width=866) (actual time=0.054..2.114 rows=1524 loops=1)
Index Cond: (end_point && _st_expand(hotels.geom, '10'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '10'::double precision, true)
Rows Removed by Filter: 659
Buffers: shared hit=2312
->  Hash  (cost=21.05..21.05 rows=170 width=13) (actual time=5.878..5.878 rows=4789 loops=1)
Buckets: 8192 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 275kB
Buffers: shared hit=5414
->  Index Scan using start_rtree on taxi_rtree taxi_rtree_1  (cost=0.54..21.05 rows=170 width=13) (actual time=0.053..5.513 rows=4789 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision))
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision, true)
Rows Removed by Filter: 476
Buffers: shared hit=5414
Planning:
Buffers: shared hit=16
Planning Time: 11.912 ms
Execution Time: 8.233 ms
----------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 4.1.2
* Test case index R-tree
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi_rtree, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi_rtree.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi_rtree
            WHERE ST_DWithin(taxi_rtree.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3100)
        )

/**
Outputs:
----
1350
----
Query Plan:
----------------------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=2847.25..2847.27 rows=1 width=32) (actual time=5.209..5.210 rows=1 loops=1)
Buffers: shared hit=7819
->  Hash Join  (cost=24.96..2847.12 rows=1 width=821) (actual time=4.429..5.203 rows=5 loops=1)
Hash Cond: (taxi_rtree.trip_id = taxi_rtree_1.trip_id)
Buffers: shared hit=7819
->  Nested Loop  (cost=1.78..2819.46 rows=1705 width=834) (actual time=0.042..1.657 rows=1524 loops=1)
Buffers: shared hit=2313
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.007..0.008 rows=1 loops=1)
Buffers: shared hit=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.007..0.007 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared hit=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.003..0.004 rows=16 loops=1)
Buffers: shared hit=1
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2816.51 rows=170 width=866) (actual time=0.034..1.591 rows=1524 loops=1)
Index Cond: (end_point && _st_expand(hotels.geom, '10'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '10'::double precision, true)
Rows Removed by Filter: 659
Buffers: shared hit=2312
->  Hash  (cost=21.05..21.05 rows=170 width=13) (actual time=3.421..3.422 rows=4830 loops=1)
Buckets: 8192 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 277kB
Buffers: shared hit=5506
->  Index Scan using start_rtree on taxi_rtree taxi_rtree_1  (cost=0.54..21.05 rows=170 width=13) (actual time=0.060..3.064 rows=4830 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision))
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision, true)
Rows Removed by Filter: 522
Buffers: shared hit=5506
Planning:
Buffers: shared hit=16
Planning Time: 0.448 ms
Execution Time: 5.224 ms
----------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 4.1.3
* Test case index R-tree
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi_rtree, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi_rtree.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi_rtree
            WHERE ST_DWithin(taxi_rtree.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3150)
        )

/**
Outputs:
----
1350
----
Query Plan:
----------------------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=2847.25..2847.27 rows=1 width=32) (actual time=5.162..5.163 rows=1 loops=1)
Buffers: shared hit=7850
->  Hash Join  (cost=24.96..2847.12 rows=1 width=821) (actual time=4.313..5.155 rows=5 loops=1)
Hash Cond: (taxi_rtree.trip_id = taxi_rtree_1.trip_id)
Buffers: shared hit=7850
->  Nested Loop  (cost=1.78..2819.46 rows=1705 width=834) (actual time=0.036..1.741 rows=1524 loops=1)
Buffers: shared hit=2313
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.005..0.005 rows=1 loops=1)
Buffers: shared hit=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.005..0.005 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared hit=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.002..0.003 rows=16 loops=1)
Buffers: shared hit=1
->  Index Scan using end_rtree on taxi_rtree  (cost=0.54..2816.51 rows=170 width=866) (actual time=0.030..1.679 rows=1524 loops=1)
Index Cond: (end_point && _st_expand(hotels.geom, '10'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '10'::double precision, true)
Rows Removed by Filter: 659
Buffers: shared hit=2312
->  Hash  (cost=21.05..21.05 rows=170 width=13) (actual time=3.290..3.290 rows=4871 loops=1)
Buckets: 8192 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 279kB
Buffers: shared hit=5537
->  Index Scan using start_rtree on taxi_rtree taxi_rtree_1  (cost=0.54..21.05 rows=170 width=13) (actual time=0.064..2.914 rows=4871 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision))
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision, true)
Rows Removed by Filter: 510
Buffers: shared hit=5537
Planning:
Buffers: shared hit=16
Planning Time: 0.348 ms
Execution Time: 5.174 ms
----------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 4.2.1
* Test case index Quad tree
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi_quad, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi_quad.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi_quad
            WHERE ST_DWithin(taxi_quad.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3000)
        )

/**
Outputs:
----
1350
----
Query Plan:
-------------------------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=50184.99..50185.00 rows=1 width=32) (actual time=252.685..252.742 rows=1 loops=1)
Buffers: shared hit=90731 read=38494
->  Hash Semi Join  (cost=47362.69..50184.86 rows=1 width=825) (actual time=247.093..252.733 rows=5 loops=1)
Hash Cond: (taxi_quad.trip_id = taxi_quad_1.trip_id)
Buffers: shared hit=90731 read=38494
->  Nested Loop  (cost=1.78..2819.46 rows=1705 width=838) (actual time=98.821..124.913 rows=1524 loops=1)
Buffers: shared hit=48167 read=16983
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.009..0.010 rows=1 loops=1)
Buffers: shared read=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.009..0.009 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared read=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.004..0.005 rows=16 loops=1)
Buffers: shared read=1
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2816.51 rows=170 width=870) (actual time=98.810..124.843 rows=1524 loops=1)
Index Cond: (end_point && _st_expand(hotels.geom, '10'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '10'::double precision, true)
Rows Removed by Filter: 659
Buffers: shared hit=48167 read=16982
->  Hash  (cost=47358.79..47358.79 rows=170 width=13) (actual time=127.538..127.594 rows=4789 loops=1)
Buckets: 8192 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 275kB
Buffers: shared hit=42564 read=21511
->  Gather  (cost=1220.41..47358.79 rows=170 width=13) (actual time=117.876..127.169 rows=4789 loops=1)
Workers Planned: 2
Workers Launched: 2
Buffers: shared hit=42564 read=21511
->  Parallel Bitmap Heap Scan on taxi_quad taxi_quad_1  (cost=220.41..46341.79 rows=71 width=13) (actual time=115.424..120.530 rows=1596 loops=3)
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision, true)
Rows Removed by Filter: 159
Heap Blocks: exact=3554
Buffers: shared hit=42564 read=21511
->  Bitmap Index Scan on start_quadtree  (cost=0.00..220.37 rows=5311 width=0) (actual time=117.398..117.398 rows=5265 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision))
Buffers: shared hit=41979 read=16472
Planning Time: 0.637 ms
Execution Time: 257.741 ms
-------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 4.2.2
* Test case index Quad tree
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi_quad, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi_quad.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi_quad
            WHERE ST_DWithin(taxi_quad.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3100)
        )

/**
Outputs:
----
1350
----
Query Plan:
------------------------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=51478.86..51478.87 rows=1 width=32) (actual time=227.705..227.746 rows=1 loops=1)
Buffers: shared hit=90742 read=38563
->  Hash Semi Join  (cost=48656.56..51478.72 rows=1 width=825) (actual time=222.153..227.736 rows=5 loops=1)
Hash Cond: (taxi_quad.trip_id = taxi_quad_1.trip_id)
Buffers: shared hit=90742 read=38563
->  Nested Loop  (cost=1.78..2819.46 rows=1705 width=838) (actual time=86.191..111.696 rows=1524 loops=1)
Buffers: shared hit=48105 read=17045
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.009..0.009 rows=1 loops=1)
Buffers: shared read=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.009..0.009 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared read=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.005..0.006 rows=16 loops=1)
Buffers: shared read=1
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2816.51 rows=170 width=870) (actual time=86.180..111.625 rows=1524 loops=1)
Index Cond: (end_point && _st_expand(hotels.geom, '10'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '10'::double precision, true)
Rows Removed by Filter: 659
Buffers: shared hit=48105 read=17044
->  Hash  (cost=48652.66..48652.66 rows=170 width=13) (actual time=115.773..115.813 rows=4830 loops=1)
Buckets: 8192 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 277kB
Buffers: shared hit=42637 read=21518
->  Gather  (cost=1229.56..48652.66 rows=170 width=13) (actual time=106.331..115.399 rows=4830 loops=1)
Workers Planned: 2
Workers Launched: 2
Buffers: shared hit=42637 read=21518
->  Parallel Bitmap Heap Scan on taxi_quad taxi_quad_1  (cost=229.56..47635.66 rows=71 width=13) (actual time=96.541..101.400 rows=1610 loops=3)
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision, true)
Rows Removed by Filter: 174
Heap Blocks: exact=3712
Buffers: shared hit=42637 read=21518
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.52 rows=5464 width=0) (actual time=105.854..105.854 rows=5352 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision))
Buffers: shared hit=42052 read=16399
Planning Time: 0.811 ms
Execution Time: 232.575 ms
------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 4.2.3
* Test case index Quad tree
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi_quad, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi_quad.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi_quad
            WHERE ST_DWithin(taxi_quad.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3150)
        )

/**
Outputs:
----
1350
----
Query Plan:
-------------------------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=51964.34..51964.35 rows=1 width=32) (actual time=253.240..253.282 rows=1 loops=1)
Buffers: shared hit=90842 read=38488
->  Hash Semi Join  (cost=49142.04..51964.20 rows=1 width=825) (actual time=247.392..253.273 rows=5 loops=1)
Hash Cond: (taxi_quad.trip_id = taxi_quad_1.trip_id)
Buffers: shared hit=90842 read=38488
->  Nested Loop  (cost=1.78..2819.46 rows=1705 width=838) (actual time=92.444..119.425 rows=1524 loops=1)
Buffers: shared hit=48112 read=17038
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.010..0.011 rows=1 loops=1)
Buffers: shared read=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.010..0.010 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared read=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.005..0.006 rows=16 loops=1)
Buffers: shared read=1
->  Index Scan using end_quadtree on taxi_quad  (cost=0.54..2816.51 rows=170 width=870) (actual time=92.432..119.353 rows=1524 loops=1)
Index Cond: (end_point && _st_expand(hotels.geom, '10'::double precision))
Filter: st_dwithin(hotels.geom, end_point, '10'::double precision, true)
Rows Removed by Filter: 659
Buffers: shared hit=48112 read=17037
->  Hash  (cost=49138.14..49138.14 rows=170 width=13) (actual time=133.570..133.611 rows=4871 loops=1)
Buckets: 8192 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 279kB
Buffers: shared hit=42730 read=21450
->  Gather  (cost=1229.99..49138.14 rows=170 width=13) (actual time=123.597..133.205 rows=4871 loops=1)
Workers Planned: 2
Workers Launched: 2
Buffers: shared hit=42730 read=21450
->  Parallel Bitmap Heap Scan on taxi_quad taxi_quad_1  (cost=229.99..48121.14 rows=71 width=13) (actual time=120.962..126.425 rows=1624 loops=3)
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision, true)
Rows Removed by Filter: 170
Heap Blocks: exact=3510
Buffers: shared hit=42730 read=21450
->  Bitmap Index Scan on start_quadtree  (cost=0.00..229.95 rows=5522 width=0) (actual time=112.010..112.010 rows=5381 loops=1)
Index Cond: (start_point && _st_expand('0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision))
Buffers: shared hit=42145 read=16306
Planning Time: 0.838 ms
Execution Time: 259.633 ms
-------------------------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 4.3.1
* Test case index No index
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi
            WHERE ST_DWithin(taxi.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3000)
        )

/**
Outputs:
----
1350
----
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=9282507.23..9282507.24 rows=1 width=32) (actual time=777.025..779.826 rows=1 loops=1)
Buffers: shared hit=1473 read=403470
->  Nested Loop  (cost=9069439.63..9282507.10 rows=1 width=820) (actual time=735.948..779.809 rows=5 loops=1)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '10'::double precision, true)
Rows Removed by Join Filter: 4784
Buffers: shared hit=1473 read=403470
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.009..0.010 rows=1 loops=1)
Buffers: shared hit=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.009..0.009 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared hit=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.003..0.004 rows=16 loops=1)
Buffers: shared hit=1
->  Gather  (cost=9069438.39..9280379.15 rows=170 width=852) (actual time=599.131..776.711 rows=4789 loops=1)
Workers Planned: 2
Workers Launched: 2
Buffers: shared hit=1472 read=403470
->  Parallel Hash Semi Join  (cost=9068438.39..9279362.15 rows=71 width=852) (actual time=593.084..769.479 rows=1596 loops=3)
Hash Cond: (taxi.trip_id = taxi_1.trip_id)
Buffers: shared hit=1472 read=403470
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=865) (actual time=0.007..128.139 rows=568256 loops=3)
Buffers: shared hit=288 read=201687
->  Parallel Hash  (cost=9068437.50..9068437.50 rows=71 width=13) (actual time=592.759..592.759 rows=1596 loops=3)
Buckets: 4096 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 344kB
Buffers: shared hit=1018 read=201783
->  Parallel Seq Scan on taxi taxi_1  (cost=0.00..9068437.50 rows=71 width=13) (actual time=4.237..509.047 rows=1596 loops=3)
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3000'::double precision, true)
Rows Removed by Filter: 566660
Buffers: shared hit=1018 read=201783
Planning Time: 1.817 ms
Execution Time: 779.849 ms
--------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 4.3.2
* Test case index No index
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi
            WHERE ST_DWithin(taxi.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3100)
        )

/**
Outputs:
----
1350
----
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=9282507.23..9282507.24 rows=1 width=32) (actual time=806.527..808.971 rows=1 loops=1)
Buffers: shared hit=2241 read=402702
->  Nested Loop  (cost=9069439.63..9282507.10 rows=1 width=820) (actual time=763.389..808.953 rows=5 loops=1)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '10'::double precision, true)
Rows Removed by Join Filter: 4825
Buffers: shared hit=2241 read=402702
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.011..0.012 rows=1 loops=1)
Buffers: shared hit=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.011..0.011 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared hit=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.003..0.004 rows=16 loops=1)
Buffers: shared hit=1
->  Gather  (cost=9069438.39..9280379.15 rows=170 width=852) (actual time=621.630..805.788 rows=4830 loops=1)
Workers Planned: 2
Workers Launched: 2
Buffers: shared hit=2240 read=402702
->  Parallel Hash Semi Join  (cost=9068438.39..9279362.15 rows=71 width=852) (actual time=615.763..798.946 rows=1610 loops=3)
Hash Cond: (taxi.trip_id = taxi_1.trip_id)
Buffers: shared hit=2240 read=402702
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=865) (actual time=0.008..134.077 rows=568256 loops=3)
Buffers: shared hit=672 read=201303
->  Parallel Hash  (cost=9068437.50..9068437.50 rows=71 width=13) (actual time=615.425..615.425 rows=1610 loops=3)
Buckets: 4096 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 312kB
Buffers: shared hit=1402 read=201399
->  Parallel Seq Scan on taxi taxi_1  (cost=0.00..9068437.50 rows=71 width=13) (actual time=4.197..507.556 rows=1610 loops=3)
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3100'::double precision, true)
Rows Removed by Filter: 566646
Buffers: shared hit=1402 read=201399
Planning Time: 0.183 ms
Execution Time: 808.990 ms
--------------------------------------------------------------------------------------------------------------------------------
*/

/**
* Test Case 4.3.3
* Test case index No index
*/

        SElECT AVG(ST_NumPoints(polyline::geometry)) * 15 AS time FROM taxi, (
            SELECT geom FROM hotels
            ORDER BY popularity DESC
            LIMIT 1
        ) AS subquery
        WHERE ST_DWithin(subquery.geom, taxi.end_point, 10) AND trip_id IN (
            SELECT trip_id
            FROM taxi
            WHERE ST_DWithin(taxi.start_point, ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'), 3150)
        )

/**
Outputs:
----
1350
----
Query Plan:
--------------------------------------------------------------------------------------------------------------------------------
Aggregate  (cost=9282507.23..9282507.24 rows=1 width=32) (actual time=769.244..771.788 rows=1 loops=1)
Buffers: shared hit=3009 read=401934
->  Nested Loop  (cost=9069439.63..9282507.10 rows=1 width=820) (actual time=728.347..771.769 rows=5 loops=1)
Join Filter: st_dwithin(hotels.geom, taxi.end_point, '10'::double precision, true)
Rows Removed by Join Filter: 4866
Buffers: shared hit=3009 read=401934
->  Limit  (cost=1.24..1.24 rows=1 width=64) (actual time=0.012..0.013 rows=1 loops=1)
Buffers: shared hit=1
->  Sort  (cost=1.24..1.28 rows=16 width=64) (actual time=0.012..0.012 rows=1 loops=1)
Sort Key: hotels.popularity DESC
Sort Method: top-N heapsort  Memory: 25kB
Buffers: shared hit=1
->  Seq Scan on hotels  (cost=0.00..1.16 rows=16 width=64) (actual time=0.006..0.007 rows=16 loops=1)
Buffers: shared hit=1
->  Gather  (cost=9069438.39..9280379.15 rows=170 width=852) (actual time=592.318..768.636 rows=4871 loops=1)
Workers Planned: 2
Workers Launched: 2
Buffers: shared hit=3008 read=401934
->  Parallel Hash Semi Join  (cost=9068438.39..9279362.15 rows=71 width=852) (actual time=586.551..761.970 rows=1624 loops=3)
Hash Cond: (taxi.trip_id = taxi_1.trip_id)
Buffers: shared hit=3008 read=401934
->  Parallel Seq Scan on taxi  (cost=0.00..209062.50 rows=708750 width=865) (actual time=0.011..126.729 rows=568256 loops=3)
Buffers: shared hit=1056 read=200919
->  Parallel Hash  (cost=9068437.50..9068437.50 rows=71 width=13) (actual time=586.196..586.196 rows=1624 loops=3)
Buckets: 4096 (originally 1024)  Batches: 1 (originally 1)  Memory Usage: 344kB
Buffers: shared hit=1786 read=201015
->  Parallel Seq Scan on taxi taxi_1  (cost=0.00..9068437.50 rows=71 width=13) (actual time=3.919..509.343 rows=1624 loops=3)
Filter: st_dwithin(start_point, '0101000020E61000005C8FC2F5285C21C00000000000A04440'::geography, '3150'::double precision, true)
Rows Removed by Filter: 566633
Buffers: shared hit=1786 read=201015
Planning Time: 0.193 ms
Execution Time: 771.817 ms
--------------------------------------------------------------------------------------------------------------------------------
*/
