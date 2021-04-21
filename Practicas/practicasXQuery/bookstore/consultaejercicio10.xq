(:Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.
:)
<Precios>
{
for $i in doc('bookstore.xml')/bookstore/book/price
return <price>{$i/text()}</price>
}
{
let $x := sum(doc('bookstore.xml')/bookstore/book/price)
return <total>{$x}</total>
}
{
}
</Precios>