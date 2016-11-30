class Song < ActiveRecord::Base

	require 'csv'
   

	

def self.search(search)
  where("artist ILIKE ? OR title ILIKE ? OR writer ILIKE ? OR publisher ILIKE ? OR theme ILIKE ?","%#{search}%", "%#{search}%","%#{search}%", "%#{search}%","%#{search}%").order("artist asc")

end

def self.import(file)
	CSV.foreach(file, :headers => true) do |row|
		Song.create!(row.to_hash)
	end
end


end