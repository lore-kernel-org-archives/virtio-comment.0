Return-Path: <virtio-comment-return-3043-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6F96986491
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 May 2022 13:31:03 +0000 (UTC)
Date: Tue, 17 May 2022 14:30:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YoOjkNqkqUhtEjuq@stefanha-x1.localdomain>
References: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
 <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain>
 <CAJs=3_D=yqKzCdWwW+CY93rzGZYJEZ5twKbYgLaKpgTSNv0WVw@mail.gmail.com>
 <YoNr0jTiqtW8XYDX@stefanha-x1.localdomain>
 <CAJs=3_DudKej_CxdtVDsc_ePJEEr24fQv3uS-XWDCZ8OzRxMBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a1PuzR6NoXrIJzdZ"
Content-Disposition: inline
In-Reply-To: <CAJs=3_DudKej_CxdtVDsc_ePJEEr24fQv3uS-XWDCZ8OzRxMBQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2] Introduction of Virtio Network
 device notifications coalescing feature
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--a1PuzR6NoXrIJzdZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 01:01:54PM +0300, Alvaro Karsz wrote:
> I forgot to address this point in your previous  email:
>=20
> > My guess is that VIRTIO_F_EVENT_IDX and
> > *-max-frames have similar effects in suppressing notifications.
>=20
> One big difference is that if you want to ask the device to send an
> interrupt every 20 packets, you should set VIRTIO_F_EVENT_IDX to 20.
> Then when an interrupt is received, change it to 40, then to 60..
>=20
> Using the notifications coalescing feature, you just need to set the
> max-frames values once, and that's it.

That's a good point. It makes me wonder whether there should be a
virtqueue-level coalescing feature. The device would not need to do a
DMA read like it does with VIRTIO_F_EVENT_IDX because the coalescing
value is set once by the driver and rarely updated. I don't want to
distract you though, I think the virtio-net-level coalescing makes sense
since it counts Ethernet frames rather than virtqueue buffers.

> > I'm thinking about the scenario where EVENT_IDX and max-frames are not
> > multiples and the coalesce timer is disabled (0). Can the driver be in a
> > situation where is waits forever?
>=20
> The timer can't be disabled.
> Without the timer, you'll have problems even without  EVENT_IDX/
> notification suppressions.
> Assume a scenario when max-frames is 10, and the device receives only
> 5 packets, and then the network is silent.
> In this case, these packets will never reach the driver.
>=20
> So, the timer must always work if a device supports this feature.

This reasoning applies to rx but not tx. It would be fine to disable the
timer since the driver controls tx buffer submission.

> timer=3D0 should mean that an interrupt is sent if 0 usecs elapsed since
> the last interrupt, which always will be "yes".
>=20
>=20
> > I think the max-frames state should only be reset when the Used Buffer
> > Notification is sent. That way a notification is sent after 3 tx buffers
> > have been used and the driver will be able to make progress.
>=20
> It's possible to ask the device to reset the coalescing counters only
> when an interrupt is sent, but I think that it is not required because
> of the coalescing timer.

I agree with you. Please add a paragraph to the spec that summarizes
what we've discussed regarding EVENT_IDX and timer vs max-frames. That
way it will be clear exactly how this should be implemented in drivers
and devices.

Thanks,
Stefan

--a1PuzR6NoXrIJzdZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKDo5AACgkQnKSrs4Gr
c8i3wgf8C2qM7Nzd8OTAtsiyookF8fYg1hg7mLhQKdMFAuGXjhkWVlaPgyW2CKUN
UAjBkK3fjWQpglKPu4XYh734ZMN263T4PoyBfHVq9ZBERpwE9EiiDSWRvv2qXIo6
grezh3hV7fv7yYJ278AdTFOpi1MalIEQyzEn63z8xiHr+0SaxzBbSKAGN3GAYLby
cK7bjIjEVIK2INqzJBXLoRe0wiYXF6J4NiqyHFPPZ9TpX3trohvXqN+f7bYCAUNb
+u5faT9lvRwBKI4R8VjO4vhytOvyOadJv5mylJfDhIB2UmDeE1B/N4VCsDhVlxRL
tzxpzrxWVEHw0IyF79qbHwugSwDcMw==
=ywyX
-----END PGP SIGNATURE-----

--a1PuzR6NoXrIJzdZ--

