//: Playground - noun: a place where people can play

import UIKit




// MARK: Player Data //

let player1: [String:String] = ["Name":"Joe Smith",
                                "Height":"42",
                                "Experience":"Yes",
                                "Guardians":"Jim and Jan Smith"]

let player2: [String:String] = ["Name":"Jill Tanner",
                                "Height":"36",
                                "Experience":"Yes",
                                "Guardians":"Clara Tanner"]

let player3: [String:String] = ["Name":"Bill Bon",
                                "Height":"43",
                                "Experience":"Yes",
                                "Guardians":"Sara and Jenny Bon"]

let player4: [String:String] = ["Name":"Eva Gordon",
                                "Height":"45",
                                "Experience":"No",
                                "Guardians":"Wendy and Mike Gordon"]

let player5: [String:String] = ["Name":"Matt Gill",
                                "Height":"40",
                                "Experience":"No",
                                "Guardians":"Charles and Sylvia Gill"]

let player6: [String:String] = ["Name":"Kimmy Stein",
                                "Height":"41",
                                "Experience":"No",
                                "Guardians":"Bill and Hillary Stein"]

let player7: [String:String] = ["Name":"Sammy Adams",
                                "Height":"45",
                                "Experience":"No",
                                "Guardians":"Jeff Adams"]

let player8: [String:String] = ["Name":"Karl Saygan",
                                "Height":"42",
                                "Experience":"Yes",
                                "Guardians":"Heather Bledsoe"]

let player9: [String:String] = ["Name":"Suzane Greenberg",
                                "Height":"44",
                                "Experience":"Yes",
                                "Guardians":"Henrietta Dumas"]

let player10: [String:String] = ["Name":"Sal Dali",
                                 "Height":"41",
                                 "Experience":"No",
                                 "Guardians":"Gala Dali"]

let player11: [String:String] = ["Name":"Joe Kavalier",
                                 "Height":"39",
                                 "Experience":"No",
                                 "Guardians":"Sam and Elaine Kavalier"]

let player12: [String:String] = ["Name":"Ben Finkelstein",
                                 "Height":"44",
                                 "Experience":"No",
                                 "Guardians":"Aaron and Jill Finkelstein"]

let player13: [String:String] = ["Name":"Diego Soto",
                                 "Height":"41",
                                 "Experience":"Yes",
                                 "Guardians":"Robin and Sarika Soto"]

let player14: [String:String] = ["Name":"Chloe Alaska",
                                 "Height":"47",
                                 "Experience":"No",
                                 "Guardians":"David and Jamie Alaska"]

let player15: [String:String] = ["Name":"Arnold Willis",
                                 "Height":"43",
                                 "Experience":"No",
                                 "Guardians":"Claire Willis"]

let player16: [String:String] = ["Name":"Phillip Helm",
                                 "Height":"44",
                                 "Experience":"Yes",
                                 "Guardians":"Thomas Helm and Eva Jones"]

let player17: [String:String] = ["Name":"Les Clay",
                                 "Height":"42",
                                 "Experience":"Yes",
                                 "Guardians":"Wyonna Brown"]

let player18: [String:String] = ["Name":"Herschel Krustofski",
                                 "Height":"45",
                                 "Experience":"Yes",
                                 "Guardians":"Hyman and Rachel Krustofski"]



/**********************
  MARK: Player Arrays
 **********************/
typealias Player = [String:String]


var players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]

var experiencedPlayers: [Player] = []
var inexperiencedPlayers: [Player] = []



/**********************
   MARK: Team Arrays
 **********************/
var teamDragons: [Player] = []
var teamSharks: [Player] = []
var teamRaptors: [Player] = []

var teams = [teamDragons, teamSharks, teamRaptors]




/***************************
 MARK: Team Assignment Logic
 ***************************/
func splitPlayersBasedOnExperience() {
    for player in players {
        if player["Experience"] == "Yes" {
            experiencedPlayers.append(player)
        } else if player["Experience"] == "No"{
            inexperiencedPlayers.append(player)
        }
    }
}

func makeTeams() {
    for player in experiencedPlayers {
        if teamDragons.count < experiencedPlayers.count/teams.count {
            teamDragons.append(player)
        } else if teamSharks.count < experiencedPlayers.count/teams.count {
            teamSharks.append(player)
        } else if teamRaptors.count < experiencedPlayers.count/teams.count {
            teamRaptors.append(player)
        }
    }

    for player in inexperiencedPlayers {
        if teamDragons.count < players.count/teams.count {
            teamDragons.append(player)
        } else if teamSharks.count < players.count/teams.count {
            teamSharks.append(player)
        } else if teamRaptors.count < players.count/teams.count {
            teamRaptors.append(player)
        }
    }
}

splitPlayersBasedOnExperience()
makeTeams()




/*********************
 MARK: Letter Creation
 *********************/

func createLetters (for team: [Player], teamName: String, practiceDetails: String) -> [String] {
    var letters: [String] = []
    for player in team {
        switch teamName {
        case "Dragons": letters.append("Dear \(String(describing: player["Guardians"]!)),\n I'm happy to announce that \(String(describing: player["Name"]!)) will be playing for the Dragons! We look forward to seeing them at practice on \(practiceDetails)\n" )
        case "Sharks": letters.append("Dear \(String(describing: player["Guardians"]!)),\n I'm happy to announce that \(String(describing: player["Name"]!)) will be playing for the teamSharks! We look forward to seeing them at practice on \(practiceDetails)\n")
        case "Raptors": letters.append("Dear \(String(describing: player["Guardians"]!)),\n I'm happy to announce that \(String(describing: player["Name"]!)) will be playing for the teamRaptors! We look forward to seeing them at practice on \(practiceDetails)\n")
        default : return ["No team found"]
        }
    }
    return letters
}

var dragonLetters = createLetters(for: teamDragons, teamName: "Dragons", practiceDetails: "March 17th at 1pm")
var raptorLetters = createLetters(for: teamRaptors, teamName: "Raptors", practiceDetails: "March 18th at 1pm")
var sharkLetters = createLetters(for: teamSharks, teamName: "Sharks", practiceDetails: "March 17th at 3pm")


var letters = dragonLetters + raptorLetters + sharkLetters

func printLetters() {
    for letter in letters {
        print(letter)
    }
}

printLetters()




/*********************
 MARK: Extra Credit
 *********************/

func calcAverageHeight (for team: [Player]) -> Int{
    var totalHeight = 0
    for player in team {
        totalHeight += (Int(player["Height"]!)!)
    }
    return totalHeight/team.count
}

print ("Dragons average player height: \(calcAverageHeight(for: teamDragons)) inches")
print ("Sharks average player height: \(calcAverageHeight(for: teamSharks)) inches")
print ("Raptors average player height: \(calcAverageHeight(for: teamRaptors)) inches")



