import re
import pandas as pd
import psycopg2
import logging
from alive_progress.animations.bars import bar_factory
from alive_progress.core.progress import config_handler
from tabulate import tabulate
from generate import generate_report
from template import TemplateOutput
from test_cases import test_cases
from alive_progress import alive_bar
import sys
from os import system


def init_database():
    connection = psycopg2.connect(
        user="williamlim", password="", host="127.0.0.1", database="project"
    )
    cursor = connection.cursor()
    return cursor


def display_menu(menu):
    for k, function in menu.items():
        print(k, function.__name__)


def gen_report(cursor):
    print("Generating report...")
    print("0. For all report")
    print("1. For test case 1")
    print("2. For test case 2")
    print("3. For test case 3")
    selection = int(input("Please enter your selection number: "))
    system("clear")
    repetition = 5
    if selection == 0 or selection == None:
        generate_report(cursor=cursor, case=None, repetition=repetition)
    elif selection == 1:
        generate_report(cursor=cursor, case=1, repetition=repetition)
    elif selection == 2:
        generate_report(cursor=cursor, case=2, repetition=repetition)
    elif selection == 3:
        generate_report(cursor=cursor, case=3, repetition=repetition)
    else:
        print("Invalid option!")
        system("clear")
        gen_report(cursor)


def perf_testing(cursor):
    print("you have selected menu option two")
    input("Press Enter to Continue\n")
    system("clear")


def done(cursor):
    system("clear")
    print("Goodbye")
    sys.exit()


def main():
    functions_names = [gen_report, perf_testing, done]
    menu_items = dict(enumerate(functions_names, start=1))
    cursor = init_database()

    while True:
        display_menu(menu_items)
        selection = int(input("Please enter your selection number: "))
        selected_value = menu_items[selection]
        selected_value(cursor)


main()

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
