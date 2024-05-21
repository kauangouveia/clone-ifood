/*
  Warnings:

  - You are about to drop the column `categoorieId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `discount` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `deliveryTime` on the `Restaurant` table. All the data in the column will be lost.
  - Added the required column `categoryId` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `deliveryTimeMinutes` to the `Restaurant` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_categoorieId_fkey";

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "categoorieId",
DROP COLUMN "discount",
ADD COLUMN     "categoryId" TEXT NOT NULL,
ADD COLUMN     "discountPercentage" INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE "Restaurant" DROP COLUMN "deliveryTime",
ADD COLUMN     "deliveryTimeMinutes" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
