import Types "Types";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";

module {
    public func addTodo(todos: [Types.TodoItem], description: Text, nextId: Nat) : [Types.TodoItem] {
        let newTodo: Types.TodoItem = {
            id = nextId;
            description = description;
            completed = false;
        };
        
        let buffer = Buffer.fromArray<Types.TodoItem>(todos);
        buffer.add(newTodo);
        Buffer.toArray(buffer)
    };

    public func completeTodo(todos: [Types.TodoItem], id: Nat) : [Types.TodoItem] {
    Array.map<Types.TodoItem, Types.TodoItem>(todos, func(item) {
        if (item.id == id) {
            return {
                id = item.id;
                description = item.description;
                completed = not item.completed; // Toggle the completed status
            };
        };
        item
    })
};


    public func removeTodo(todos: [Types.TodoItem], id: Nat) : [Types.TodoItem] {
        Array.filter<Types.TodoItem>(todos, func(item) {
            item.id != id
        })
    };
}
