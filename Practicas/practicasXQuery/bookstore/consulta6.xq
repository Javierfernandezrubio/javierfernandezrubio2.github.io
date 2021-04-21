for $x in doc("bookstore.xml")/bookstore/book
where $x/@category="CHILDREN"
return$x/title