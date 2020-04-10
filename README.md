# SecData

Downloads data from the SEC Archives, inclduding:

- Symbols, CIK Codes and Company Names
- All submissions and their numbers

Note, the dataset is quite large and consumes about 46GB as of the time of writting (Q2 2020). The application is configured to checks for new data weekly, so if growing data size is a concern disable the quantum task in the `config.exe` file.

# Api

The API exposes the following paths

|VERB|Route|Params|Details|
|GET| /api/search | term:string | Searches for ticker in the companies |
|GET| /api/companies | page:int | Returns a paginated list of companies and tickers |
|GET| /api/companies/:cik | cik:int | Returns a companies metadata for a given CIK |
|GET| /api/companies/:cik/submissions | cik:int | Returns all submissions for a given CIK |
|GET| /api/companies/:adsh/submissions/:submission_id/presentations | adsh:string | Returns detailed numbers presented by a company a given adsh |
|GET| /api/companies/:adsh/submissions/:submission_id/numerics | adsh:string | Returns all numbers submitted by a company, regardless of whether they were presented in a statement for a give adsh|
