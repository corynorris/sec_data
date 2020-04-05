defmodule SecData.FinancialDataTest do
  use SecData.DataCase

  alias SecData.FinancialData

  describe "datasets" do
    alias SecData.FinancialData.Dataset

    @valid_attrs %{completed_at: ~N[2010-04-17 14:00:00], started_at: ~N[2010-04-17 14:00:00], url: "some url"}
    @update_attrs %{completed_at: ~N[2011-05-18 15:01:01], started_at: ~N[2011-05-18 15:01:01], url: "some updated url"}
    @invalid_attrs %{completed_at: nil, started_at: nil, url: nil}

    def dataset_fixture(attrs \\ %{}) do
      {:ok, dataset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> FinancialData.create_dataset()

      dataset
    end

    test "list_datasets/0 returns all datasets" do
      dataset = dataset_fixture()
      assert FinancialData.list_datasets() == [dataset]
    end

    test "get_dataset!/1 returns the dataset with given id" do
      dataset = dataset_fixture()
      assert FinancialData.get_dataset!(dataset.id) == dataset
    end

    test "create_dataset/1 with valid data creates a dataset" do
      assert {:ok, %Dataset{} = dataset} = FinancialData.create_dataset(@valid_attrs)
      assert dataset.completed_at == ~N[2010-04-17 14:00:00]
      assert dataset.started_at == ~N[2010-04-17 14:00:00]
      assert dataset.url == "some url"
    end

    test "create_dataset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FinancialData.create_dataset(@invalid_attrs)
    end

    test "update_dataset/2 with valid data updates the dataset" do
      dataset = dataset_fixture()
      assert {:ok, %Dataset{} = dataset} = FinancialData.update_dataset(dataset, @update_attrs)
      assert dataset.completed_at == ~N[2011-05-18 15:01:01]
      assert dataset.started_at == ~N[2011-05-18 15:01:01]
      assert dataset.url == "some updated url"
    end

    test "update_dataset/2 with invalid data returns error changeset" do
      dataset = dataset_fixture()
      assert {:error, %Ecto.Changeset{}} = FinancialData.update_dataset(dataset, @invalid_attrs)
      assert dataset == FinancialData.get_dataset!(dataset.id)
    end

    test "delete_dataset/1 deletes the dataset" do
      dataset = dataset_fixture()
      assert {:ok, %Dataset{}} = FinancialData.delete_dataset(dataset)
      assert_raise Ecto.NoResultsError, fn -> FinancialData.get_dataset!(dataset.id) end
    end

    test "change_dataset/1 returns a dataset changeset" do
      dataset = dataset_fixture()
      assert %Ecto.Changeset{} = FinancialData.change_dataset(dataset)
    end
  end
end
