-- add_image_prefix.lua
function Image(img)
  -- 给 src 前加上 ../
  img.src = "../" .. img.src
  return img
end