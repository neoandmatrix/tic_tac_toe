-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "nickname" TEXT NOT NULL,
    "socketId" TEXT NOT NULL,
    "points" INTEGER NOT NULL DEFAULT 0,
    "playerType" TEXT NOT NULL,
    "turnActive" BOOLEAN NOT NULL DEFAULT false,
    "joinedGameId" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Game" (
    "id" SERIAL NOT NULL,
    "maxRounds" INTEGER NOT NULL DEFAULT 6,
    "joinable" BOOLEAN NOT NULL DEFAULT true,
    "occupancy" INTEGER NOT NULL DEFAULT 2,
    "currentRound" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_joinedGameId_fkey" FOREIGN KEY ("joinedGameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
