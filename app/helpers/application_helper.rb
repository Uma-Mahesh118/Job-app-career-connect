module ApplicationHelper
    def gravatar_for(user, options = {size:100})
        email_adr= user.email.downcase
        hash = Digest::MD5.hexdigest(email_adr)
        size= options[:size]
        pic_url=  "https://www.gravatar.com/avatar/#{hash}/?s=#{size}"
        image_tag(pic_url, class: "rounded mx-auto d-block center")
    end
    def find_image(user, options= {size:100})
        name= user.name.downcase 
        size= options[:size]
        pic= "companies/#{name}.jpg" 
        image_tag(pic, class: "rounded mx-auto d-block center imgs ", :size => "350x250")
    end
end
