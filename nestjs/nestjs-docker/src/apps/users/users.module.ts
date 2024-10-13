import { Module } from '@nestjs/common';
import { DatabaseModule } from '@app/libs';
import { User } from './entities';
import { AuthController } from './controllers';

@Module({
  imports: [DatabaseModule, DatabaseModule.forFeature([User])],
  controllers: [AuthController],
})
export class UsersModule {}
