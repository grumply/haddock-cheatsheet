cheatsheet do
  title 'Haddock Markup Cheatsheet'
  docset_file_name 'Haddock'
  keyword 'haddock'

  introduction 'Haddock Markup Quick Reference'

  category do
    id 'Top-Level Documentation'
    entry do
      name 'Documenting Functions'
      notes <<-'END'
        Function documentation is supported in single- and multi-line formats by starting a comment with `|`.

        Single-line:

        ```haskell
        -- |The 'square' function squares an integer.
        square :: Integer -> Integer
        square x = x * x
        ```

        Multi-line:

        ```haskell
        {-|

          The 'square' function squares an integer.
          
          >>> square 3
          9

        -}
        ```

        Documentation after type signature:

        ```haskell
        square :: Integer -> Integer
        -- ^The `square` function squares an integer.
        square x = x * x
        ```

      END
    end
    entry do
      name 'Documenting Function Arguments'
      notes <<-'END'
        Individual function arguments may be documented.

        ```haskell
        f  :: Int      -- ^ The 'Int' argument
           -> Float    -- ^ The 'Float' argument
           -> IO ()    -- ^ The return value
        ```
      END
    end
    entry do
      name 'Documenting Classes'
      notes <<-'END'
        Class documentation, same syntax as function documentation.

        ```haskell
        -- |'C' class documentation....
        class C a where
          f :: a -> Int
          g :: Int -> a
        ```
      END
    end
    entry do
      name 'Documenting Class Functions'
      notes <<-'END'
        Class functions can be documented.

        ```haskell
        class C a where
          -- | This is the documentation for the 'f' method
          f :: a -> Int
          -- | This is the documentation for the 'g' method
          g :: Int -> a
        ```
      END
    end
    entry do
      name 'Documenting Types'
      notes <<-'END'
        Document individual types, same syntax as function documentation.

        ```haskell
        -- |'MyList' type documentation....
        data MyList a = Nil | Cons a MyList
        ```
      END
    end
    entry do
      name 'Documenting Data Constructors'
      notes <<-'END'
        Individual constructors can be documented.

        Prefix-style:

        ```haskell
        data T a b
          -- | This is the documentation for the 'C1' constructor
          = C1 a b
          -- | This is the documentation for the 'C2' constructor
          | C2 a b
        ```

        Inline-style:

        ```haskell
        data T a b
          = C1 a b  -- ^ This is the documentation for the 'C1' constructor
          | C2 a b  -- ^ This is the documentation for the 'C2' constructor
        ```
      END
    end
    entry do
      name 'Documenting Record Fields'
      notes <<-'END'
        Each record field can be documented. 

        Prefix-style:
        
        ```haskell
        data R a b =
          R { -- | This is the documentation for the 'a' field
              a :: a,
              -- | This is the documentation for the 'b' field
              b :: b
            }
        ```

        Inline-style:

        ```haskell
        data R a b =
          R { a :: a  -- ^ This is the documentation for the 'a' field
            , b :: b  -- ^ This is the documentation for the 'b' field
            }
        ```

        Note that documentation for the first occurence of a field is used for all other occurences of the field.
      END
    end
  end

  category do
    id 'Export Markup'
    entry do
      name 'Code Sections and Sub-sections'
      notes <<-'END'
        Control rendered layout by marking sections in the export list.

        Create nestable sections with:
          
        ```haskell
        -- *
        -- **
        -- ***
        -- etc...
        ```

        ```haskell
        module M 
          ( -- * Types
            MyType()
          , MyOtherType(..)
            -- ** Smart Constructors
          , mkMyType
            -- ** Validators
          , validateMyOtherType
            -- * Re-Exports
          , module Control.Applicative
            -- | Some documentation not attached to a particular Haskell entity
          ) where
        ```
      END
    end
  end

  category do
    id 'Headings'
    entry do
      name 'Headings and Sub-headings in Documentation'
      notes <<-'END'
        Add headings within documentation blocks.

        Heading-level control with:

        ```haskell
        -- =
        -- ==
        -- ===
        -- etc...
        ```

        ```haskell
        -- | 'MyType' represents ....
        -- 
        -- = Heading Section
        -- ...
        -- 
        -- == Subheading Section
        --
        ```
      END
    end
    entry do
      name 'Callapsible Header Sections'
      notes <<-'END'
        Since 2.15.1, haddock has experimental support for collapsible headers.

        Wrap your header in underscores to make it collapsible:

        ```haskell
        -- === __Examples__
        -- Text that can be hidden.
        --
        -- ==== Hidden Examples Subheader
        -- This content will also be hidden when `Examples` is collapsed.
        ```
      END
    end
  end

  category do
    id 'References'
    entry do
      name 'Named Documentation Chunks'
      notes <<-'END'
        Relocate a markup chunk by name.

        Create a named chunk:

        ```haskell
        -- $myNamedHaddockChunk
        -- This named chunk can include haddock markup like: `Control.Monad.State`
        ```

        And include elsewhere by name:

        ```haskell
        -- $myNamedHaddockChunk
        ```
      END
    end
    entry do
      name 'Anchors'
      notes <<-'END'
        Link to a named anchors across modules.

        Create a label in module A:

        ```haskell
        -- #myLabel#
        ```

        And link to it in module B:

        ```haskell
        -- A link to A#myLabel
        ```
      END
    end
  end

  category do
    id 'Code Blocks'
    entry do
      name 'Syntax Highlighted Code Blocks'
      notes <<-'END'
        Code lines and blocks are supported.

        Create a code block:
        
        ```haskell
        -- @
        --   fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
        -- @
        ```

        Create a code line:

        ```haskell
        -- > fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
        ```
      END
    end
  end

  category do
    id 'REPL Examples'
    entry do
      name 'Evaluated Output Examples'
      notes <<-'END'
        An input line of code followed by it's evaluated output.

        These examples can be verified with doctest.
        
        ```haskell
        -- >>> fibs !! 3
        -- 2
        ```
      END
    end
  end

  category do
    id 'Properties'
    entry do
      name 'Testable Properties'
      notes <<-'END'
        A property contains a quickcheck-testable declaration.

        These properties can be tested with doctest.

        ```haskell
        -- Idempotence:
        --
        -- prop> sort xs == ( sort . sort ) (xs :: [Int])
        ```
      END
    end
  end

  category do
    id 'Hyperlinking'
    entry do
      name 'Module, Function, and Type Hyperlinks'
      notes <<-'END'
        Locatable modules, types and functions can be hyperlinked.

        ```haskell
        -- Local hyperlinks: "My.Module", 'MyType', 'mkMyType'
        -- Unqualified hyperlinks: "Prelude", 'Int', 'sort'
        -- Fully-qualified hyperlinks: "Data.Tree", 'Data.Tree.Tree', 'Data.Containers.ListUtils.nubOrd'
        ```
      END
    end
  end

  category do
    id 'Text Markup'
    entry do
      name 'Emphasis'
      notes <<-'END'
        Add emphasis to text:

        ```haskell
        -- Some /emphasized text/
        ```
      END
    end
    entry do
      name 'Bolding'
      notes <<-'END'
        Make text bold:

        ```haskell
        -- Some __bolded text__
        ```
      END
    end
    entry do
      name 'Monospacing'
      notes <<-'END'
        Make text monospaced:

        ```haskell
        -- Some @monospace text@
        ```
      END
    end
  end

  category do
    id 'External References'
    entry do
      name 'Links'
      notes <<-'END'
        Create hyperlink anchors to external resources:

        ```haskell
        -- A raw url <http://example.com>
        -- A local file url <file:///Users/myname/.ghci>
        ```

        Hyperlinks with alternative link text:

        ```haskell
        -- A [renamed link](http://example.com)
        ```
      END
    end
    entry do
      name 'Images'
      notes <<-'END'
        Embed external images:

        ```haskell
        -- ![some description text](imagepath.png)
        ```
      END
    end
  end

  category do
    id 'Lists'
    entry do
      name 'Unordered Lists'
      notes <<-'END'
        Create unordered lists with `*` and `-`:

        ```haskell
        -- * first list item
        -- * second list item
        ```

        ```haskell
        -- - first list item
        -- - second list item
        ```
      END
    end
    entry do
      name 'Ordered Lists'
      notes <<-'END'
        Order lists with `(n)` or `n.`:

        ```haskell
        -- (1) first numbered list item
        -- (2) second numbered list item
        ```

        ```haskell
        -- 1. first numbered list item
        -- 2. second numbered list item
        ```
      END
    end
    entry do
      name 'Definition Lists'
      notes <<-'END'
        Create definition lists with `[]` syntax:

        ```haskell
        -- [thingone] thingone value
        -- [@thingtwo@] thingtwo value
        ```
      END
    end
    entry do
      name 'Advanced Nesting of Lists'
      notes <<-'END'
        Haddock supports advanced nesting of lists:

        ```haskell
        {-|
        * Beginning of list
        This belongs to the list above!

            > nested
            > bird
            > tracks

            * Next list
            More of the indented list.

                * Deeper

                    @
                    even code blocks work
                    @

                    * Deeper

                            1. Even deeper!
                            2. No newline separation even in indented lists.
        -}
        ```
      END
    end
  end

  category do
    id 'Custom Math and LaTeX'
    entry do
      name 'LaTeX with MathJax'
      notes <<-'END'
        Multi-line LaTeX markup via `\[...\]`:

        ```haskell
        -- \[
        --    f(a) = \frac{1}{2\pi i}\oint_\gamma \frac{f(z)}{z-a}\,\mathrm{d}z
        -- \]
        ```

        Inline LaTeX markup via `\(...\)`:

        ```haskell
        -- A simple inline example: \(sum_{n=1}^{\infty} 2^{-n} = 1\)
        ```

        If the output format supports it, mathematics notation will be rendered within the document, e.g. via MathJax within HTML.
      END
    end
  end

  category do
    id 'Metadata'
    entry do
      name 'Since'
      notes <<-'END'
        Recent haddock version support the `since` metadata tag for documenting the version in which a documentable entity was introduced.

        ```haskell
        -- @since 3.14.42
        ```
      END
    end
  end

  category do
    id 'Grids and Tables'
    entry do
      name 'Layout'
      notes <<-'END'
        Tables supporting internal markup rendering:

        ```haskell
        {- 

        +------------------------+------------+----------+----------+
        | Header row, column 1   | Header 2   | Header 3 | Header 4 |
        | (header rows optional) |            |          |          |
        +========================+============+==========+==========+
        | body row 1, column 1   | column 2   | column 3 | column 4 |
        +------------------------+------------+----------+----------+
        | body row 2             | Cells may span columns.          |
        +------------------------+------------+---------------------+
        | body row 3             | Cells may  | \[                  |
        +------------------------+ span rows. | f(n) = \sum_{i=1}   |
        | body row 4             |            | \]                  |
        +------------------------+------------+---------------------+

        -}
        ```
      END
    end
  end

  category do
    id 'Configuration'
    entry do
      name 'Local Haddock Options'
      notes <<-'END'
        Module-wide attributes can control haddocks layout and mangling.

        Hide a module from haddock:

        ```haskell
        {-# OPTIONS_HADDOCK hide #-}
        ```

        Omit undocumented definitions:

        ```haskell
        {-# OPTIONS_HADDOCK prune #-}
        ```

        Ignore the explicit export list and document all top-level entities:

        ```haskell
        {-# OPTIONS_HADDOCK ignore-exports #-}
        ```

        Do not treat the module as the "home" of the entities it exports:

        ```haskell
        {-# OPTIONS_HADDOCK not-home #-}
        ```

        Show all language extensions:

        ```haskell
        {-# OPTIONS_HADDOCK show-extensions #-}
        ```
      END
    end
  end

  notes 'Much of this content is ported from the official [haddock](https://github.com/haskell/haddock) [cheatsheet](https://github.com/haskell/haddock/blob/ghc-8.6/doc/cheatsheet/haddocks.md)'
end
