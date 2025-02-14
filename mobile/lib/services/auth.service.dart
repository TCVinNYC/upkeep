// lib/src/services/auth_service.dart

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import '../models/user_profile.dart'; // Define this model as per your requirements
import '../utils/store.dart'; // Update this to handle local storage

final authServiceProvider = Provider<AuthService>((ref) => AuthService(ref));

class AuthService {
  final ProviderRef ref;
  final fb_auth.FirebaseAuth _firebaseAuth = fb_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Logger _log = Logger();

  AuthService(this.ref);

  /// Registers a new user with email and password
  Future<fb_auth.User?> registerWithEmail({
    required String email,
    required String password,
    required String name,
    required int age,
    required String phoneNumber,
    required String emergencyContact,
    required String address,
  }) async {
    try {
      fb_auth.UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      fb_auth.User? user = userCredential.user;

      if (user != null) {
        // Create a user profile in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'age': age,
          'phoneNumber': phoneNumber,
          'emergencyContact': emergencyContact,
          'address': address,
          'isAdmin': false, // Default role
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Optionally, send email verification
        await user.sendEmailVerification();
      }

      return user;
    } catch (e, stackTrace) {
      _log.e("Error during email registration", e, stackTrace);
      rethrow;
    }
  }

  /// Signs in a user with email and password
  Future<fb_auth.User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      fb_auth.UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      fb_auth.User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        // Optionally, prompt user to verify email
        await user.sendEmailVerification();
        throw Exception('Email not verified. Verification email sent.');
      }

      return user;
    } catch (e, stackTrace) {
      _log.e("Error during email login", e, stackTrace);
      rethrow;
    }
  }

  /// Initiates phone number authentication by sending an SMS code
  Future<void> loginWithPhone({
    required String phoneNumber,
    required Function(fb_auth.PhoneAuthCredential) onVerificationCompleted,
    required Function(fb_auth.PhoneAuthCredential) onVerificationFailed,
    required Function(String, int?) onCodeSent,
    required Function(String) onCodeAutoRetrievalTimeout,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: onVerificationCompleted,
        verificationFailed: (fb_auth.FirebaseAuthException e) {
          _log.e("Phone verification failed", e);
          onVerificationFailed(fb_auth.PhoneAuthProvider.credential(
              verificationId: '', smsCode: '')); // Handle appropriately
        },
        codeSent: onCodeSent,
        codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
      );
    } catch (e, stackTrace) {
      _log.e("Error during phone login", e, stackTrace);
      rethrow;
    }
  }

  /// Completes phone number authentication with SMS code
  Future<fb_auth.User?> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      fb_auth.PhoneAuthCredential credential =
          fb_auth.PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      fb_auth.UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e, stackTrace) {
      _log.e("Error verifying phone code", e, stackTrace);
      rethrow;
    }
  }

  /// Logs out the current user
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      await _clearLocalData();
    } catch (e, stackTrace) {
      _log.e("Error during logout", e, stackTrace);
      rethrow;
    }
  }

  /// Clears local authentication-related data
  Future<void> _clearLocalData() async {
    try {
      await Store.delete(StoreKey.currentUser);
      await Store.delete(StoreKey.accessToken);
      // Add other local data deletions as needed
    } catch (e, stackTrace) {
      _log.e("Error clearing local data", e, stackTrace);
      rethrow;
    }
  }

  /// Changes the user's password
  Future<void> changePassword(String newPassword) async {
    try {
      fb_auth.User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      } else {
        throw Exception("No user is currently signed in.");
      }
    } catch (e, stackTrace) {
      _log.e("Error changing password", e, stackTrace);
      rethrow;
    }
  }

  /// Retrieves the current user
  fb_auth.User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  /// Stream to listen to authentication state changes
  Stream<fb_auth.User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  /// Retrieves the user's profile from Firestore
  Future<UserProfile?> getUserProfile(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserProfile.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    } catch (e, stackTrace) {
      _log.e("Error fetching user profile", e, stackTrace);
      return null;
    }
  }

  /// Updates the user's profile in Firestore
  Future<void> updateUserProfile(String uid, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(uid).update(data);
    } catch (e, stackTrace) {
      _log.e("Error updating user profile", e, stackTrace);
      rethrow;
    }
  }
}
