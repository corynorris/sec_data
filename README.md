# SecData

## Overview

Downloads data from the SEC Archives, inclduding:

- Symbols, CIK Codes and Company Names
- All submissions and their numbers

Note, the dataset is quite large and consumes about 46GB as of the time of writting (Q2 2020). The application is configured to checks for new data weekly, so if growing data size is a concern disable the quantum task in the `config.exe` file.

## API

The API exposes the following paths

| VERB | Route                                            | Params                  | Details                                                                                                                          |
| ---- | ------------------------------------------------ | ----------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| GET  | /api/search                                      | term:string             | Searches for ticker in the companies.                                                                                            |
| GET  | /api/companies                                   | page:int, page_size:int | Returns a paginated list of companies and tickers, where page is the current page and page_size is the numer of records per page |
| GET  | /api/companies/:cik                              | cik:int                 | Returns a companies metadata for a given CIK                                                                                     |
| GET  | /api/companies/:cik/statements                   | cik:int                 | Returns all 10-k and 10-q filings for that company                                                                               |
| GET  | /api/companies/:cik/submissions                  | cik:int                 | Returns all submissions for a given CIK                                                                                          |
| GET  | /api/companies/:cik/submissions/:adsh/statements | adsh:string             | Returns detailed numbers presented by a company a given adsh                                                                     |
| GET  | /api/companies/:cik/submissions/:adsh/numerics   | adsh:string             | Returns all numbers submitted by a company, regardless of whether they were presented in a statement for a give adsh             |

The downloaded data cover about 12,000 companies but the api filters out companies without data, so only about 7000 are returned.

## Usage

Depending on your needs, you can get a summary of all presented numerics for a given company via: `/api/companies/:cik/submissions/:adsh/statements`. Alternately, you can get the full set of submitted numerics (included those note presented) via: `/api/companies/:cik/submissions/:adsh/numerics`. Presented numerics are those that the company has included as part of one of the following financial groupings:

- balance_sheet
- income_statement
- cash_flow
- equity
- comprehensive_income
- unclassifiable
- cover_page

If however you're interested strictly in annual (10-k) and quarterly (10-Q) data then you can get the full set via the endpoint `/api/companies/:cik/statements`. This set filters on those statements as well as a non abstract data (iord != null).
