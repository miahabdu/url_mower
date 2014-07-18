json.array!(@links) do |link|
  json.extract! link, :id, :original_url, :slug, :clicks, :screenshot, :title
  json.url link_url(link, format: :json)
end
