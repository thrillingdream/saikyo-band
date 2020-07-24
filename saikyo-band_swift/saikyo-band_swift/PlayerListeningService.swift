import Foundation

var name: String?
var artist: String?
var album: String?
var url: String?

class PlayerListeningService: NSObject {
    
    var listeningNotificationName = "com.apple.iTunes.playerInfo"
    //var notificationName = Notification.Name("com.apple.Music.playerInfo")
    var notificationName = Notification.Name("com.apple.Music.playerInfo")

    
    static let instance = PlayerListeningService()
    class func sharedService() -> PlayerListeningService {
        return instance
    }

    private override init() {
    }

    public func start() {
           NotificationCenter.default.addObserver(self,
                                                  selector: #selector(getMusicInfo(notification:)),
                                                  name: notificationName,
                                                  object: nil)
        print("start function")
        name = "_crash"
    }
    public func getNameInfo() -> (String){
            return (String(name ?? "まだないお(´・ω・｀)"))
    }
    
    public func getArtistInfo() -> (String){
            return (String(artist ?? "まだないお(´・ω・｀)"))
    }
    
    public func getUrlInfo() -> (String){
            return (String(url ?? "まだないお(´・ω・｀)"))
    }

    public func getAlbumInfo() -> (String){
            return (String(album ?? "まだないお(´・ω・｀)"))
    }
    

    @objc func getMusicInfo(notification: Notification?) {
        
        name   = notification?.userInfo!["Name"] as? String
        artist = notification?.userInfo!["Artist"] as? String
        url    = notification?.userInfo!["Store URL"] as? String
        album  = notification?.userInfo!["Album"] as? String
        
               print("Notice center")
    }
    
}
