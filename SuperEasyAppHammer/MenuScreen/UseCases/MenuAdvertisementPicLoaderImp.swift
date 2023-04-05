import UIKit

final class MenuAdvertisementPicLoaderImp: MenuAdvertisementPicLoader {
    let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func loadPics(completionHandler: @escaping (Result<[UIImage], Error>) -> Void) {
        //      load pics from the internet
        let pic = UIImage(systemName: "pencil")!

        completionHandler(.success([pic, pic, pic, pic]))
    }
}
