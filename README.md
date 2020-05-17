# QObjectListModel
The QObjectListModel class provides a model that supplies objects to QML views. When using
subclasses of QObjectListModelT, one can even achieve static type checking on the C++ side.

QObjectListModel provides a more powerful, but still easy to use, alternative to using
QList<QObject*> lists as models for QML views. As a QAbstractListModel, it has the ability to
automatically notify the view of specific changes to the list, such as adding or removing
items. At the same time it provides QList-like convenience functions such as append, at,
and removeAt for easily working with the model from C++. Even using iterator based operations (range
based for loop, algorithm) are fully functional.

Project start is copied from https://bitbucket.org/helmuts/qobjectlistmodel/wiki/Home

## Example C++ code

    // Example QObject derived class
    class Employee : public QObject
    {
        Q_OBJECT
        Q_PROPERTY(QString name READ name NOTIFY nameChanged)
        Q_PROPERTY(int salary READ salay NOTIFY salaryChanged)
        ...
    public:
        Employee(QObject *parent = nullptr);
        QString name() const;
        int salary() const;
        ...
    Q_SIGANLS:
        void nameChanged();
        void salaryChanged();
        ...
    private:
        QString name;
        int m_salary = 0;
        ...
    };

    // Create model class
    DECLARE_QBLIST_MODEL(EmployeeModel, Employee)

    // work on employee list
    EmployeeModel *allEmployees = EmployeeModel(this);
    mployees.append(...);
    ...
    allEmployees.remove(...);

    // Iterate over the list
    int totalSalary;
    for (Employee *employee : allEmployees) {
        totalSalary += employee->salary();
    }

    // Make it available for QML
    context->setContextProperty("employeeModel"), allEmployees);

## Example QML code

    // Listing the names with their salary
    ListView {
        model: employeeModel
        delegate: Text {
            text: object.name + ": " + object.salary
        }
    }
