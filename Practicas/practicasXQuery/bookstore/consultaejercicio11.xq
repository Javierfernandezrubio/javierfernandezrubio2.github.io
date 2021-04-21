(:Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.:)
for $x in doc('bookstore.xml')/bookstore/book
(:let $i := count(doc('bookstore.xml')/bookstore/book/author):)
return <libros>
          <title>{$x/title/text()}</title>
          <autores>{count($x/author)}</autores>
       </libros>