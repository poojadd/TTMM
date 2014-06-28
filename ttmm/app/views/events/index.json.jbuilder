json.array!(@events) do |event|
  json.extract! event, :id, :event_type_id, :date, :user_id, :amount, :location
  json.url event_url(event, format: :json)
end
