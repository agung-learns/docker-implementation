import { Module } from '@nestjs/common';
import { PostController } from './controllers';
import { DatabaseModule } from '@app/libs';
import { Post } from './entities';

@Module({
  imports: [DatabaseModule, DatabaseModule.forFeature([Post])],
  controllers: [PostController],
})
export class BlogModule {}
