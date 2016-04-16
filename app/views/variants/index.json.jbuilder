json.array!(@variants) do |variant|
  json.extract! variant, :id, :product_id, :shopify_variant_id, :option1, :option2, :option3, :sku, :barcode, :price, :last_chopify_sync
  json.url variant_url(variant, format: :json)
end
