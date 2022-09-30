#Tomando datos de la lista para generar nuevos datos (Procedimiento no destructivo)
  
phrase = "Don't panic!"
plist = list(phrase)
print(phrase)
print(plist)

new_phrase = ''.join(plist[1:3])
new_phrase = ' '.join([new_phrase, ''.join([plist[4], plist[7], plist[6]])])

print(plist)
print(new_phrase)
