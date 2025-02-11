//
//  CharadesInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 11/02/25.
//


final class CharadesInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .charades: [
                Question(title: "Act like a monkey eating a banana.", options: nil, type: .charades),
                Question(title: "Pretend you’re a cowboy riding a horse.", options: nil, type: .charades),
                Question(title: "Act like a robot with low battery.", options: nil, type: .charades),
                Question(title: "Pretend you’re a cat stuck in a tree.", options: nil, type: .charades),
                Question(title: "Act out brushing your teeth with an electric toothbrush.", options: nil, type: .charades),
                Question(title: "Pretend you’re a famous superhero.", options: nil, type: .charades),
                Question(title: "Mimic a person walking on hot sand.", options: nil, type: .charades),
                Question(title: "Pretend you’re a chef making a pizza.", options: nil, type: .charades),
                Question(title: "Act like a baby learning to walk.", options: nil, type: .charades),
                Question(title: "Pretend you’re a fish swimming in the ocean.", options: nil, type: .charades)
            ]
        ])
    }
}
