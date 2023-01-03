// transaction to get info about a particular book number

import BookMaker from 0x01

transaction(booknum:Int){
prepare(signer: AuthAccount) {}

execute {
    log(BookMaker.creator)
    log(BookMaker.listbooks())
    log(BookMaker.bookinfo(booknum:booknum))
    }
}
