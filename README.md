# Тестовое задание. Программа "Семейный бюджет"
Есть семья, состоящая из неопределенного количества человек от 1 до 10000.
У каждого человека  есть ФИО, возраст, пол (план максимум аватарка). 

### Нужно сделать: 
1) Добавление человека;
2) Редактирование;
3) Удаление (при удалении нельзя, чтобы удалялись записи о его активности в бюджете). 

### Нужно также вести 3 справочника: 
1) Категории товаров; 
2) Сами товары;
3) Источники дохода.

* У категории есть только название (план максимум добавить еще и иконку).
* У товара есть название, категория (план максимум добавить еще и иконку).
* При удалении товара, записи о его предыдущих приобретениях не удаляются, тоже самое касается группы товаров. 
* Сделать одну главную форму - добавления записи о приходе или расходе. 
* При добавлении записи нужно запомнить кто заносил, когда заносил и сумму операции, а также давать возможность добавлять комментарий к записи. 
* Должна быть возможность редактирования этих записей, но их нельзя удалять. 

### Нужно сделать 2 отчета:
1) Отчет - кто, сколько потратил за определенный промежуток времени. Желательно, с расшифровкой по группам товаров и общей суммой, как по члену семьи, так и на всю семью в целом;
2) На какие товары ушло больше всего денег по категориям и по отдельным позициям. 
Отчеты формировать в формате html. Интерфейс программы должен быть сделан при помощи Qt 5. В качестве базы данных нужно использовать SQL Lite.

### Большим плюсом будет если программа будет:
* уметь создавать базу с 0;
* иметь какие-то графики;
* работать с базой в отдельном потоке;  
* Ссылка на git репозиторий с историей работы над заданием.

# Пошаговое выполнение тестового задания
### Разработка форм на основании ТЗ, оценка предстоящей работы
![Формы графического интерфейса](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/UserInterface.png)

### Разработка модели БД
![Модель БД](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/DatabaseModel_v2.png)

### Реализация программы, скриншоты с примером работы
![1](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/Example%20screenshots/1.png)
![2](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/Example%20screenshots/2.png)
![3](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/Example%20screenshots/3.png)
![4](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/Example%20screenshots/4.png)
![5](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/Example%20screenshots/5.png)
![6](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/Example%20screenshots/6.png)
![7](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/Example%20screenshots/7.png)
![8](https://github.com/Rinkachirukuki/HomeBudgetApp/blob/main/Example%20screenshots/8.png)
