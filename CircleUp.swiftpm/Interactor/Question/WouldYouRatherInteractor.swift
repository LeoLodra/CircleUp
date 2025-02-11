//
//  WouldYouRatherInteractor.swift
//  CircleUp
//
//  Created by Leonardo Marhan on 27/01/25.
//


final class WouldYouRatherInteractor: BaseQuestionInteractor {
    init() {
        super.init(questions: [
            .wouldYouRather: [
                Question(title: "Would you rather always be 10 minutes late or 20 minutes early?", options: ["10 minutes late", "20 minutes early"], type: .wouldYouRather),
                Question(title: "Would you rather have unlimited money or unlimited time?", options: ["Unlimited Money", "Unlimited Time"], type: .wouldYouRather),
                Question(title: "Would you rather be able to fly or be invisible?", options: ["Fly", "Invisible"], type: .wouldYouRather),
                Question(title: "Would you rather never have to sleep or never have to eat?", options: ["Never Sleep", "Never Eat"], type: .wouldYouRather),
                Question(title: "Would you rather be rich and unknown or famous but poor?", options: ["Rich & Unknown", "Famous & Poor"], type: .wouldYouRather),
                Question(title: "Would you rather have super strength or super speed?", options: ["Super Strength", "Super Speed"], type: .wouldYouRather),
                Question(title: "Would you rather always have to sing everything or dance everywhere you go?", options: ["Sing Everything", "Dance Everywhere"], type: .wouldYouRather),
                Question(title: "Would you rather live 100 years in the future or 100 years in the past?", options: ["Future", "Past"], type: .wouldYouRather),
                Question(title: "Would you rather only be able to whisper or only be able to shout?", options: ["Whisper", "Shout"], type: .wouldYouRather),
                Question(title: "Would you rather explore space or the deep ocean?", options: ["Space", "Deep Ocean"], type: .wouldYouRather)
            ]
        ])
    }
}

