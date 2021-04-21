(:2.    Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath.:)
(:for $x in doc('bookstore.xml')/bookstore/book
where $x/price<=30
return $x/title:)

for $x in doc('bookstore.xml')/bookstore/book[price<=30]
return $x/title
