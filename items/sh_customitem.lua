ITEM.name = "Тикет"
ITEM.description = "Основа для тикета"
ITEM.model = Model("models/props_lab/clipboard.mdl")

function ITEM:GetName()
	return self:GetData("name", "Неизвестный предмет")
end

function ITEM:GetDescription()
	return self:GetData("description", "Предмет без имени и описания")
end