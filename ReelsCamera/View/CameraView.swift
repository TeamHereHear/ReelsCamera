//
//  CameraView.swift
//  ReelsCamera
//
//  Created by 이원형 on 3/6/24.
//

import SwiftUI
import AVFoundation

// Adding Camera And Microphone Permission

struct CameraView: View {
    //@StateObject var cameraModel = CameraViewModel()
    @EnvironmentObject var cameraModel: CameraViewModel
    var body: some View {
        
        GeometryReader{ proxy in
            let size = proxy.size
            
            CameraPreview(size: size)
                .environmentObject(cameraModel)
        }
            .onAppear(perform: cameraModel.checkPermission)
            .alert(isPresented: $cameraModel.alert) {
                Alert(title: Text("Please Enable cameraModel Access Or Microphone Acess !!!"))
            }
    }
}


// setting view for preview

struct CameraPreview: UIViewRepresentable {
    @EnvironmentObject var cameraModel: CameraViewModel
    var size: CGSize
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView()
        
        cameraModel.preview = AVCaptureVideoPreviewLayer(session: cameraModel.session)
        cameraModel.preview.frame.size = size
        
        cameraModel.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(cameraModel.preview)
        
        cameraModel.session.startRunning()
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
}
