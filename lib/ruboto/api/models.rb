
class Ruboto::Api::Class < ActiveRecord::Base
  set_table_name :classes
  has_many :methods
end

class Ruboto::Api::Method < ActiveRecord::Base
  set_table_name :methods
  belongs_to :klass
end
