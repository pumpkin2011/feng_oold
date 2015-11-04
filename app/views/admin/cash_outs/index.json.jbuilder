json.array!(@cash_outs) do |cash_out|
  json.extract! cash_out, :id
  json.url cash_out_url(cash_out, format: :json)
end
