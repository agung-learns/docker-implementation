import { Module } from '@nestjs/common';
import { UsersModule } from './apps/users/users.module';
import { BlogModule } from './apps/blog/blog.module';

@Module({
  imports: [UsersModule, BlogModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
