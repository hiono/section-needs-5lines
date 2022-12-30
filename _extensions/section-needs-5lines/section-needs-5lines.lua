if FORMAT:match 'latex' then
   function Meta (meta)
      meta["header-includes"] = {
         pandoc.RawInline('latex', '\\usepackage{needspace}'),
      }
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
