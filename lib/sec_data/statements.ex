defmodule SecData.Statements do
  @moduledoc """
  The Statements context.
  """

  import Ecto.Query, warn: false
  alias SecData.Repo

  alias SecData.Statements.Submission

  @doc """
  Returns the list of submissions.

  ## Examples

      iex> list_submissions()
      [%Submission{}, ...]

  """
  def list_submissions do
    Repo.all(Submission)
  end

  @doc """
  Gets a single submission.

  Raises `Ecto.NoResultsError` if the Submission does not exist.

  ## Examples

      iex> get_submission!(123)
      %Submission{}

      iex> get_submission!(456)
      ** (Ecto.NoResultsError)

  """
  def get_submission!(id), do: Repo.get!(Submission, id)

  @doc """
  Creates a submission.

  ## Examples

      iex> create_submission(%{field: value})
      {:ok, %Submission{}}

      iex> create_submission(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_submission(attrs \\ %{}) do
    %Submission{}
    |> Submission.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a submission.

  ## Examples

      iex> update_submission(submission, %{field: new_value})
      {:ok, %Submission{}}

      iex> update_submission(submission, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_submission(%Submission{} = submission, attrs) do
    submission
    |> Submission.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a submission.

  ## Examples

      iex> delete_submission(submission)
      {:ok, %Submission{}}

      iex> delete_submission(submission)
      {:error, %Ecto.Changeset{}}

  """
  def delete_submission(%Submission{} = submission) do
    Repo.delete(submission)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking submission changes.

  ## Examples

      iex> change_submission(submission)
      %Ecto.Changeset{source: %Submission{}}

  """
  def change_submission(%Submission{} = submission) do
    Submission.changeset(submission, %{})
  end

  alias SecData.Statements.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{source: %Tag{}}

  """
  def change_tag(%Tag{} = tag) do
    Tag.changeset(tag, %{})
  end

  alias SecData.Statements.Numeric

  @doc """
  Returns the list of numerics.

  ## Examples

      iex> list_numerics()
      [%Numeric{}, ...]

  """
  def list_numerics do
    Repo.all(Numeric)
  end

  @doc """
  Gets a single numeric.

  Raises `Ecto.NoResultsError` if the Numeric does not exist.

  ## Examples

      iex> get_numeric!(123)
      %Numeric{}

      iex> get_numeric!(456)
      ** (Ecto.NoResultsError)

  """
  def get_numeric!(id), do: Repo.get!(Numeric, id)

  @doc """
  Creates a numeric.

  ## Examples

      iex> create_numeric(%{field: value})
      {:ok, %Numeric{}}

      iex> create_numeric(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_numeric(attrs \\ %{}) do
    %Numeric{}
    |> Numeric.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a numeric.

  ## Examples

      iex> update_numeric(numeric, %{field: new_value})
      {:ok, %Numeric{}}

      iex> update_numeric(numeric, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_numeric(%Numeric{} = numeric, attrs) do
    numeric
    |> Numeric.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a numeric.

  ## Examples

      iex> delete_numeric(numeric)
      {:ok, %Numeric{}}

      iex> delete_numeric(numeric)
      {:error, %Ecto.Changeset{}}

  """
  def delete_numeric(%Numeric{} = numeric) do
    Repo.delete(numeric)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking numeric changes.

  ## Examples

      iex> change_numeric(numeric)
      %Ecto.Changeset{source: %Numeric{}}

  """
  def change_numeric(%Numeric{} = numeric) do
    Numeric.changeset(numeric, %{})
  end

  alias SecData.Statements.Presentation

  @doc """
  Returns the list of presentations.

  ## Examples

      iex> list_presentations()
      [%Presentation{}, ...]

  """
  def list_presentations do
    Repo.all(Presentation)
  end

  @doc """
  Gets a single presentation.

  Raises `Ecto.NoResultsError` if the Presentation does not exist.

  ## Examples

      iex> get_presentation!(123)
      %Presentation{}

      iex> get_presentation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_presentation!(id), do: Repo.get!(Presentation, id)

  @doc """
  Creates a presentation.

  ## Examples

      iex> create_presentation(%{field: value})
      {:ok, %Presentation{}}

      iex> create_presentation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_presentation(attrs \\ %{}) do
    %Presentation{}
    |> Presentation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a presentation.

  ## Examples

      iex> update_presentation(presentation, %{field: new_value})
      {:ok, %Presentation{}}

      iex> update_presentation(presentation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_presentation(%Presentation{} = presentation, attrs) do
    presentation
    |> Presentation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a presentation.

  ## Examples

      iex> delete_presentation(presentation)
      {:ok, %Presentation{}}

      iex> delete_presentation(presentation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_presentation(%Presentation{} = presentation) do
    Repo.delete(presentation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking presentation changes.

  ## Examples

      iex> change_presentation(presentation)
      %Ecto.Changeset{source: %Presentation{}}

  """
  def change_presentation(%Presentation{} = presentation) do
    Presentation.changeset(presentation, %{})
  end
end
