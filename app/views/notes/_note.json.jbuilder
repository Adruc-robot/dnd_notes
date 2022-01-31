json.extract! note, :id, :user_id, :campaign_id, :note_text, :created_at, :updated_at
json.url note_url(note, format: :json)
