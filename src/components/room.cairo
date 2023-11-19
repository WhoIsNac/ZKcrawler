#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Room {
    x: u16,
    y: u16,
    ennemy: bool,
    trap: bool,
    treasure: bool
}

trait RoomTrait {
    fn is_ennemy(self: Room) -> bool;
    fn is_trap(self: Room) -> bool;
    fn is_treasure(self: Room) -> bool;
}

impl RoomImpl of RoomTrait {
    fn is_hidden(self: Room) -> bool {
        self.hidden
    }

    fn is_mine(self: Room) -> bool {
        self.mine
    }

    fn is_flagged(self: Room) -> bool {
        self.flag
    }
}
