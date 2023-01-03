// transaction to get info about a particular book number

import BookMaker from "../contracts/BookMaker.cdc"

transaction(booknum:Int){
prepare(signer: AuthAccount) {

}

execute {
    log(BookMaker.bookinfo(booknum:booknum))
    }
}
 