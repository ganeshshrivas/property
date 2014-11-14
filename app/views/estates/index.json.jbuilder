json.array!(@estates) do |estate|
  json.extract! estate, :id, :ptype, :stype, :levels, :area, :bedroom, :hall, :bathroom, :built, :feature, :price, :user_id
  json.url estate_url(estate, format: :json)
end
