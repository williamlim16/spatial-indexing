import re
from alive_progress.animations.bars import bar_factory
from alive_progress.core.progress import config_handler
import pandas as pd
import psycopg2
from tabulate import tabulate
from template import TemplateOutput
from test_cases import test_cases
from alive_progress import alive_bar

def init_database():
    connection = psycopg2.connect(user="williamlim", password="", host="127.0.0.1", database="project")
    cursor = connection.cursor()
    return cursor

cursor = init_database()

output_file = "output.sql"
bar = bar_factory('🔥', tip='🌟')

with open(output_file, "w+") as f:
    with alive_bar(len(test_cases), bar=bar, spinner='fish') as bar:
        for test in test_cases:
            cursor.execute(test['query'])
            q_res = cursor.fetchall()
            q_res = tabulate(q_res)
            cursor.execute("EXPLAIN ANALYZE "+test['query'])
            q_analyze = cursor.fetchall()
            q_analyze =tabulate(q_analyze)
            template_output = TemplateOutput(
                query=test['query'],
                query_result=q_res,
                query_analyze=q_analyze,
                test_case=test['test_case'],
                test_case_index=test['test_case_index'])
            # print(template_output.return_format())
            f.write(template_output.return_format())
            bar()

# planning = 0
# execution = 0
# pattern = r'\d+\.?\d*'
# results = []
# query = """
# EXPLAIN ANALYZE SELECT count(*) FROM public.taxi_rtree
# WHERE ST_DWithin(
#   ST_GeogFromText('SRID=4326;POINT(-8.68 41.25)'),
#   start_point, 3000)
#   """
# cursor.execute(query)
# taxis = cursor.fetchall()

# for (idx, row) in enumerate(taxis):
#     results.append(taxis[idx][0])

#     if idx == len(taxis) - 1:
#         planning = re.findall(pattern, taxis[idx][0])[0]

#     if idx == len(taxis) - 2:
#         execution = re.findall(pattern, taxis[idx][0])[0]

# q_plan = "\n".join(results)

# test_tamplate = TemplateOutput(query=query, query_plan=q_plan, query_result=q_plan, test_case=1, test_case_index="r-Tree")
# print(test_tamplate.return_format())
