//
//  NetworkServices.swift
//  VKApp_TalalayVV
//
//  Created by Vitaliy Talalay on 03.10.2021.
//

import UIKit

class NetworkService {
    
    private var urlConstructor = URLComponents()
    private let constants = NetworkConstants()
    private let configuration: URLSessionConfiguration!
    private let session: URLSession!
    
    init() {
        urlConstructor.scheme = constants.scheme
        urlConstructor.host = constants.host
        configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    static func makeAuthURLRequest() -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7965024"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,photos,wall,groups"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
    }
    
    //MARK: - User Friends
    /// Метод для получения списка друзей пользователя
    func getFriends(onComplete: @escaping ([User]) -> Void) {
        
        urlConstructor.path = "/method/friends.get"
        
        urlConstructor.queryItems = [
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_200_orig, online"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: constants.versionAPI),
        ]
        
        let task = session.dataTask(with: urlConstructor.url!) {
            (responseData, urlResponse, error) in
            if let response = urlResponse as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard
                error == nil,
                let responseData = responseData
            else { return }
            
            do {
                let friends = try JSONDecoder().decode(
                    Response<UserItems>.self,
                    from: responseData)
                DispatchQueue.main.async {
                    onComplete(friends.response.items)
                }
            } catch {
                print ("Smth wrong with decoder")
            }
        }
        task.resume()
    }
    
    //MARK: - Photo
    /// Метод для получения всех фотографий пользователя
    func getPhoto(for ownerID: Int?, onComplete: @escaping ([Photo]) -> Void) {
        urlConstructor.path = "/method/photos.getAll"

        guard let owner = ownerID else { return }

        urlConstructor.queryItems = [
            URLQueryItem(name: "owner_id", value: String(owner)),
            URLQueryItem(name: "photo_sizes", value: "1"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: constants.versionAPI),
        ]

        let task = session.dataTask(with: urlConstructor.url!) {
            (responseData, urlResponse, error) in

            if let response = urlResponse as? HTTPURLResponse {
                print(response.statusCode)
            }

            guard
                error == nil,
                let responseData = responseData
            else { return }

            guard let photos = try? JSONDecoder().decode(
                Response<PhotoItems>.self,
                from: responseData)
            else { return }

            DispatchQueue.main.async {
                onComplete(photos.response.items)
            }
        }
        task.resume()
    }
    
    func addLike(type: String, ownerId: Int, itemId: Int) {
        urlConstructor.path = "/method/likes.add"
        urlConstructor.queryItems = [
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "owner_id", value: String(ownerId)),
            URLQueryItem(name: "item_id", value: String(itemId)),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: constants.versionAPI),
        ]
        let task = session.dataTask(with: urlConstructor.url!)
        task.resume()
    }
    
    func deleteLike(type: String, ownerId: Int, itemId: Int) {
        urlConstructor.path = "/method/likes.delete"
        urlConstructor.queryItems = [
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "owner_id", value: String(ownerId)),
            URLQueryItem(name: "item_id", value: String(itemId)),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: constants.versionAPI),
        ]
        let task = session.dataTask(with: urlConstructor.url!)
        task.resume()
    }
    
    //MARK: - User Communities
    /// Метод для получения групп пользователя
    func getCommunities(onComplete: @escaping ([Community]) -> Void)  {
        urlConstructor.path = "/method/groups.get"
        
        urlConstructor.queryItems = [
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "description"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: constants.versionAPI),
        ]
        
        let task = session.dataTask(with: urlConstructor.url!) {
            (responseData, urlResponse, error) in
            
            if let response = urlResponse as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard
                error == nil,
                let responseData = responseData
            else { return }
            
            guard let communities = try? JSONDecoder().decode(
                Response<CommunityItems>.self,
                from: responseData)
            else { return }
            
            DispatchQueue.main.async {
                onComplete(communities.response.items)
            }
        }
        task.resume()
    }
    
    //MARK: - News

    func getNews(onComplete: @escaping (NewsResponse) -> Void) {

        urlConstructor.path = "/method/newsfeed.get"

        urlConstructor.queryItems = [
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: constants.versionAPI),
        ]


        let task = session.dataTask(with: urlConstructor.url!) {
            (responseData, urlResponse, error) in

            if let response = urlResponse as? HTTPURLResponse {
                print(response.statusCode)
            }

            guard
                error == nil,
                let data = responseData
            else { return }

            let dispGroup = DispatchGroup()
            var newsList = NewsItems(items: [NewsModel]())
            var newsProfile = NewsProfiles(profiles: [User]())
            var newsCommunity = NewsCommunity(groups: [Community]())
            
            DispatchQueue.global().async(group: dispGroup) {
                do {
                    newsList = try JSONDecoder()
                        .decode(Response<NewsItems>.self, from: data).response
                    
                    newsProfile = try JSONDecoder()
                        .decode(Response<NewsProfiles>.self, from: data).response
                    
                    newsCommunity = try JSONDecoder()
                        .decode(Response<NewsCommunity>.self, from: data).response
                    
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            }
            
            dispGroup.notify(queue: .main) {
                onComplete(NewsResponse(
                    items: newsList,
                    profiles: newsProfile,
                    groups: newsCommunity
                ))
            }
        }
        task.resume()
    }
}
