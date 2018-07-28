class Article < ActiveRecord::Base
  mount_uploader :picture, ArticleUploader
  belongs_to :material
  has_one :cast, through: :material

  delegate :cast_id, :to => :material, allow_nil: true

  attr_accessible :desc, :name, :cost, :picture, :picture_cache

  scope :by_cast_id, ->(value) { joins(:material).joins("INNER JOIN casts ON casts.id = materials.cast_id").where("casts.id = ?", value) }
  scope :by_material_id, ->(value) { where(material_id: value) }
  scope :by_material_name, ->(value) { joins(:material).where(materials: { name: value }) }
  scope :by_name, ->(value) { where("name like ?", value) }
end
