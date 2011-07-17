class PackagesController < ApplicationController

  def show
    @package = Ruboto::Api::Package.find_by_name( params[ :package ] )
  end

end
