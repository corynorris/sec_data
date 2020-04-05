defmodule SecData.DataSetsTest do
  use SecData.DataCase

  alias SecData.DataSets

  describe "data_sets" do
    alias SecData.DataSets.DataSet

    @valid_attrs %{completed: ~N[2010-04-17 14:00:00], started: ~N[2010-04-17 14:00:00], url: "some url"}
    @update_attrs %{completed: ~N[2011-05-18 15:01:01], started: ~N[2011-05-18 15:01:01], url: "some updated url"}
    @invalid_attrs %{completed: nil, started: nil, url: nil}

    def data_set_fixture(attrs \\ %{}) do
      {:ok, data_set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DataSets.create_data_set()

      data_set
    end

    test "list_data_sets/0 returns all data_sets" do
      data_set = data_set_fixture()
      assert DataSets.list_data_sets() == [data_set]
    end

    test "get_data_set!/1 returns the data_set with given id" do
      data_set = data_set_fixture()
      assert DataSets.get_data_set!(data_set.id) == data_set
    end

    test "create_data_set/1 with valid data creates a data_set" do
      assert {:ok, %DataSet{} = data_set} = DataSets.create_data_set(@valid_attrs)
      assert data_set.completed == ~N[2010-04-17 14:00:00]
      assert data_set.started == ~N[2010-04-17 14:00:00]
      assert data_set.url == "some url"
    end

    test "create_data_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DataSets.create_data_set(@invalid_attrs)
    end

    test "update_data_set/2 with valid data updates the data_set" do
      data_set = data_set_fixture()
      assert {:ok, %DataSet{} = data_set} = DataSets.update_data_set(data_set, @update_attrs)
      assert data_set.completed == ~N[2011-05-18 15:01:01]
      assert data_set.started == ~N[2011-05-18 15:01:01]
      assert data_set.url == "some updated url"
    end

    test "update_data_set/2 with invalid data returns error changeset" do
      data_set = data_set_fixture()
      assert {:error, %Ecto.Changeset{}} = DataSets.update_data_set(data_set, @invalid_attrs)
      assert data_set == DataSets.get_data_set!(data_set.id)
    end

    test "delete_data_set/1 deletes the data_set" do
      data_set = data_set_fixture()
      assert {:ok, %DataSet{}} = DataSets.delete_data_set(data_set)
      assert_raise Ecto.NoResultsError, fn -> DataSets.get_data_set!(data_set.id) end
    end

    test "change_data_set/1 returns a data_set changeset" do
      data_set = data_set_fixture()
      assert %Ecto.Changeset{} = DataSets.change_data_set(data_set)
    end
  end
end
