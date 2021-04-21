(:Mostrar en la misma etiqueta el título y el número de autores que tiene ese título sea un atributo
:)
<libros>
{
for $x in doc('bookstore.xml')/bookstore/book
(:let $i := count(doc('bookstore.xml')/bookstore/book/author):)
return <title autores="{count($x/author)}">{$x/title/text()}</title>
}
</libros>