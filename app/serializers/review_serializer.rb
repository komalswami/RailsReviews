class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :resto_id
end
