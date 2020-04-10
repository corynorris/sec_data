import EctoEnum

defenum(DataSetType, finanicial: 0, company: 1)

defenum(FiscalPeriod, [
  "FY",
  "Q1",
  "Q2",
  "Q3",
  "Q4",
  "H1",
  "H2",
  "M9",
  "T1",
  "T2",
  "T3",
  "M8",
  "CY"
])

defenum(CreditDebit, credit: "C", debit: "D")

defenum(FinancialStatement,
  balance_sheet: "BS",
  income_statement: "IS",
  cash_flow: "CF",
  equity: "EQ",
  comprehensive_income: "CI",
  unclassifiable: "UN",
  cover_page: "CP"
)
