// transaction to get info about a particular book number

import BookMaker from "../contracts/BookMaker.cdc"

pub fun main(): String {
    return BookMaker.creator
}