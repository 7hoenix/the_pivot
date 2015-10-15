class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  def full_address
    if unit
      "#{street} #{unit} #{city}, #{state} #{zip}"
    else
      "#{street} #{city}, #{state} #{zip}"
    end
  end
end
