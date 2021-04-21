(:Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.
:)
for $x in doc('bookstore.xml')/bookstore/book
(:let $i := count(doc('bookstore.xml')/bookstore/book/author):)
return <libros>
          <title>{$x/title/text()}({count($x/author)})</title>
       </libros>