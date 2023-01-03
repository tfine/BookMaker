// transaction to add a new book with array of all pages

import BookMaker from "../contracts/BookMaker.cdc"

transaction(author: String, title: String, pages: [String], account: Address) 
 {
    prepare(signer: AuthAccount) {
    }

    execute {
        
        log(BookMaker.creator)
        let length = pages.length

        BookMaker.addBook(author: author, title: title, length: length, pages: pages, manager: account)
        log("added");
    }
}
