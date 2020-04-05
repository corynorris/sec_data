defmodule SecData.CompaniesTest do
  use SecData.DataCase

  alias SecData.Companies

  describe "companies" do
    alias SecData.Companies.Company

    @valid_attrs %{business: "some business", cik: 42, exchange: "some exchange", industry: "some industry", irs_number: 42, name: "some name", ticker: "some ticker"}
    @update_attrs %{business: "some updated business", cik: 43, exchange: "some updated exchange", industry: "some updated industry", irs_number: 43, name: "some updated name", ticker: "some updated ticker"}
    @invalid_attrs %{business: nil, cik: nil, exchange: nil, industry: nil, irs_number: nil, name: nil, ticker: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Companies.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Companies.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Companies.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Companies.create_company(@valid_attrs)
      assert company.business == "some business"
      assert company.cik == 42
      assert company.exchange == "some exchange"
      assert company.industry == "some industry"
      assert company.irs_number == 42
      assert company.name == "some name"
      assert company.ticker == "some ticker"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companies.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, %Company{} = company} = Companies.update_company(company, @update_attrs)
      assert company.business == "some updated business"
      assert company.cik == 43
      assert company.exchange == "some updated exchange"
      assert company.industry == "some updated industry"
      assert company.irs_number == 43
      assert company.name == "some updated name"
      assert company.ticker == "some updated ticker"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Companies.update_company(company, @invalid_attrs)
      assert company == Companies.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Companies.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Companies.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Companies.change_company(company)
    end
  end
end
