json.array!(@products) do |product|
  json.extract! product, :id, :name, :shopify_product_id, :last_chopify_sync
  json.url product_url(product, format: :json)
end
