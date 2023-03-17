defmodule ComponentExerciseWeb.VendorController do
  use ComponentExerciseWeb, :controller

  alias ComponentExercise.Accounts
  alias ComponentExercise.Accounts.Vendor

  def index(conn, _params) do
    vendors = Accounts.list_vendors()
    render(conn, :index, vendors: vendors)
  end

  def new(conn, _params) do
    changeset = Accounts.change_vendor(%Vendor{})
    render(conn, :new,
      changeset: changeset)
  end

  def create(conn, %{"vendor" => vendor_params}) do
    case Accounts.create_vendor(vendor_params) do
      {:ok, vendor} ->
        conn
        |> put_flash(:info, "Vendor created successfully.")
        |> redirect(to: ~p"/vendors/#{vendor}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vendor = Accounts.get_vendor!(id)
    render(conn, :show, vendor: vendor)
  end

  def edit(conn, %{"id" => id}) do
    vendor = Accounts.get_vendor!(id)
    changeset = Accounts.change_vendor(vendor)
    render(conn, :edit, vendor: vendor,  changeset: changeset)
  end

  def update(conn, %{"id" => id, "vendor" => vendor_params}) do
    vendor = Accounts.get_vendor!(id)
    case Accounts.update_vendor(vendor, vendor_params) do
      {:ok, vendor} ->
        conn
        |> put_flash(:info, "Vendor updated successfully.")
        |> redirect(to: ~p"/vendors/#{vendor}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, vendor: vendor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vendor = Accounts.get_vendor!(id)
    {:ok, _vendor} = Accounts.delete_vendor(vendor)

    conn
    |> put_flash(:info, "Vendor deleted successfully.")
    |> redirect(to: ~p"/vendors")
  end
end
