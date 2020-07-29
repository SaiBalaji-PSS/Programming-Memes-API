import Vapor

struct Welcome: Codable,Content {
    let memes: [Meme]
}


struct Meme: Codable,Content {
    let image: String
    let url: String?
}




func routes(_ app: Application) throws {
    
    var m: Welcome!
    
    var path = app.directory.publicDirectory
    path.append("memes.json")
    print(path)
    
    
    guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return }
    
    do
    {
        let memess =  try JSONDecoder().decode(Welcome.self, from: data)
        m = memess
    }
    catch{
        
        print(error.localizedDescription)
    }
    
    
    
    
    app.get { req in
     
        
        return m
    }

   
}
