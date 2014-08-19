class Campaign
  
  attr_reader :id, :name
  
  def initialize attributes
    @id = attributes[:id]
    @name = attributes[:name]
  end
  
  def self.all
    campaigns = []
    results = DB.exec("SELECT * FROM campaigns;")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
      }
      campaigns << Campaign.new(attributes)
    end
    campaigns
  end
  
  def save
    result = DB.exec("INSERT INTO campaigns (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end
end