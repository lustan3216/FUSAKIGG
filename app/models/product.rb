class Product < ApplicationRecord
  scope :t1, -> { where( 'item_name LIKE ?','%1T%') }
  scope :fk, -> { where( 'item_name LIKE ?','%fk%') }
  scope :qt, -> { where( 'item_name LIKE ?','%QT%') }
  scope :switch, -> { where( 'name LIKE ?','%開%') }
  scope :plug, -> { where( 'name LIKE ?','%插%') }
  scope :rest, -> { where( 'name NOT LIKE ? and name NOT LIKE ?','%開%','%插%') }

  has_attached_file :asset,
                    :styles => {
                        :thumb => "100x100#",
                        :small  => "150x150>",
                        :medium => "200x200" }
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }


  def show_price
    if self.v110_price
      price = self.v110_price
    elsif self.v220_price
      price = self.v220_price
    end
    "$" + "#{price}"
  end

  def show_voltage
    if self.v110_price && self.v220_price
      "110V / 220V"
    elsif self.v110_price
      "110V"
    elsif self.v220_price
      "220V"
    end
  end

end
