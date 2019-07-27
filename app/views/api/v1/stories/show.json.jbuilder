json.extract! @story, :id, :name, :text
json.date @story.created_at.strftime('%y/%m/%d')
json.comments @story.comments do |comment|
  json.extract! comment, :id, :name, :content
  json.date comment.created_at.strftime('%y/%m/%d')
end
