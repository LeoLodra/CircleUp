////
////  WouldYouRatherVoteView.swift
////  CircleUp
////
////  Created by Leonardo Marhan on 02/02/25.
////
//
//import SwiftUI
//
//struct WouldYouRatherVoteView: View {
//    let choice: String
//    @ObservedObject var presenter: GamePresenter
//    @State private var isHolding = false
//    @State private var holdProgress: CGFloat = 0.0
//    private let holdThreshold: CGFloat = 1.0  // 1 second hold
//    @State private var timer: DispatchWorkItem?  // Holds the current timer task
//
//    var body: some View {
//        VStack {
//            Text(choice)
//                .font(.title)
//                .padding()
//                .background(Color.blue.opacity(0.7))
//                .cornerRadius(12)
//                .foregroundColor(.white)
//            
//            // Progress Bar for Holding
//            ProgressView(value: holdProgress, total: holdThreshold)
//                .progressViewStyle(LinearProgressViewStyle())
//                .frame(width: 150, height: 5)
//                .padding(.top, 5)
//            
//            // Show vote count for this choice
//            Text("Votes: \(presenter.votes[choice, default: 0])")
//                .font(.headline)
//        }
//        .onLongPressGesture(minimumDuration: 0.1, pressing: { isPressing in
//            if isPressing {
//                startHolding()
//            } else {
//                stopHolding()
//            }
//        }, perform: {
//            completeVote()
//        })
//    }
//
//    private func startHolding() {
//        print("holding...")
//        isHolding = true
//        holdProgress = 0
//
//        let task = DispatchWorkItem {
//            DispatchQueue.main.async {
//                if self.isHolding {
//                    self.holdProgress += 0.1
//                    if self.holdProgress >= self.holdThreshold {
//                        self.completeVote()
//                    } else {
//                        self.startHolding() // Continue increasing progress
//                    }
//                }
//            }
//        }
//        
//        timer = task
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: task)
//    }
//
//    private func stopHolding() {
//        DispatchQueue.main.async {
//            self.isHolding = false
//            self.holdProgress = 0
//            self.timer?.cancel()  // Cancel any ongoing work
//        }
//    }
//
//    private func completeVote() {
//        DispatchQueue.main.async {
//            if self.holdProgress >= self.holdThreshold {
//                self.presenter.registerVote(for: self.choice)
//            }
//            self.stopHolding()
//        }
//    }
//}
