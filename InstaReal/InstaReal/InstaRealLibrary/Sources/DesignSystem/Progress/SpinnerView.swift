// Copyright © InstaReal. All rights reserved.

import SwiftUI

public struct SpinnerView: View {
    
    // MARK: - Constants
    
    private enum Constants {
        static let animationDuration: TimeInterval = 1.5
    }
    
    // MARK: - State
    
    @State var animate = false
    
    // MARK: - Init
    
    public init() { }
    
    // MARK: - Body
    
    public var body: some View {
        AnimatedRing()
            .rotationEffect(.degrees(animate ? 0 : -360))
            .animation(
                .linear(duration: Constants.animationDuration).repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear { animate = true }
    }
}

extension SpinnerView {
    
    struct AnimatedRing: View {
        
        // MARK: - AnimState
        
        enum AnimState {
            case animate
            case reverse
        }
        
        // MARK: - Constants
        
        private enum Constants {
            enum Animate {
                static let startTrimFrom: CGFloat = 0
                static let startTrimTo: CGFloat = 0.1
                static let animateTrimTo: CGFloat = 0.9
            }
            
            enum Reverse {
                static let animateTrimFrom: CGFloat = 0.8
            }
            
            static let strokeWidth: CGFloat = 2
            static let animationDuration: TimeInterval = 1.5
        }
        
        // MARK: - State
        
        @State var animState = AnimState.reverse
        @State var trimFrom: Double = 0
        @State var trimTo: Double = 0
        
        // MARK: - Timer
        
        let timer = Timer.publish(every: Constants.animationDuration,
                                  on: .main,
                                  in: .common).autoconnect()
        
        @State var angleDegree: Double = 0
        
        // MARK: - Body
        
        var body: some View {
            Circle()
                .trim(from: trimFrom, to: trimTo)
                .stroke(style: StrokeStyle(lineWidth: Constants.strokeWidth,
                                           lineCap: .round))
                .rotation(.degrees(angleDegree))
                .onAppear {
                    animState = .animate
                }
                .onReceive(timer) { _ in
                    switch animState {
                        case .animate:
                            animState = .reverse
                        case .reverse:
                            animState = .animate
                    }
                }
                .onChange(of: animState) { animState in
                    switch animState {
                        case .animate:
                            trimFrom = Constants.Animate.startTrimFrom
                            trimTo = Constants.Animate.startTrimTo
                            angleDegree = (angleDegree - (360 / 5)).truncatingRemainder(dividingBy: 360)
                            withAnimation(.easeInOut(duration: Constants.animationDuration)) {
                                trimTo = Constants.Animate.animateTrimTo
                            }
                        case .reverse:
                            withAnimation(.easeInOut(duration: Constants.animationDuration)) {
                                trimFrom = Constants.Reverse.animateTrimFrom
                            }
                    }
                }
        }
    }
}
