//
//  Home.swift
//  ReelsCamera
//
//  Created by 이원형 on 3/6/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        @StateObject var cameraModel = CameraViewModel()
        
        ZStack(alignment: .bottom){
            
            // MARK: Camera View
            CameraView()
                .environmentObject(cameraModel)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .padding(.bottom,10)
                .padding(.bottom,30)
            
            // MARK: Controls
            ZStack {
                Button {
                    
                } label: {
                    Image("Here,Hear")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .padding(12)
                        .frame(width: 60, height: 60)
                        .background {
                            Circle()
                                .stroke(.black)
                        }
                        .padding(6)
                        .background {
                            Circle()
                                .fill(.white)
                        }
                }
                
                // 프리뷰 버튼
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.callout)
                    Text("Preview")
                }

                .foregroundColor(.black)
                .padding(.horizontal,20)
                .padding(.vertical,8)
                .background {
                    Capsule()
                        .fill(.white)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom,10)
            .padding(.bottom,30)
        }
        .preferredColorScheme(.dark)

    }
}

#Preview {
    Home()
}
