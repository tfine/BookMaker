// transaction to get total number of books

import BookMaker from "../contracts/BookMaker.cdc"

pub fun main(): Int {
    // return number of books
    return BookMaker.listbooks()
}