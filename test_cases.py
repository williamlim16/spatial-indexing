test_cases = [
    # Test Case 1
    {
        "test_case": "1.1.1",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "R tree",
        "query": """
        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        """,
    },
    {
        "test_case": "1.1.2",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "R tree",
        "query": """
        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        """,
    },
    {
        "test_case": "1.1.3",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "R tree",
        "query": """
        SELECT count(*) FROM public.taxi_rtree
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        """,
    },
    {
        "test_case": "1.2.1",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "Quad tree",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        """,
    },
    {
        "test_case": "1.2.2",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "Quad tree",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        """,
    },
    {
        "test_case": "1.2.3",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "Quad tree",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        """,
    },
    {
        "test_case": "1.3.1",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "No index",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3000)
        """,
    },
    {
        "test_case": "1.3.2",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "No index",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3100)
        """,
    },
    {
        "test_case": "1.3.3",
        "query_task": "Searching how many people are traveling from the airport",
        "test_case_index": "No index",
        "query": """
        SELECT count(*) FROM public.taxi_quad
        WHERE ST_DWithin(
        ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
        start_point, 3150)
        """,
    },
    # Test Case 2
    {
        "test_case": "2.1.1",
        "query_task": "Searching most popular hotel",
        "test_case_index": "R tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
        WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "2.1.2",
        "query_task": "Searching most popular hotel",
        "test_case_index": "R tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
                    WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "2.1.3",
        "query_task": "Searching most popular hotel",
        "test_case_index": "R tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_rtree, public.hotels
        WHERE ST_DWithin(
          hotels.geom,
          taxi_rtree.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "2.2.1",
        "query_task": "Searching most popular hotel",
        "test_case_index": "Quad tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "2.2.2",
        "query_task": "Searching most popular hotel",
        "test_case_index": "Quad tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "2.2.3",
        "query_task": "Searching most popular hotel",
        "test_case_index": "Quad tree",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi_quad, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi_quad.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "2.3.1",
        "query_task": "Searching most popular hotel",
        "test_case_index": "No index",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 1)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "2.3.2",
        "query_task": "Searching most popular hotel",
        "test_case_index": "No index",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 3)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "2.3.3",
        "query_task": "Searching most popular hotel",
        "test_case_index": "No index",
        "query": """
        SELECT hotels.hotel, count(*) FROM public.taxi, public.hotels
        WHERE ST_DWithin(
            hotels.geom,
            taxi.end_point, 5)
        GROUP BY hotel
        ORDER BY count DESC
        """,
    },
    {
        "test_case": "3.1.1",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "R tree",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_rtree
        ORDER BY sim ASC
        LIMIT 5
        """,
    },
    {
        "test_case": "3.1.2",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "R tree",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_rtree
        ORDER BY sim ASC
        LIMIT 10
        """,
    },
    {
        "test_case": "3.1.3",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "R tree",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_rtree
        ORDER BY sim ASC
        LIMIT 15
        """,
    },
    {
        "test_case": "3.2.1",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "Quad tree",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_quad
        ORDER BY sim ASC
        LIMIT 5
        """,
    },
    {
        "test_case": "3.2.2",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "Quad tree",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_quad
        ORDER BY sim ASC
        LIMIT 10
        """,
    },
    {
        "test_case": "3.2.3",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "Quad tree",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi_quad
        ORDER BY sim ASC
        LIMIT 15
        """,
    },
    {
        "test_case": "3.3.1",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "No index",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi
        ORDER BY sim ASC
        LIMIT 5
        """,
    },
    {
        "test_case": "3.3.2",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "No index",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi
        ORDER BY sim ASC
        LIMIT 10
        """,
    },
    {
        "test_case": "3.3.3",
        "query_task": "Searching trajectory to the most popular destination",
        "test_case_index": "No index",
        "query": """
        SELECT ST_HausdorffDistance(
           	ST_GeomFromText('LINESTRING(-8.685234 41.166639,-8.685756 41.166837,-8.685963 41.166963,-8.685873 41.167008,-8.685207 41.166612,-8.684946 41.166846,-8.684874 41.167089,-8.684325 41.167125,-8.681346 41.166639,-8.678232 41.166126,-8.677602 41.166027,-8.674587 41.165532,-8.671752 41.165082,-8.671122 41.164938,-8.668395 41.164434,-8.665299 41.16393,-8.663517 41.163651,-8.663076 41.163624,-8.662122 41.163408,-8.659152 41.162904,-8.656038 41.162373,-8.652852 41.16186,-8.650269 41.161455,-8.650251 41.161428,-8.649927 41.161356,-8.647218 41.160906,-8.645652 41.160672,-8.643717 41.160375,-8.643312 41.160276,-8.643177 41.160267,-8.641908 41.160042,-8.641566 41.16006,-8.640675 41.160645,-8.639217 41.161329,-8.63874 41.161509,-8.63775 41.161878,-8.636265 41.162481,-8.634744 41.163165,-8.633502 41.16339,-8.632638 41.162247,-8.630928 41.162787,-8.628867 41.163642,-8.626473 41.163489,-8.625222 41.163381,-8.625249 41.163381,-8.625267 41.163372,-8.625051 41.163372,-8.622729 41.163093,-8.619966 41.162733,-8.617518 41.162481,-8.615664 41.162292,-8.613306 41.162085,-8.612883 41.161977,-8.611893 41.161824,-8.611542 41.161761,-8.611524 41.161716,-8.610345 41.161581,-8.609859 41.161581,-8.609679 41.161491,-8.609868 41.160663,-8.609931 41.160591,-8.60994 41.160582,-8.609904 41.160339)'),
           	polyline::geometry
        ) AS sim FROM taxi
        ORDER BY sim ASC
        LIMIT 15
        """,
    },
    {
        "test_case": "4.1.1",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "R-tree",
        "query": """
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
        """,
    },
    {
        "test_case": "4.1.2",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "R-tree",
        "query": """
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
        """,
    },
    {
        "test_case": "4.1.3",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "R-tree",
        "query": """
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
        """,
    },
    {
        "test_case": "4.2.1",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "Quad tree",
        "query": """
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
        """,
    },
    {
        "test_case": "4.2.2",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "Quad tree",
        "query": """
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
        """
    },
    {
        "test_case": "4.2.3",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "Quad tree",
        "query": """
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
        """,
    },
    {
        "test_case": "4.3.1",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "No index",
        "query": """
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
        """,
    },
    {
        "test_case": "4.3.2",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "No index",
        "query": """
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
        """,
    },
    {
        "test_case": "4.3.3",
        "query_task": "Average time spent from airport to the most popular hotel",
        "test_case_index": "No index",
        "query": """
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
        """,
    }
]
