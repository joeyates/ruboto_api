
class Ruboto::Api::Klass < ActiveRecord::Base
  set_table_name :klasses
  has_many :methods
end

class Ruboto::Api::Method < ActiveRecord::Base
  set_table_name :methods
  belongs_to :klass
end

class Ruboto::Api::Parameter < ActiveRecord::Base
  set_table_name :parameters
  belongs_to :method
end
