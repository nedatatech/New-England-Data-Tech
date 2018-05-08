json.extract! service_content, :id, :service_id, :text1, :text2, :text3, :created_at, :updated_at
json.url service_content_url(service_content, format: :json)
