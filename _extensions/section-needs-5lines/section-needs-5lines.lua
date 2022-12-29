-- Reformat all heading text
-- function Header(el)
--   el.content = pandoc.Emph(el.content)
--   return el
-- end


if FORMAT:match 'latex' then
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
