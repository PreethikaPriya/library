json.extract! book_user, :id, :book_id, :user_id, :from, :to, :status, :created_at, :updated_at
json.url book_user_url(book_user, format: :json)
