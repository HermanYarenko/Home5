
import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: NewsList(modelData: ModelData())) {
                Text("Перейти к новостям")
            }
        }
    }
}

struct NewsList: View {
    @StateObject var modelData: ModelData
    private let networkService = NetworkService()
    
    var body: some View {
        NavigationStack {
            List(modelData.news) { pieceOfNews in
                NavigationLink {
                    //NewsDetail(news: pieceOfNews)
                } label: {
                    NewsRow(news: pieceOfNews)
                }
            }
            .listStyle(.plain)
            .refreshable { modelData.news = await networkService.getNews() }
            .onAppear {
                if modelData.news.isEmpty {
                    Task { modelData.news = await networkService.getNews() }
                }
            }
            .navigationTitle("Новости")
        }
    }
}

#Preview {
    ContentView()
}
