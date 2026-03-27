-- Allow authenticated users to insert into providers table
-- The user must be the owner of the provider record they are creating.

CREATE POLICY "Users can create their own provider profile"
ON public.providers
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = owner_id);
