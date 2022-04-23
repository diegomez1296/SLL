//Screen: https://drive.google.com/file/d/1aomb82dhOqwzJuGEBBrSskFzWk8mz3hr/view?usp=sharing
//World Seed: -952232237 (Earth Plane)

//General Settings
let castleSize = 8 //For relative position (Absolute size > 2castleSize x 2castleSize)
let waterLength = 5
let wallsHeight = 5

//Glass settings
let glassYPos = 2;
let glassHeight = 2;
let windowsPositions = [-3, 0, 3];

function generateCastle()
{
    generateWater();
    player.teleport(pos(0, 1, 0))
    generateCastleGround();
    generateBridge();
    generateWalls();
    generateWallsTop();
    generateGlass();
}

function generateGlass()
{
    for (let i = 0; i < windowsPositions.length; i++) {
        blocks.fill(GLASS_PANE, pos(windowsPositions[i], glassYPos, -castleSize), pos(windowsPositions[i], glassYPos+glassHeight, -castleSize))
    }
    
    for (let i = 0; i < windowsPositions.length; i++) {
        blocks.fill(GLASS_PANE, pos(castleSize, glassYPos, windowsPositions[i]), pos(castleSize, glassYPos+glassHeight, windowsPositions[i]))
    }

    for (let i = 0; i < windowsPositions.length; i++) {
        blocks.fill(GLASS_PANE, pos(-castleSize, glassYPos, windowsPositions[i]), pos(-castleSize, glassYPos+glassHeight, windowsPositions[i]))
    }
}

function generateWallsTop()
{
    blocks.fill(COBBLESTONE_WALL, pos(-castleSize, wallsHeight+1, -castleSize), pos(castleSize, wallsHeight+1, -castleSize))
    blocks.fill(COBBLESTONE_WALL, pos(-castleSize, wallsHeight+1, -castleSize), pos(-castleSize, wallsHeight+1, castleSize))
    blocks.fill(COBBLESTONE_WALL, pos(castleSize, wallsHeight+1, castleSize), pos(castleSize, wallsHeight+1, -castleSize))
    blocks.fill(COBBLESTONE_WALL, pos(castleSize, wallsHeight+1, castleSize), pos(-castleSize, wallsHeight+1, castleSize))
}

function generateWalls()
{
    blocks.fill(STONE_BRICKS, pos(-castleSize, -1, -castleSize), pos(castleSize, wallsHeight, -castleSize))
    blocks.fill(STONE_BRICKS, pos(-castleSize, -1, -castleSize), pos(-castleSize, wallsHeight, castleSize))
    blocks.fill(STONE_BRICKS, pos(castleSize, -1, castleSize), pos(castleSize, wallsHeight, -castleSize))
    //Castle Gate
    blocks.fill(STONE_BRICKS, pos(castleSize, -1, castleSize), pos(2, wallsHeight, castleSize))
    blocks.fill(STONE_BRICKS, pos(-2, -1, castleSize), pos(-castleSize, wallsHeight, castleSize))

    blocks.fill(STONE_BRICKS, pos(castleSize, wallsHeight-1, castleSize), pos(-castleSize, wallsHeight, castleSize))
}

function generateBridge()
{
    let bridgeLength = castleSize + waterLength + 1;

    for (let i = -1; i < 2; i++) {
        blocks.fill(JUNGLE_WOOD_SLAB, pos(i, -1, bridgeLength), pos(i, -1, bridgeLength - waterLength))
    }

    blocks.fill(COBBLESTONE_WALL, pos(-2, -1, bridgeLength), pos(-2, -1, bridgeLength - waterLength))
    blocks.fill(COBBLESTONE_WALL, pos(2, -1, bridgeLength), pos(2, -1, bridgeLength - waterLength))
}

function generateCastleGround()
{
    blocks.fill(STONE, pos(-castleSize, -1, -castleSize), pos(castleSize, -1, castleSize))
}

function generateWater() {
    let waterSize = castleSize + waterLength;

    for (let j = 0; j <waterLength ; j++) {
        blocks.fill(WATER, pos(-waterSize, -1, -waterSize+j), pos(waterSize, -1, -waterSize+j))
        blocks.fill(WATER, pos(-waterSize, -1, waterSize-j), pos(waterSize, -1, waterSize-j))
        blocks.fill(WATER, pos(-waterSize+j, -1, -waterSize), pos(-waterSize+j, -1, waterSize))
        blocks.fill(WATER, pos(waterSize-j, -1, -waterSize), pos(waterSize-j, -1, waterSize))
    }
}

generateCastle();
