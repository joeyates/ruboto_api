
class Ruboto::Api::Package < ActiveRecord::Base
  has_many :klasses
end

class Ruboto::Api::Klass < ActiveRecord::Base
  set_table_name :klasses
  has_many :methods
end

class Ruboto::Api::Method < ActiveRecord::Base
  belongs_to :klass
end

class Ruboto::Api::Parameter < ActiveRecord::Base
  belongs_to :method
end
