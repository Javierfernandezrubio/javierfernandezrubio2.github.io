(:Mostrar los libros cuya categoría empiece por "C".
:)
<libros>
{
for $x in doc('bookstore.xml')/bookstore/book
where starts-with($x/@category,"C")
return <titulo>{$x/title/text()}</titulo>
}
</libros>