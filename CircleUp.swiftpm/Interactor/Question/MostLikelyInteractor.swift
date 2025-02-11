//
//  MostLikelyInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


final class MostLikelyInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .mostLikely: [
                Question(title: "Who is most likely to survive a zombie apocalypse?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to forget their own birthday?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to become famous?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to spend all their money on something stupid?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to trip over their own feet?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to win an Olympic medal?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to end up in jail?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to cry during a movie?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to become a millionaire?", options: nil, type: .mostLikely),
                Question(title: "Who is most likely to forget an important event?", options: nil, type: .mostLikely)
            ]
        ])
    }
}

