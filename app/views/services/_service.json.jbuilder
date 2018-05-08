json.extract! service, :id, :name, :job_type, :base_price, :hourly_rate, :slug, :created_at, :updated_at
json.url service_url(service, format: :json)
