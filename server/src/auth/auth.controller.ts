import {
  Controller,
  Get,
  Post,
  UseGuards,
  Body,
  Request,
  Res,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { ApiTags, ApiBearerAuth, ApiBody, ApiResponse } from '@nestjs/swagger';
import { Response } from 'express';
import { AuthService } from './auth.service';
import { LocalAuthGuard } from './local-auth.guard';
import { JwtAuthGuard } from './jwt-auth.guard';
import { LoginDto } from './dto/login.dto';
import { ChangePasswordDto } from './dto/change-password.dto';
import { SignUpDto } from './dto/sign-up.dto';

@ApiTags('Authentication')
@Controller('auth')
export class AuthenticationController {
  constructor(private authService: AuthService) {}

  // POST /auth/login
  @UseGuards(LocalAuthGuard)
  @Post('login')
  @ApiBody({ type: LoginDto })
  @ApiResponse({
    status: 200,
    description: 'Login successful. Returns an access token.',
  })
  async login(@Request() req, @Res({ passthrough: true }) res: Response) {
    const response = await this.authService.login(req.user);
    return response;
  }

  // POST /auth/change-password
  @UseGuards(JwtAuthGuard)
  @Post('change-password')
  @HttpCode(HttpStatus.OK)
  @ApiBearerAuth()
  @ApiBody({ type: ChangePasswordDto })
  @ApiResponse({ status: 200, description: 'Password changed successfully.' })
  async changePassword(@Request() req, @Body() dto: ChangePasswordDto) {
    return this.authService.changePassword(req.user, dto);
  }

  // POST /auth/admin-sign-up
  @Post('admin-sign-up')
  @ApiBody({ type: SignUpDto })
  @ApiResponse({
    status: 201,
    description: 'Admin account created successfully.',
  })
  async adminSignUp(@Body() dto: SignUpDto) {
    return this.authService.adminSignUp(dto);
  }

  // GET /auth/me - return details for current user
  @UseGuards(JwtAuthGuard)
  @Get('me')
  @ApiBearerAuth()
  @ApiResponse({
    status: 200,
    description: 'Returns details of the authenticated user.',
  })
  async getCurrentUser(@Request() req) {
    return req.user;
  }

  // POST /auth/logout
  @UseGuards(JwtAuthGuard)
  @Post('logout')
  @HttpCode(HttpStatus.OK)
  @ApiBearerAuth()
  @ApiResponse({ status: 200, description: 'Logout successful.' })
  async logout(@Request() req) {
    return this.authService.logout(req.user);
  }

  // POST /auth/validateToken
  @UseGuards(JwtAuthGuard)
  @Post('validateToken')
  @HttpCode(HttpStatus.OK)
  @ApiBearerAuth()
  @ApiResponse({ status: 200, description: 'Access token is valid.' })
  async validateAccessToken(@Request() req) {
    return { authStatus: true };
  }
}
