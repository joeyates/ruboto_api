class KlassesController < ApplicationController

  def show
    @package = Ruboto::Api::Package.find_by_name( params[ :package ] )
    @klass   = @package.klasses.find_by_name( params[ :klass ] )
  end

end
