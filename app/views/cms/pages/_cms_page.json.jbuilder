json.extract! cms_page, :id, :title, :content, :created_at, :updated_at
json.url cms_page_url(cms_page, format: :json)
