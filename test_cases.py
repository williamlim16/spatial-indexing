test_cases = [
    # Test Case 1
    {
        "test_case":"1.1.1",
        "query_task": "Searching how many people are traveling from the airport"
        "test_case_index":"R tree",
        "query": """
        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        """
    },
    {
        "test_case":"1.1.2",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index":"R tree",
        "query": """
        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        """
    },
    {
        "test_case":"1.1.3",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index":"R tree",
        "query": """
        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        """
    },
    {
        "test_case":"1.2.1",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index":"Quad tree",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        """
    },
    {
        "test_case":"1.2.2",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index":"Quad tree",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        """
    },
    {
        "test_case":"1.2.3",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index":"Quad tree",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        """
    },
    {
        "test_case":"1.3.1",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index":"No index",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        """
    },
    {
        "test_case":"1.3.2",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index":"No index",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        """
    },
    {
        "test_case":"1.3.3",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index":"No index",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        """
    },
    # Test Case 2
    {
        "test_case":"2.1.1",
        "query_task": "Searching most popular hotel",
        "test_case_index":"R tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
        WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"2.1.2",
        "query_task": "Searching most popular hotel",
        "test_case_index":"R tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
        WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"2.1.3",
        "query_task": "Searching most popular hotel",
        "test_case_index":"R tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
        WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"2.2.1",
        "query_task": "Searching most popular hotel",
        "test_case_index":"Quad tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"2.2.2",
        "query_task": "Searching most popular hotel",
        "test_case_index":"Quad tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"2.2.3",
        "query_task": "Searching most popular hotel",
        "test_case_index":"Quad tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"2.3.1",
        "query_task": "Searching most popular hotel",
        "test_case_index":"No index",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"2.3.2",
        "query_task": "Searching most popular hotel",
        "test_case_index":"No index",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"2.3.3",
        "query_task": "Searching most popular hotel",
        "test_case_index":"No index",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        """
    },
    {
        "test_case":"3.1.1",
        "query_task": "Searching most popular hotel",
        "test_case_index":"R tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        """
    }
]
