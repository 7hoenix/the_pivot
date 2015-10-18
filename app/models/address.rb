class Address < ActiveRecord::Base
  validates :street, :city, :state, :zip, presence: true
  belongs_to :addressable, polymorphic: true

  def full_address
    if unit.empty?
      "#{street} #{city}, #{state} #{zip}"
    else
      "#{street} #{unit} #{city}, #{state} #{zip}"
    end
  end
end
