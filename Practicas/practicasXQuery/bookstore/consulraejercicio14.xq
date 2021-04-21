(:Mostrar los libros escritos en años que terminen en "3":)
(:<libros>
{
for $x in doc('bookstore.xml')/bookstore/book
where ends-with($x/year,"3")
return <titulo>{$x/title/text()}</titulo>
}
</libros>:)

<libros>
{
let $x := doc('bookstore.xml')/bookstore/book[ends-with(year,'3')]
return <titulo>{$x/title/text()}</titulo>
}
</libros>