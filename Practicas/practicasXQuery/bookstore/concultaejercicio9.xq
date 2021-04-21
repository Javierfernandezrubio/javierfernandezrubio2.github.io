(:Mostrar la suma total de los precios de los libros con la etiqueta "total".
:)
let $x := sum(doc('bookstore.xml')/bookstore/book/price)
return <libros><total>{$x}</total>
       </libros>