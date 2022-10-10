//
//  ApiView.swift
//  FDLS
//
//  Created by FlyFat on 2022/10/9.
//

import SwiftUI
import Alamofire

struct ApiView: View {
  
  @State private var humanList: HumanList?
  
  var body: some View {
    if humanList == nil {
      ProgressView()
        .tint(.blue)
        .scaleEffect(2)
        .onAppear(perform: fetch)
      
    } else {
      List {
        ForEach(humanList!.humans) { human in
          HStack {
            AsyncImage(url: .init(string: human.avatar)) { img in
              img.resizable().scaledToFit()
            } placeholder: {
              Color.gray.overlay {
                ProgressView()
              }
            }
            .frame(width: 80, height: 80)
            
            Spacer().frame(width: 16)
            
            VStack(alignment: .leading, spacing: 8) {
              Text("\(human.firstName) \(human.lastName)").font(.title)
              Text("\(human.email)")
            }
          }
        }
      }
      .listStyle(.plain)
      .padding(.vertical, 0.1)
    }
    
  }

  func fetch() {
    let url = "https://reqres.in/api/users?per_page=100"
    AF.request(url).responseDecodable(of: HumanList.self) { response in
      switch response.result {
      case let .success(humanList):
        self.humanList = humanList
        debugPrint(humanList)
      case let .failure(error):
        debugPrint(error)
      }
    }
  }
  
}

struct APIView_Previews: PreviewProvider {
  static var previews: some View {
    ApiView()
  }
}
