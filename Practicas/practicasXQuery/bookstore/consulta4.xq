for $x at $i in doc("bookstore.xml")/bookstore/book/title
return <book>{$i}. {data($x)}</book>