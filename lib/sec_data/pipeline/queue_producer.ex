defmodule SecData.Pipeline.QueueProducer do
  @moduledoc """
  A GenStage producer that feeds items in a buffered queue to the consumers.
  """

  use GenStage

  def start_link(_args) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_args) do
    {:producer, {:queue.new(), 0}}
  end

  def enqueue(event) do
    GenStage.cast(__MODULE__, {:enqueue, event})
  end

  def handle_cast({:enqueue, event}, {queue, pending_demand}) do
    queue = :queue.in(event, queue)
    dispatch(queue, pending_demand)
  end

  defp dispatch(queue, demand) do
    dispatch_events(queue, demand, [])
  end

  def handle_demand(demand, counter) when demand > 0 do
    events = Enum.to_list(counter..(counter + demand - 1))
    {:noreply, events, counter + demand}
  end

  def handle_demand(demand, {queue, pending_demand}) do
    dispatch_events(queue, demand + pending_demand, [])
  end

  defp dispatch_events(queue, 0, events) do
    {:noreply, Enum.reverse(events), {queue, 0}}
  end

  defp dispatch_events(queue, demand, events) do
    case :queue.out(queue) do
      {{:value, event}, queue} ->
        dispatch_events(queue, demand - 1, [event | events])

      {:empty, queue} ->
        IO.puts("replying with #{events}")
        {:noreply, Enum.reverse(events), {queue, demand}}
    end
  end
end
