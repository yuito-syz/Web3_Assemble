export type AuthHeaders = {
  'access-token': string | null;
  'uid': string | null;
  'client': string | null;
  'expiry': string | null;
  'Content-Type': string;
}

export type AccessToken = Pick<AuthHeaders, 'access-token'>
