
class TemplateOutput:
    def __init__(self, test_case, test_case_index, query, query_analyze, query_result):
        self.query = query
        self.test_case = test_case
        self.test_case_index = test_case_index
        self.query_result = query_result
        self.query_analyze = query_analyze
        self.template_output = f"""
/**
* Test Case {self.test_case}
* Test case index {self.test_case_index}
*/
{self.query}
/**
Outputs:
{self.query_result}
Query Plan:
{self.query_analyze}
*/
"""

    def return_format(self):
        return self.template_output
