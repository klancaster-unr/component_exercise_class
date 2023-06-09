defmodule ComponentExerciseWeb.VendorHTML do
  use ComponentExerciseWeb, :html



  embed_templates "vendor_html/*"

  @doc """
  Renders a vendor form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def vendor_form(assigns)
end
