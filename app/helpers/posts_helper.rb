module PostsHelper
	def paginate_range(collection, count,item)
       endnumber = collection.offset + collection.per_page > count ? count : collection.offset + collection.per_page
       "#{collection.offset +1}-#{endnumber} of #{count} #{item}"  
    end
end
