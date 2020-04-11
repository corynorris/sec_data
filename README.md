# SecData

## Overview

Downloads data from the SEC Archives, inclduding:

- Symbols, CIK Codes and Company Names
- All submissions and their numbers

Note, the dataset is quite large and consumes about 46GB as of the time of writting (Q2 2020). The application is configured to checks for new data weekly, so if growing data size is a concern disable the quantum task in the `config.exe` file.

## API

The API exposes the following paths

| VERB | Route                                               | Params      | Details                                                                                                              |
| ---- | --------------------------------------------------- | ----------- | -------------------------------------------------------------------------------------------------------------------- |
| GET  | /api/search                                         | term:string | Searches for ticker in the companies.                                                                                |
| GET  | /api/companies                                      | page:int    | Returns a paginated list of companies and tickers                                                                    |
| GET  | /api/companies/:cik                                 | cik:int     | Returns a companies metadata for a given CIK                                                                         |
| GET  | /api/companies/:cik/submissions                     | cik:int     | Returns all submissions for a given CIK                                                                              |
| GET  | /api/companies/:cik/submissions/:adsh/presentations | adsh:string | Returns detailed numbers presented by a company a given adsh                                                         |
| GET  | /api/companies/:cik/submissions/:adsh/numerics      | adsh:string | Returns all numbers submitted by a company, regardless of whether they were presented in a statement for a give adsh |

The downloaded data cover about 12,000 companies but the api filters out companies without data, so only about 7000 are returned.

## Usage

In all likelyhood, you will most likely be concerned with presented numerics, ie those found under `/api/companies/:cik/submissions/:adsh/presentations`. Here you can look for records presented in a specific statement (stmt):

- balance_sheet
- income_statement
- cash_flow
- equity
- comprehensive_income
- unclassifiable
- cover_page

It should be noted that presented numbers often include previous years financials for comparison. Filtering the result date submitted will give you the current financials. If this is in fact what you're looking to do, you can jump straight to the `/api/companies/:cik/submissions/statements` endpoint which will return all '10-Q' and '10-K' filings for the full duration of the company. Also not that the statements endpoint applies the following filtering:

- iord is not null
- statement.period == numeric.ddate
