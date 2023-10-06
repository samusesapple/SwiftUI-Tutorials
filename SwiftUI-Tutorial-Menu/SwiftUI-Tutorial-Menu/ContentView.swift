//
//  ContentView.swift
//  SwiftUI-Tutorial-Menu
//
//  Created by Sam Sung on 2023/10/06.
//

import SwiftUI

enum MenuTab: String {
    case pizza = "피자"
    case cat = "고양이"
    case createNewFile = "새 파일 만들기"
    case createNewFolder = "새 폴더 만들기"
    case deleteFiles = "파일 모두 삭제"
}

struct ContentView: View {
    
    @State private var shouldShowAlert: Bool = false
    @State private var selectedMenu: MenuTab = .cat
    
    private func setMenuActions(_ tappedMenu: MenuTab) {
        shouldShowAlert = true
        selectedMenu = tappedMenu
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            Text(selectedMenu.rawValue)
                .font(.title)
                .padding()
                .navigationTitle("타이틀")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            // 메뉴에 들어갈 내용 (선택 가능하도록 하고싶은 경우 button)
                            Button {
                                setMenuActions(.pizza)
                            } label: {
                                Label("피자", systemImage: "cat.fill")
                            }
                            
                            Button {
                                setMenuActions(.cat)
                            } label: {
                                Label("고얌미", systemImage: "cat.fill")
                            }
                            
                            Section {
                                Button {
                                    setMenuActions(.createNewFile)
                                } label: {
                                    Label("새 파일 만들기", systemImage: "doc")
                                }
                                Button {
                                    setMenuActions(.createNewFolder)
                                } label: {
                                    Label("새 폴더 만들기", systemImage: "folder")
                                }

                            }
                            
                            Section {
                                Button {
                                    setMenuActions(.deleteFiles)
                                } label: {
                                    Label("파일 모두 삭제", systemImage: "trash")
                                }

                            }

                        } label: {
                            Circle()
                                .foregroundColor(.yellow)
                                .frame(width: 45)
                                .overlay {
                                    Label("더보기", systemImage: "ellipsis")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }
                        }

                    }
                }
                .alert("얼럿 타이틀",
                       isPresented: $shouldShowAlert,
                       actions: {
                    // 얼럿 - 왼쪽 버튼
                    Button("확인") {
                        print("확인 버튼 눌림")
                    }
                    // 얼럿 - 오른쪽 버튼
                    Button("취소") {
                        print("취소 버튼 눌림")
                    }
                }, message: {
                    Text("\(selectedMenu.rawValue) 메뉴가 선택 되었습니다.")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
