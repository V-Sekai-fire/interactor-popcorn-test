defmodule PopcornTest.PopcornHello do
  @moduledoc """
  Popcorn-compatible hello world module for testing Elixir → WebAssembly
  Designed to work within AtomVM runtime constraints
  """

  @doc """
  Simple greeting function compatible with AtomVM
  """
  def greet(name) when is_binary(name) do
    "Hello, #{name}! Welcome to Popcorn + Phoenix 🎉"
  end

  @doc """
  Return system information (AtomVM compatible)
  """
  def system_info do
    # Use only NIFs known to work in AtomVM
    # Avoid: :logger, :timer (not fully implemented)
    timestamp = :erlang.system_time(:seconds)

    %{
      "framework" => "Popcorn + Phoenix",
      "runtime" => "AtomVM + WebAssembly",
      "timestamp" => timestamp,
      "platform" => "Browser/Iframe",
      "capabilities" => ["JSON Communication", "Basic OTP", "WebAssembly"]
    }
  end

  @doc """
  Simple calculation example (AtomVM compatible)
  """
  def calculate(a, b) when is_number(a) and is_number(b) do
    %{
      "sum" => a + b,
      "product" => a * b,
      "average" => (a + b) / 2,
      "max" => max(a, b),
      "min" => min(a, b)
    }
  end

  @doc """
  List processing example (basic Erlang functionality)
  """
  def process_list(items) when is_list(items) do
    %{
      "original_count" => length(items),
      "unique_count" => items |> Enum.uniq() |> length(),
      "sorted" => Enum.sort(items),
      "reversed" => Enum.reverse(items)
    }
  end

  @doc """
  Test complex data structures
  """
  def complex_data do
    [
      %{"id" => 1, "name" => "Planning", "active" => true},
      %{"id" => 2, "name" => "Search", "active" => false},
      %{"id" => 3, "name" => "Execution", "active" => true}
    ]
  end

  @doc """
  Custom hello world message for Supabase Edge Functions
  No authentication required
  """
  def hello_world do
    %{
      "message" => "Hello from Popcorn! Welcome to Elixir in the browser via WebAssembly and Supabase Edge Functions 🚀",
      "timestamp" => :erlang.system_time(:seconds),
      "runtime" => "AtomVM + WebAssembly",
      "platform" => "Supabase Edge Runtime"
    }
  end
end
