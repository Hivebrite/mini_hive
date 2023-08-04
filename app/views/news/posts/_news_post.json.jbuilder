json.extract! news_post, :id, :subject, :content, :created_at, :updated_at
json.url news_post_url(news_post, format: :json)
