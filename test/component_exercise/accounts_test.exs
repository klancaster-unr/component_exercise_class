defmodule ComponentExercise.AccountsTest do
  use ComponentExercise.DataCase

  alias ComponentExercise.Accounts

  describe "vendors" do
    alias ComponentExercise.Accounts.Vendor

    import ComponentExercise.AccountsFixtures

    @invalid_attrs %{category: nil, location: nil, name: nil}

    test "list_vendors/0 returns all vendors" do
      vendor = vendor_fixture()
      assert Accounts.list_vendors() == [vendor]
    end

    test "get_vendor!/1 returns the vendor with given id" do
      vendor = vendor_fixture()
      assert Accounts.get_vendor!(vendor.id) == vendor
    end

    test "create_vendor/1 with valid data creates a vendor" do
      valid_attrs = %{category: "some category", location: "some location", name: "some name"}

      assert {:ok, %Vendor{} = vendor} = Accounts.create_vendor(valid_attrs)
      assert vendor.category == "some category"
      assert vendor.location == "some location"
      assert vendor.name == "some name"
    end

    test "create_vendor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_vendor(@invalid_attrs)
    end

    test "update_vendor/2 with valid data updates the vendor" do
      vendor = vendor_fixture()
      update_attrs = %{category: "some updated category", location: "some updated location", name: "some updated name"}

      assert {:ok, %Vendor{} = vendor} = Accounts.update_vendor(vendor, update_attrs)
      assert vendor.category == "some updated category"
      assert vendor.location == "some updated location"
      assert vendor.name == "some updated name"
    end

    test "update_vendor/2 with invalid data returns error changeset" do
      vendor = vendor_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_vendor(vendor, @invalid_attrs)
      assert vendor == Accounts.get_vendor!(vendor.id)
    end

    test "delete_vendor/1 deletes the vendor" do
      vendor = vendor_fixture()
      assert {:ok, %Vendor{}} = Accounts.delete_vendor(vendor)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_vendor!(vendor.id) end
    end

    test "change_vendor/1 returns a vendor changeset" do
      vendor = vendor_fixture()
      assert %Ecto.Changeset{} = Accounts.change_vendor(vendor)
    end
  end
end
