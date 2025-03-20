import {
  Injectable,
  UnauthorizedException,
  BadRequestException,
} from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
import { ChangePasswordDto } from './dto/change-password.dto';
import { SignUpDto } from './dto/sign-up.dto';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  // Validate credentials (used by the local strategy)
  async validateUser(email: string, pass: string): Promise<any> {
    const user = await this.usersService.findByEmail(email);
    if (!user) {
      throw new UnauthorizedException('Invalid credentials');
    }
    if (user.role === 'disabled') {
      throw new UnauthorizedException('User account is disabled');
    }
    if (await bcrypt.compare(pass, user.password)) {
      // Update last login timestamp
      await this.usersService.updateLastLogin(user.id, new Date());
      const { password, ...result } = user;
      return result;
    }
    throw new UnauthorizedException('Invalid credentials');
  }

  // Login: issue JWT
  async login(user: any) {
    const payload = { email: user.email, sub: user.id };
    return { accessToken: this.jwtService.sign(payload) };
  }

  // Change password for authenticated user
  async changePassword(authUser: any, dto: ChangePasswordDto) {
    const user = await this.usersService.findByEmail(authUser.email);
    if (!user || !(await bcrypt.compare(dto.password, user.password))) {
      throw new UnauthorizedException('Incorrect password');
    }
    const hashedPassword = await bcrypt.hash(dto.newPassword, 10);
    await this.usersService.update(user.id, { password: hashedPassword });
    return { message: 'Password changed successfully' };
  }

  // Admin sign-up: Create the first global admin (only allowed if none exists)
  async adminSignUp(dto: SignUpDto) {
    const admin = await this.usersService.getAdmin();
    if (admin) {
      throw new BadRequestException('Admin already exists');
    }
    return this.usersService.create({ ...dto, role: 'admin' });
  }

  // Logout: for JWT, typically handled client-side; here we simply respond success
  async logout(user: any) {
    return { successful: true };
  }
}
