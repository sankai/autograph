json.array!(@autographs) do |autograph|
  json.extract! autograph, :id, :name
  json.url autograph_url(autograph, format: :json)
end
