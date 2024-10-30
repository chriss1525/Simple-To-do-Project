import Types "Types";
import Utils "Utils";
import Array "mo:base/Array";

actor {
    private stable var todos: [Types.TodoItem] = [];
    private stable var nextId: Nat = 0;

    public query func getTodos() : async [Types.TodoItem] {
        todos
    };

    public func addTodo(description: Text) : async [Types.TodoItem] {
        todos := Utils.addTodo(todos, description, nextId);
        nextId += 1;
        todos
    };

    public func completeTodo(id: Nat) : async [Types.TodoItem] {
        todos := Utils.completeTodo(todos, id);
        todos
    };

    public func removeTodo(id: Nat) : async [Types.TodoItem] {
        todos := Utils.removeTodo(todos, id);
        todos
    };
}
