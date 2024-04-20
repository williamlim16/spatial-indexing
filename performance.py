import csv
import re
from test_cases import test_cases


def performance_test(cursor, case: int | None, repetition: int):
    output_file = "output.csv"
    with open(output_file, "w+") as f:
        writer = csv.writer(f)
        header = ["test_case", "indexing", "planning", "execution"]
        pattern = r"\d+\.?\d*"
        planning = 0
        execution = 0
        writer.writerow(header)
        for test in test_cases:
            if case == 1 and test["test_case"][0] != "1":
                continue
            if case == 2 and test["test_case"][0] != "2":
                continue
            if case == 3 and test["test_case"][0] != "3":
                continue

            for rep in range(repetition):
                cursor.execute("EXPLAIN (BUFFERS, ANALYZE) " + test["query"])
                q_analyze = cursor.fetchall()

                results = []
                for idx, row in enumerate(q_analyze):
                    results.append(q_analyze[idx][0])

                    if idx == len(q_analyze) - 1:
                        planning = re.findall(pattern, q_analyze[idx][0])[0]

                    if idx == len(q_analyze) - 2:
                        execution = re.findall(pattern, q_analyze[idx][0])[0]

                writer.writerow(
                    [
                        test["test_case"],
                        test["test_case_index"],
                        planning,
                        execution,
                    ]
                )
                print(f"Test Case: {test['test_case']} Repetition: {rep+1}")
