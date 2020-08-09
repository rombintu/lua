function encode(str, key) -- key = ключ (до 100)
    local str_reverse = str:reverse() -- переворачиваем
    local enList = {} -- таблица чтобы оперировать с каждым символом
    local enStr -- зашифрованная строка
    local enChar -- зашифрованный символ в байте
    local enChar_str -- зашифрованный символ

    for char in str_reverse:gmatch(".") do -- для каждого символа в строке
        enChar = char:byte() + key -- преобразовываем в байты и прибавляем ключ
        enChar_str = string.char(enChar)
        table.insert(enList, enChar_str) -- добавляем в таблицу
    end

    enStr = table.concat( enList, "") -- делаем из таблицы строку
    print("Зашифрованно -> "..enStr.." <- Ключ: "..key)

    return enStr -- возвращаем зашифрованное сообщение
end

function decode(str, key) -- key = ключ чтобы открыть
    local enList = {} -- массив для значений
    local enChar -- просто вспомогательная переменная
    local deChar -- расшифрованный символ в байте
    local deChar_str -- расшифрованный символ
    
    for char in str:gmatch(".") do -- для каждого символа
        enChar = string.byte(char) -- генерация в байты
        deChar = enChar - key -- применяем ключ
        deChar_str = string.char(deChar)
        table.insert(enList, deChar_str) -- делаем массив
    end

    local deStr_reverse = table.concat(enList,"") -- соединяем в строку
    local deStr = deStr_reverse:reverse() -- переворачиваем обратно
    print("Исходный текст -> "..deStr)

    return deStr -- возвращаем исходное сообщение
end
