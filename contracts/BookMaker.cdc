// BookMaker.cdc
//
// made by tfine

access(all) contract BookMaker {

    // Initialize operational variables for selection
    pub let booknum: Int
    pub let pagenum: Int

    // Name of Contract Creator
    pub let creator: String

    // List of book objects in Contract
    pub let books: [Book]

    // Struct for Page object, which includes arrays for improved text, checks for improvements and commentary, 
    // text outside of the main writing (like footnotes), and a comment section
    pub struct Page {
        pub let text: [String]
        pub let comments: [String]
        pub let improvement: [Int]
        pub let final: [Int]
        init(_text: String) {
            self.text = [_text]
            self.comments = [""]
            self.improvement = [0]
            self.final = [0]
            }

        pub fun change(edit: String){
            self.text.append(edit)
            self.improvement.append(0);
            self.final.append(0);
        }
    }

    pub struct Book {
        // standard variables for a Book struct
        pub let author: String
        pub let title: String
        pub let length: Int
        pub let manager: Address
        pub let pages: [String]
        pub let review: [Page]

        init(_author: String, _title: String, _length: Int, _pages: [String], _manager: Address) {
            self.author = _author
            self.title = _title
            self.length = _length
            self.manager = _manager
            self.pages = _pages
            self.review = []
            // initalize pages object with first item as the submitted text
            for element in _pages {
                self.review.append(Page(_text: element))
            }
        }
    }

    // public function to add a new book
    // Should it cost FLOW?
    pub fun addBook(author: String, title: String, length: Int, pages: [String], manager: Address) {
        let newBook = Book(_author: author, _title: title, _length: length, _pages: pages, _manager: manager)
        self.books.append(newBook)
    }

    // The init() function is required if the contract contains any fields.
    init() {
        // declare contract creator
        self.creator = "Todd Fine"

        // empty books
        self.books = []

        // variable used for grabbing books and pages -- does this create possibility of conflicts on VM?
        self.booknum = 0
        self.pagenum = 0
    }

    // return name or handle of contract maker
    access(all) fun creatorname(): String {
        return self.creator
    }

    // return length of books array
    access(all) fun listbooks(): Int {
        return self.books.length
    }

    // return data for array of Page Review Objects
    access(all) fun bookinfo(booknum: Int): [Page] {
        return self.books[booknum].review
    }

    // add new string a page object
    pub fun addchange(edit: String, booknum: Int, pagenum: Int) {
        self.books[booknum].review[pagenum].change(edit: edit)
    }
}
 