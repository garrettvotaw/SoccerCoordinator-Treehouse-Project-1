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
var dragons: [Player] = []
var sharks: [Player] = []
var raptors: [Player] = []

var teams = [dragons, sharks, raptors]




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
        if dragons.count < experiencedPlayers.count/teams.count {
            dragons.append(player)
        } else if sharks.count < experiencedPlayers.count/teams.count {
            sharks.append(player)
        } else if raptors.count < experiencedPlayers.count/teams.count {
            raptors.append(player)
        }
    }

    for player in inexperiencedPlayers {
        if dragons.count < players.count/teams.count {
            dragons.append(player)
        } else if sharks.count < players.count/teams.count {
            sharks.append(player)
        } else if raptors.count < players.count/teams.count {
            raptors.append(player)
        }
    }
}


/*********************
 MARK: Letter Creation
 *********************/

func createLetters (for team: [Player], teamName: String, practiceDetails: String) -> [String] {
    var letters: [String] = []
    for player in team {
        switch teamName {
        case "Dragons": letters.append("Dear \(String(describing: player["Guardians"])) I'm happy to announce that \(String(describing: player["Name"])) will be playing for the Dragons! Practice starts on \(practiceDetails)")
        case "Sharks": letters.append("Dear \(String(describing: player["Guardians"])) I'm happy to announce that \(String(describing: player["Name"])) will be playing for the Sharks! Practice starts on \(practiceDetails)")
        case "Raptors": letters.append("Dear \(String(describing: player["Guardians"])) I'm happy to announce that \(String(describing: player["Name"])) will be playing for the Raptors! Practice starts on \(practiceDetails)")
        default : return ["No team found"]
        }
    }
    return letters
}

let letters = createLetters(for: dragons, teamName: "Dragons", practiceDetails: "March 7th at 1pm")













//"Dear \(String(describing: player["Guardians"])) I'm happy to announce that \(String(describing: player["Name"])) will be playing for the []! Practice starts on March 7th at 1pm"



splitPlayersBasedOnExperience()
makeTeams()

