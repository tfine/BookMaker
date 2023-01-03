// transaction to get info about a particular book number

import BookMaker from "../contracts/BookMaker.cdc"

pub fun main(_booknum: Int): [BookMaker.Page] {
    return BookMaker.bookinfo(booknum:_booknum)
}