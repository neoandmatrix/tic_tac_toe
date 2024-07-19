-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_joinedGameId_fkey";

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_joinedGameId_fkey" FOREIGN KEY ("joinedGameId") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;
