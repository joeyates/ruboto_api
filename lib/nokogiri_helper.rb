module NokiogiriHelper

  def attributes_to_hash( attributes )
    attributes.reduce( {} ) do | memo, attribute |
      memo[ attribute[ 0 ] ] = attribute[ 1 ].value
      memo
    end
  end

end
