Return-Path: <virtio-comment-return-2117-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B0F5986275
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Aug 2021 12:58:57 +0000 (UTC)
Date: Mon, 2 Aug 2021 13:58:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YQfsBMpiSEk8/wPo@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain>
 <87im0v4yrj.fsf@redhat.com>
 <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
 <YQEa1b2QfW05e0iZ@stefanha-x1.localdomain>
 <8c0b3927-0c10-e688-33f4-f9fa99f57f02@nvidia.com>
 <YQFev1vXVFLlvW0w@stefanha-x1.localdomain>
 <eedd595d-77b9-2921-bbcc-ced2618bccc9@nvidia.com>
 <YQJrewVjjoSQeHWm@stefanha-x1.localdomain>
 <ba991097-3028-6608-779f-a4e405bf9410@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <ba991097-3028-6608-779f-a4e405bf9410@nvidia.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VzQVELgE+jtS05ze"
Content-Disposition: inline
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

--VzQVELgE+jtS05ze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 01, 2021 at 01:46:03PM +0300, Max Gurtovoy wrote:
>=20
> On 7/29/2021 11:48 AM, Stefan Hajnoczi wrote:
> > On Wed, Jul 28, 2021 at 05:20:29PM +0300, Max Gurtovoy wrote:
> > > On 7/28/2021 4:42 PM, Stefan Hajnoczi wrote:
> > > > On Wed, Jul 28, 2021 at 01:59:26PM +0300, Max Gurtovoy wrote:
> > > > > On 7/28/2021 11:52 AM, Stefan Hajnoczi wrote:
> > > > > > On Tue, Jul 27, 2021 at 06:29:49PM +0300, Max Gurtovoy wrote:
> > > > > > > On 7/27/2021 5:28 PM, Cornelia Huck wrote:
> > > > > > > > On Tue, Jul 27 2021, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> > > > > > > > > On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wr=
ote:
> > > > > > > > How many different (groups of) commands can we reasonably e=
xpect? Do we
> > > > > > > > need a generic discovery command, or can we get away with a=
 feature bit
> > > > > > > > covering each new group of commands?
> > > > > > > I can't predict the future but IMO we need a discovery comman=
d.
> > > > > > >=20
> > > > > > > We have many devices and more can be added in the future.
> > > > > > A <u8 class, u8 command> space is 65536 bits or 8KB. I think ad=
min
> > > > > > commands would not be included in VIRTIO Feature Bits but inste=
ad
> > > > > > reported via a separate admin command that returns up to 8KB of=
 data:
> > > > > >=20
> > > > > >      struct virtio_admin_report_cmds {
> > > > > >          /* Bitmap of available admin commands [Device->Driver]
> > > > > >           * bool command_present =3D
> > > > > >           *        command_bits[class * 32 + command / 8] & (co=
mmand % 8);
> > > > > >           */
> > > > > >          u8 command_bits[8192];
> > > > > >      };
> > > > > Yes, I divided it to multiple commands per class to cover the cas=
e we will
> > > > > need more than 1 bit to describe a command.
> > > > >=20
> > > > > But I guess we can add it later on.
> > > > >=20
> > > > > I think the above should be:
> > > > >=20
> > > > > bool command_present =3D command_bits[class * 32 + command / 8] &=
 (1 << (command % 8));
> > > > >=20
> > > > > isn't it ?
> > > > You're right. I forgot to shift the bit :D.
> > > >=20
> > > > > Also what do you think about renaming <class, command> to <opcode=
, opmod> ?
> > > > I need to understand how opcode and opmod values are used. I'm not =
sure.
> > > Same as class and command just with different naming.
> > Is opcode the same as command? What does opmod do?
>=20
> no. opcode =3D=3D class and opmod =3D=3D command.

I find those terms confusing. "class" and "command" was clearer to me,
at least.

Stefan

--VzQVELgE+jtS05ze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEH7AMACgkQnKSrs4Gr
c8iEoQgAntkDRIMEpAZn4tjY/Nf9ZIyUiL5Yc0BG4b4HZBz8QV25BrYYDP/j5x4F
nHU2YYQH+7BneJ2KRLKZB367CbLGxcUKHamxTVv2WMKTBamLG/S/3EOmpeMShH0V
KEi9jnKfrAW1sRhJ0WaNRn13bkc0URWU0xLxn7L6UUnurVh+g4AbSgWJhH+qjmir
VSt92b4VUDHGiVzvcPF7cziviEDN8e9muGJOHG4//KQ/Bfo7ttghzT9Kkwo6Wx+1
oqH8enROui6WJAl5fBbOkhrgyKbYqdq1aukNgzyrA8to4ngiYMkmKyNaX0McO99N
I27FqOCQyYLs4iDvzHlEvuTgmRZ2bw==
=k7Ok
-----END PGP SIGNATURE-----

--VzQVELgE+jtS05ze--

