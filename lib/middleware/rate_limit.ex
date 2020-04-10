defmodule Middleware.RateLimit do
  @behaviour Tesla.Middleware

  @defaults [
    bucket: "tesla-rate-limit",
    scale: 3000,
    limit: 1
  ]

  @impl Tesla.Middleware
  def call(env, next, opts) do
    opts = opts || []

    context = %{
      bucket: Keyword.get(opts, :bucket, @defaults[:bucket]),
      scale: Keyword.get(opts, :scale, @defaults[:scale]),
      limit: Keyword.get(opts, :limit, @defaults[:limit])
    }

    check_rate_limit(env, next, context)
  end

  def check_rate_limit(env, next, %{bucket: bucket, scale: scale, limit: limit} = context) do
    case ExRated.check_rate(bucket, scale, limit) do
      {:ok, _count} ->
        Tesla.run(env, next)

      {:error, _limit} ->
        {_, _, ms, _, _} = ExRated.inspect_bucket(bucket, scale, limit)
        :timer.sleep(ms)
        check_rate_limit(env, next, context)
    end
  end
end
