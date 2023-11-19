#[system]
mod set_mine_manually {
    use dojo::world::Context;
    use zkcrawler::components::room::{Room, RoomTrait};
    use zkcrawler::components::grid::{Grid};
    use traits::Into;

    fn execute(ctx: Context, x: u16, y: u16) -> (u16, u16, bool) {
        let player_id = ctx.origin;
        let grid: Grid = get!(ctx.world, player_id.into(), Grid);
        assert(grid.player_id == player_id, 'Player does not own grid');

        set!(
            ctx.world,
            (grid.grid_id, x, y).into(),
            (Square { x: x, y: y, ennemy: false, trap: true, treasure: false, })
        );

        (x, y, false)
    }
}
