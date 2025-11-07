# Supabase Integration Setup Guide

## 🎯 Overview
This guide will help you set up the Supabase database for Outfit Hub app.

## 📋 Prerequisites
- Supabase account created
- Project URL: `https://bnhhpcdzylazzjvhdogi.supabase.co`
- Anon Key configured in the app

## 🗄️ Database Setup

### Step 1: Run SQL Schema
1. Go to your Supabase Dashboard
2. Navigate to **SQL Editor** (left sidebar)
3. Click **"New Query"**
4. Copy the entire content from `supabase_schema.sql` file
5. Paste it into the SQL editor
6. Click **"Run"** button
7. Wait for all tables, policies, and functions to be created

### Step 2: Create Storage Buckets

#### Create Product Images Bucket:
1. Go to **Storage** in Supabase Dashboard
2. Click **"New Bucket"**
3. Bucket name: `product-images`
4. Make it **Public**
5. Click **"Create bucket"**

#### Create Profile Images Bucket:
1. Click **"New Bucket"** again
2. Bucket name: `profile-images`
3. Make it **Public**
4. Click **"Create bucket"**

### Step 3: Set Storage Policies

#### For product-images bucket:
1. Click on `product-images` bucket
2. Go to **Policies** tab
3. Click **"New Policy"**
4. **Policy 1 - Upload**: 
   - Name: "Authenticated users can upload"
   - Target roles: `authenticated`
   - Policy definition:
     ```sql
     (bucket_id = 'product-images'::text)
     ```
   - Allowed operation: `INSERT`

5. **Policy 2 - View**:
   - Name: "Anyone can view"
   - Target roles: `public`, `anon`, `authenticated`
   - Policy definition:
     ```sql
     (bucket_id = 'product-images'::text)
     ```
   - Allowed operation: `SELECT`

#### For profile-images bucket:
1. Click on `profile-images` bucket
2. Repeat the same policies as above

## ✅ Verification

### Test Database Setup:
Run this query in SQL Editor to verify tables:
```sql
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';
```

You should see:
- users
- products
- categories
- favorites
- orders
- reviews

### Test Storage:
1. Go to Storage
2. You should see 2 buckets:
   - product-images
   - profile-images

## 🔐 Authentication Flow

### Sign Up Process:
1. User signs up with email/password
2. Supabase Auth creates user in `auth.users`
3. Trigger automatically creates profile in `public.users`
4. User can now login

### Login Process:
1. User logs in with email/password
2. Supabase Auth validates credentials
3. App fetches user profile from `public.users`
4. User session maintained

## 📊 Database Schema Overview

### Tables:
1. **users** - User profiles (extends auth.users)
2. **products** - Product listings
3. **categories** - Product categories (pre-populated)
4. **favorites** - User's favorite products
5. **orders** - Purchase orders
6. **reviews** - Product/seller reviews

### Default Data:
Categories are auto-populated:
- Women
- Men  
- Kids
- Accessories

## 🧪 Testing the Integration

### Test User Creation:
1. Run the app
2. Go to Signup screen
3. Create a new account
4. Check Supabase Dashboard → Authentication → Users
5. Check Supabase Dashboard → Table Editor → users

### Test Product Creation:
1. Login as seller
2. Go to "Add Product"
3. Fill in details
4. Save product
5. Check Supabase Dashboard → Table Editor → products

## 🔍 Monitoring

### View Real-time Data:
1. Go to **Table Editor** in Supabase
2. Select any table to view data
3. Data updates in real-time

### View Auth Users:
1. Go to **Authentication** → **Users**
2. See all registered users
3. Manually verify/modify users if needed

## 🚨 Troubleshooting

### Issue: "Auth session missing" error
**Solution**: User needs to login again. Session expired.

### Issue: "Row Level Security policy violation"
**Solution**: Check RLS policies are properly set. Run schema again.

### Issue: Can't upload images
**Solution**: 
1. Check storage buckets are created
2. Verify buckets are set to public
3. Check storage policies are active

### Issue: Products not showing
**Solution**:
1. Check user is logged in
2. Verify products table has data
3. Check RLS policies allow SELECT

## 📱 App Features Now Working

✅ Real Authentication (Email/Password)
✅ User Profile Management
✅ Product CRUD Operations
✅ Image Upload (Ready - needs UI integration)
✅ Real-time Data Sync
✅ Secure Row Level Security
✅ Categories Management

## 🔄 Next Steps After Setup

1. Test signup with new email
2. Test login with created account
3. Create a product as seller
4. Browse products as buyer
5. Test all CRUD operations

## 📝 Important Notes

- All passwords are hashed by Supabase Auth
- RLS policies ensure data security
- Images are stored in public buckets
- Real-time subscriptions available for future features
- Database automatically backs up (Supabase handles this)

## 🆘 Support

If you encounter issues:
1. Check Supabase Dashboard → Logs
2. Check Flutter app console for errors
3. Verify all SQL ran successfully
4. Ensure storage buckets exist

## 🎉 Success Checklist

- [ ] SQL schema executed successfully
- [ ] product-images bucket created
- [ ] profile-images bucket created  
- [ ] Storage policies configured
- [ ] Test signup works
- [ ] Test login works
- [ ] Test product creation works
- [ ] Test browsing products works

Once all checked, your Supabase integration is complete! 🚀
