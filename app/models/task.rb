class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :taskDetail, type: String
  field :done, type: Boolean

end
