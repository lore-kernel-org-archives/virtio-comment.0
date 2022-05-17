Return-Path: <virtio-comment-return-3037-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C24589863C3
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 May 2022 09:33:14 +0000 (UTC)
Date: Tue, 17 May 2022 10:33:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YoNr0jTiqtW8XYDX@stefanha-x1.localdomain>
References: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
 <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain>
 <CAJs=3_D=yqKzCdWwW+CY93rzGZYJEZ5twKbYgLaKpgTSNv0WVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VPwHC4NlgG6/1wbl"
Content-Disposition: inline
In-Reply-To: <CAJs=3_D=yqKzCdWwW+CY93rzGZYJEZ5twKbYgLaKpgTSNv0WVw@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2] Introduction of Virtio Network
 device notifications coalescing feature
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--VPwHC4NlgG6/1wbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 10:00:38PM +0300, Alvaro Karsz wrote:
> > There are whitespace changes in this patch that should probably be
> > dropped. If you want to clean up whitespace, please submit a separate
> > patch so that this patch only does one thing.
>=20
> Sorry, I will remove the white spaces from the patch in the next version.
>=20
> > I can't parse the last sentence
>=20
> What I meant, using your example:
> - Device's next buffer to consume is #0.
> - EVENT_IDX  is #20, meaning that the driver doesn't want to be
> interrupted on #0-19 buffers.
> -  max-frames is 10.
>=20
> In this case, the device should not interrupt the driver on #10,
> neither on #20, just on #30, or any number above #19, after the usecs
> value elapsed.

I'm thinking about the scenario where EVENT_IDX and max-frames are not
multiples and the coalesce timer is disabled (0). Can the driver be in a
situation where is waits forever?

max-frames =3D 2
EVENT_IDX =3D 3

If the driver only has 3 tx buffers it will not be able to make more
available until it processes the Used Buffer Notification. The problem
is that after max-frames (2) EVENT_IDX hasn't been reached, so we
suppress the Used Buffer Notification. After EVENT_IDX (3) the
max-frames state has been reset so we suppress the Used Buffer
Notification. The driver is left waiting forever.

I think the max-frames state should only be reset when the Used Buffer
Notification is sent. That way a notification is sent after 3 tx buffers
have been used and the driver will be able to make progress.

(This may be a silly example, but the idea is that the driver may rely
on Used Buffer Notifications in order to make progress so we cannot
assume the driver can always submit more buffers.)

> > I guess there's a danger of receiving no interrupts or at least weird
> > suppression patterns when both these mechanisms are enabled
> > simultaneously. Should drivers avoid using both at the same time?
>=20
> I'm not sure how using both mechanisms at the same time will lead to
> problems, can you please give an example?
>=20
> The only scenarios that I can imagine when no interrupts will be
> received at all are when:
>=20
> 1) Driver suppress all events.
>=20
> 2) Driver suppress events, then enables them and suppress again before
> device sent any interrupt, because max-frames and usecs values not
> meet.
> This seems fine to me, since if driver enables events, then suppresses
> them again, it is aware of the new buffers, and doesn't want to be
> interrupted.

I agree with scenarios #1 and #2. Interrupts will be received/suppressed
as desired by the driver.

> Another point is the coalescing default values.
> A device can have default coalescing values, even without receiving a
> command from the driver asking to change the parameters.
>=20
> In this case, you could use ethtool to read the coalescing parameters
> and see 0, although the device is using the default values, which may
> not be 0.
>=20
> The initial values could be added in the virtio_net_config struct.
>=20
> What do you think? is this necessary?
>=20
> It won't change the functionality, it will only show false data when
> using ethtool before a VIRTIO_NET_CTRL_NOTF_COAL was sent, and if the
> device has default values that aren't 0 (interrupt every packet).
>=20
> We could specifying that the device should not use default parameters
> without receiving a VIRTIO_NET_CTRL_NOTF_COAL command instead of using
> the default values.

I don't think *-max-frames default values make sense because a driver
might wait forever. For example, if the device defaults to
tx-max-frames =3D 10 but the driver uses only 4 tx buffers as part of its
memory allocation strategy (e.g. a PXE boot ROM that runs in a tiny
memory footprint), it will never see an interrupt. So in practice
drivers would have to set *-max-frames to override the device's default.
Therefore I don't think it's worth having a default. Instead the
*-max-frames values must be initialized to 0 by the device.

Stefan

--VPwHC4NlgG6/1wbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKDa9IACgkQnKSrs4Gr
c8hrmwgAo7ZxkTwq1+RLW+jljZYBHfMQ+Orh+8JkeC1LX4Tjnn4o0mJ1t1A1agwB
H7CWQ/MVdNV57iwIE+IAMZm4oyj3oGYtdBr+XoEhfZ1RJHWXAsqaNNmECeGBQBWO
bUWGnNXh8of46Fb2ivcW5ICMQas69WeY9iFiTeblfHhxApCkVjG/HRI6G2X1hb9t
m/ifBkoTX6qUbAaEXTbGyxWTfKgn4tJ8vlnq3B2uPjAxcCrj9rD9qE9O6MOUReIg
YswZEHCJrdAQtCbLTk7rdrIovJw8+hgAI/l5OBWdO5PbsbUjYxhcraWOMlf4PWrH
VmlepxH8CkeaVEkZ3zKbWFSNSsN7ew==
=8w66
-----END PGP SIGNATURE-----

--VPwHC4NlgG6/1wbl--

