//
//  AnimatedText.swift
//  PartyGames
//
//  Created by Jonathan T. Nielsen on 15/08/2022.
//

import SwiftUI

struct AnimatedText: View {
    @State var animate = false
    
    var start: [CGFloat] = [CGFloat.random(in: -10..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70)]
    
    var destination: [CGFloat] = [CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70),
                                 CGFloat.random(in: -30..<70)]
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                HStack{
                    Image(systemName: "suit.diamond.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 42))
                        .offset(x:animate ? proxy.size.width - destination[0] : start[0])
                        .frame(height: 30)
                        .padding(.top, getPaddingToTop(geometry: proxy))
                }
                HStack{
                    Text("💸")
                        .font(.system(size: 42))
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .offset(x:animate ? start[1] : proxy.size.width - destination[1])
                        .frame(height: 30)
                        .padding(.top, getPaddingToTop(geometry: proxy))
                }
                HStack{
                    Image(systemName: "suit.heart.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 42))
                        .offset(x:animate ? proxy.size.width - destination[2] : start[2])
                        .frame(height: 30)
                        .padding(.top, getPaddingToTop(geometry: proxy))
                }
                HStack{
                    Image(systemName: "suit.spade.fill")
                        
                        .font(.system(size: 42))
                        .offset(x:animate ? proxy.size.width - destination[3] : start[3])
                        .frame(height: 30)
                        .padding(.top, getPaddingToTop(geometry: proxy))
                }
                HStack{
                    Text("💸")
                        .font(.system(size: 42))
                        .rotationEffect(.degrees(animate ? 0 : 340))
                        .offset(x:animate ? start[4] : proxy.size.width - destination[4])
                        .frame(height: 30)
                        .padding(.top, getPaddingToTop(geometry: proxy))
                }
                HStack{
                    Text("💸")
                        .font(.system(size: 42))
                        .offset(x:animate ? start[5] : proxy.size.width - destination[5])
                        .frame(height: 30)
                        .padding(.top, getPaddingToTop(geometry: proxy))
                }
                HStack{
                    Image(systemName: "suit.club.fill")
                        .font(.system(size: 42))
                        .offset(x:animate ? proxy.size.width - destination[6] : start[0])
                        .frame(height: 30)
                        .padding(.top, getPaddingToTop(geometry: proxy))
                }
            }
            .onReceive(timer) { _ in
                withAnimation(.linear(duration: AnimationTime())) {
                    animate.toggle()
                }
            }
            .onAppear() {
                
            }
        }
    }
    
    func getPaddingToTop(geometry: GeometryProxy) -> CGFloat{
        
        let amountOfEmojis: CGFloat = 7
        let maxPadding = geometry.size.height / amountOfEmojis
        return CGFloat.random(in: 0..<maxPadding)
    }
    
    func AnimationTime() -> Double {
        return Double(Int.random(in: 3...4))
    }
}

struct AnimatedText_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedText()
    }
}


