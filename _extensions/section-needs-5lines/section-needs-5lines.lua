if FORMAT:match 'latex' then
   function Meta (meta)
      table.insert(
        meta["header-includes"],
        pandoc.RawBlock('latex', '\\usepackage{needspace}')
      )
      -- quarto.utils.dump(meta)
      return meta
   end

   function Header(elem)
      if (elem.level == 1) then
         return {
            pandoc.RawInline('latex', '\\pagebreak'),
            elem
         }
      else
         return {
            pandoc.RawInline('latex', '\\needspace{5\\baselineskip}'),
            elem
         }
      end
   end
end
