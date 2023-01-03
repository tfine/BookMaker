// transaction to add a new book with array of all pages

import BookMaker from "../contracts/BookMaker.cdc"

transaction() 
 {
    prepare(signer: AuthAccount) {
        let manager = signer.address;
        BookMaker.addBook(author: "test", title: "test", length: 2, pages: ["a","b"], manager: manager)
    }

    execute {

        log(BookMaker.creator)
        // let length = pages.length

        log("added");
    }
}
