//
//  ContentView.swift
//  tonefelt
//
//  Created by Dhruv Verma on 3/19/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont(name: "Avenir-Heavy", size: 36)!]
    }

    @State var selectedPage = 0
    
    @State var audioPlayer:AVAudioPlayer?
    
    @State var isPlaying : Bool = false
    
    @State var songName : String = ""
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color("Background Gray").edgesIgnoringSafeArea(.all)
                switch selectedPage {
                case 0:
                    NavigationView {
                        ZStack {
                            Color("Background Gray").edgesIgnoringSafeArea(.all)
                            VStack {
                                Text("For the hearing-impaired, vibrations are a key element in music engagement.")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .padding(.top)
                                
                                Text("With advanced haptic engines in our phones, music vibrations can be truly immersive and easily available to anyone. This app serves to demonstrate the viability of producing vibration tracks for songs.")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .padding(.top)
                                    .padding(.bottom)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Text("**How can this be progressed?**")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .padding(.top)
                                
                                Text("Music producers can produce an accessible vibration track alongside the the production of their song. Music streaming services can implement advanced algorithms to create an immersive vibration experience based on a song.")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .padding(.top)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Text("We believe in music accessibility for all. Please join us in our mission by advocating for the production of vibration music tracks.")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .padding(.top)
                                Spacer()
                            }
                            .navigationTitle("About tonefelt")
                            .font(Font.custom("Avenir-Medium", size: 18))
                        }
                    }.padding(.top, -90)
                case 1:
                    NavigationView {
                        ZStack {
                            Color("Background Gray").edgesIgnoringSafeArea(.all)
                            
                            VStack {
                                
                                Spacer()
                                
                                ZStack {
                                    Image("song_tab")
                                        .foregroundColor(Color("Pop Purple"))
                                    Image("play_button")
                                        .padding(.leading, 260)
                                        .padding(.top, 15)
                                    Image("dreamland")
                                        .resizable()
                                        .frame(width: 50.0, height: 50.0)
                                        .padding(.top, 17)
                                        .padding(.trailing, 265)
                                    Text("Heat Waves")
                                        .foregroundColor(Color.white)
                                        .bold()
                                        .padding(.bottom, 3)
                                        .padding(.trailing, 100)
                                    Text("Glass Animals")
                                        .foregroundColor(Color("Artist Name"))
                                        .padding(.top, 45)
                                        .padding(.trailing, 116)
                                        .font(Font.custom("Avenir-Heavy", size: 12))
                                    Text("Pop")
                                        .foregroundColor(Color.white)
                                        .padding(.leading, 295)
                                        .padding(.bottom, 59)
                                        .font(Font.custom("Avenir-Heavy", size: 12))
                                }
                                
                                Spacer()
                                
                                
                                ZStack {
                                    Image("song_tab")
                                        .foregroundColor(Color("Hip Hop Blue"))
                                    Button(action: {
                                        print("test2")
                                        self.selectedPage = 2
                                        
                                        if let path = Bundle.main.path(forResource: "Zeze", ofType: ".mp3") {
                                            self.audioPlayer = AVAudioPlayer()
                                            self.isPlaying.toggle()
                                            let url = URL(fileURLWithPath: path)
                                            do {
                                                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                                                self.audioPlayer?.prepareToPlay()
                                                self.audioPlayer?.play()
                                            } catch {
                                                print("Error")
                                            }
                                        } else {
                                            print("test1")
                                        }
                                        
                                        
                                    }, label: {
                                        Image("play_button")
                                            .padding(.leading, 260)
                                            .padding(.top, 15)
                                    })
                                    Image("zeze")
                                        .resizable()
                                        .frame(width: 50.0, height: 50.0)
                                        .padding(.top, 17)
                                        .padding(.trailing, 265)
                                    Text("Zeze")
                                        .foregroundColor(Color.white)
                                        .bold()
                                        .padding(.bottom, 3)
                                        .padding(.trailing, 154)
                                    Text("Kodak Black, Offset, Travis Scott")
                                        .foregroundColor(Color("Artist Name"))
                                        .padding(.top, 45)
                                        .padding(.trailing, 11)
                                        .font(Font.custom("Avenir-Heavy", size: 12))
                                    Text("Hip-Hop")
                                        .foregroundColor(Color.white)
                                        .padding(.leading, 269)
                                        .padding(.bottom, 59)
                                        .font(Font.custom("Avenir-Heavy", size: 12))
                                }
                                
                                Spacer()
                                
                                
                                ZStack {
                                    Image("song_tab")
                                        .foregroundColor(Color("Electronic Gold"))
                                    Image("play_button")
                                        .padding(.leading, 260)
                                        .padding(.top, 15)
                                    Image("ram")
                                        .resizable()
                                        .frame(width: 50.0, height: 50.0)
                                        .padding(.top, 17)
                                        .padding(.trailing, 265)
                                    Text("Give Life Back to Music")
                                        .foregroundColor(Color.white)
                                        .bold()
                                        .padding(.bottom, 3)
                                        .padding(.trailing, 9)
                                    Text("Daft Punk")
                                        .foregroundColor(Color("Artist Name"))
                                        .padding(.top, 45)
                                        .padding(.trailing, 138)
                                        .font(Font.custom("Avenir-Heavy", size: 12))
                                    Text("Electronic")
                                        .foregroundColor(Color.white)
                                        .padding(.leading, 260)
                                        .padding(.bottom, 59)
                                        .font(Font.custom("Avenir-Heavy", size: 12))
                                }
                                
                                Spacer()
                                
                                Group {
                                    ZStack {
                                        Image("song_tab")
                                            .foregroundColor(Color("Rock Brown"))
                                        Image("play_button")
                                            .padding(.leading, 260)
                                            .padding(.top, 15)
                                        Image("back in black")
                                            .resizable()
                                            .frame(width: 50.0, height: 50.0)
                                            .padding(.top, 17)
                                            .padding(.trailing, 265)
                                        Text("Back in Black")
                                            .foregroundColor(Color.white)
                                            .bold()
                                            .padding(.bottom, 3)
                                            .padding(.trailing, 91)
                                        Text("ACDC")
                                            .foregroundColor(Color("Artist Name"))
                                            .padding(.top, 45)
                                            .padding(.trailing, 158)
                                            .font(Font.custom("Avenir-Heavy", size: 12))
                                        Text("Rock")
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 288)
                                            .padding(.bottom, 59)
                                            .font(Font.custom("Avenir-Heavy", size: 12))
                                    }
                                    
                                    Spacer()
                                    
                                    ZStack {
                                        Image("song_tab")
                                            .foregroundColor(Color("R&B Maroon"))
                                        Image("play_button")
                                            .padding(.leading, 260)
                                            .padding(.top, 15)
                                        Image("beauty behind the madness")
                                            .resizable()
                                            .frame(width: 50.0, height: 50.0)
                                            .padding(.top, 17)
                                            .padding(.trailing, 265)
                                        Text("The Hills")
                                            .foregroundColor(Color.white)
                                            .bold()
                                            .padding(.bottom, 3)
                                            .padding(.trailing, 124)
                                        Text("The Weeknd")
                                            .foregroundColor(Color("Artist Name"))
                                            .padding(.top, 45)
                                            .padding(.trailing, 121)
                                            .font(Font.custom("Avenir-Heavy", size: 12))
                                        Text("R&B")
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 291)
                                            .padding(.bottom, 59)
                                            .font(Font.custom("Avenir-Heavy", size: 12))
                                    }
                                    
                                    Spacer()
                                    
                                    ZStack {
                                        Image("song_tab")
                                            .foregroundColor(Color("Jazz Orange"))
                                        Image("play_button")
                                            .padding(.leading, 260)
                                            .padding(.top, 15)
                                        Image("take five")
                                            .resizable()
                                            .frame(width: 50.0, height: 50.0)
                                            .padding(.top, 17)
                                            .padding(.trailing, 265)
                                        Text("Take Five")
                                            .foregroundColor(Color.white)
                                            .bold()
                                            .padding(.bottom, 3)
                                            .padding(.trailing, 118)
                                        Text("The Dave Brubeck Quartet")
                                            .foregroundColor(Color("Artist Name"))
                                            .padding(.top, 45)
                                            .padding(.trailing, 41)
                                            .font(Font.custom("Avenir-Heavy", size: 12))
                                        Text("Jazz")
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 292)
                                            .padding(.bottom, 59)
                                            .font(Font.custom("Avenir-Heavy", size: 12))
                                    }
                                    
                                    Spacer()
                                }
                                
                                

                            }
                        }
                        .navigationBarTitle("Demo songs")
                        .font(Font.custom("Avenir-Heavy", size: 17))
                        
                    }.padding(.top, -90)
                
                default:
                    ZStack {
                        Rectangle()
                            .fill(Color("Background Gray"))
                        
                        VStack {
                            HStack {
                                Button(action: {
                                    self.selectedPage = 1
                                }, label: {
                                    Image("exit")
                                        .padding()
                                        .padding(.leading, 10)
                                })
                                Spacer()
                            }
                            Spacer()
                        }
                        
                        Image("dreamland")
                            .resizable()
                            .frame(width: 330.0, height: 330.0)
                            .padding(.bottom, 100)
                        
                        Text("Heat Waves")
                            .font(Font.custom("Avenir-Heavy", size: 30))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 28)
                            .padding(.top, 350)
                        
                        Text("Glass Animals")
                            .font(Font.custom("Avenir-Heavy", size: 22))
                            .foregroundColor(Color("Artist Name"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 28)
                            .padding(.top, 450)
                    }
                    
                    
                
                }
            }
            
//            Divider()
            if selectedPage != 2 {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.selectedPage = 0
                    }, label: {
                        VStack {
                            Image(selectedPage == 0 ? "about-clicked" : "about")
                                .padding(.top, 15)
                                .foregroundColor(selectedPage == 0 ? .white : Color("Unselected Gray"))
                            Text("About")
                                .font(Font.custom("Avenir-Medium", size: 18))
                                .foregroundColor(selectedPage == 0 ? .white : Color("Unselected Gray"))
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        self.selectedPage = 1
                    }, label: {
                        VStack {
                            Image(selectedPage == 1 ? "music-vibrate" : "music-note-unclicked")
                                .padding(.top, 15)
                                .foregroundColor(selectedPage == 1 ? .white : Color("Unselected Gray"))
                            Text("Demos")
                                .font(Font.custom("Avenir-Medium", size: 18))
                                .foregroundColor(selectedPage == 1 ? .white : Color("Unselected Gray"))
                        }
                    })
                    
                    Spacer()
                }
                .background(Color("Navbar Gray"))
            }
                    
                        
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
