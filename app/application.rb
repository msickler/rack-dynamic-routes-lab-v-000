class Application
  attr_accessor :items

  def call(env)
    resp = Rack::Response.new
    req = Rack::Response.new(env)

    if req.path.match(/items/)
      search_items = req.path.split("/items/").last
      if item = @@items.find { |i| i.name == search_items }
        resp.write.item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

  end


  
