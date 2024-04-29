import logging
from alive_progress.animations.bars import bar_factory
from alive_progress.core.progress import config_handler
from tabulate import tabulate
from template import TemplateOutput
from test_cases import test_cases
from alive_progress import alive_bar


def generate_report(cursor, case: int | None, repetition: int):
    output_file = "output.sql"
    bar = bar_factory("🔥", tip="🌟")
    logging.basicConfig(level=logging.INFO)
    bar_length = len(test_cases * repetition)
    if case == 1:
        output_file = "1_out.sql"
        bar_length = bar_length / 4

    if case == 2:
        output_file = "2_out.sql"
        bar_length = bar_length / 4

    if case == 3:
        output_file = "3_out.sql"
        bar_length = bar_length / 4

    if case == 4:
        output_file = "4_out.sql"
        bar_length = bar_length / 4

    with open(output_file, "w+") as f:
        with alive_bar(int(bar_length), bar=bar, spinner="fish") as bar:
            for test in test_cases:
                if case == 1 and test["test_case"][0] != "1":
                    continue

                if case == 2 and test["test_case"][0] != "2":
                    continue

                if case == 3 and test["test_case"][0] != "3":
                    continue

                if case == 4 and test["test_case"][0] != "4":
                    continue

                for rep in range(repetition):
                    cursor.execute(test["query"])
                    q_res = cursor.fetchall()
                    q_res = tabulate(q_res)
                    cursor.execute("EXPLAIN (BUFFERS, ANALYZE) " + test["query"])
                    q_analyze = cursor.fetchall()
                    q_analyze = tabulate(q_analyze)
                    template_output = TemplateOutput(
                        query=test["query"],
                        query_result=q_res,
                        query_analyze=q_analyze,
                        test_case=test["test_case"],
                        test_case_index=test["test_case_index"],
                    )
                    # print(template_output.return_format())
                    f.write(template_output.return_format())
                    logging.info(f"Test Case: {test['test_case']} Repetition: {rep+1}")
                    bar()
                bar()
