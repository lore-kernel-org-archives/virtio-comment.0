Return-Path: virtio-comment-return-567-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3DCD9984255
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Nov 2018 11:16:25 +0000 (UTC)
Date: Mon, 26 Nov 2018 11:16:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20181126111612.GG15869@stefanha-x1.localdomain>
References: <20180921095459.GA2842@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PpAOPzA3dXsRhoo+"
Content-Disposition: inline
In-Reply-To: <20180921095459.GA2842@work-vm>
Subject: [virtio-comment] Re: PCI cap for larger offsets/lengths
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>, kraxel@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 10:54:59AM +0100, Dr. David Alan Gilbert wrote:
> Hi,
>   We've got an experimental virtio device (using vhost-user) we're playin=
g with
> that would like to share multiple large mappings from the client back to =
qemu.

CCing Michael Tsirkin and Gerd Hoffman.  Gerd could use this for
virtio-gpu where some memory must be owned by the host.

>=20
> 'virtio_pci_cap' only has 32bit offset and length fields and so
> I've got a different capability to express larger regions:
>=20
>=20
> /* Additional shared memory capability */
> #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>=20
> struct virtio_pci_shm_cap {
>        struct virtio_pci_cap cap;
>        le32 offset_hi;             /* Most sig 32 bits of offset */
>        le32 length_hi;             /* Most sig 32 bits of length */
>        u8   id;                    /* To distinguish shm chunks */
> };
>=20
> One oddity is that I'm allowing multiple instances of this capability
> on one device, distinguished by their 'id' field which I've made device
> type specific, e.g.:
>=20
> #define VIRTIO_MYDEV_PCI_SHMCAP_ID_CACHE   0
> #define VIRTIO_MYDEV_PCI_SHMCAP_ID_JOURNAL 1
>=20
> Having more than one capability of the same type is a little different
> from what the virtio-spec currently suggests; it currently talks
> about 'order of preference suggested by the device' - i.e. two
> capabilities where the user picks one; in this case I'm using
> all of the instances for different things.
>=20
> If this makes sense to people, I'd be happy to write this up into a more
> formal change; if it doesn't I'd be interested to hear about alternative
> suggestions.

Another option is to define a unique PCI capability for each type:

  struct virtio_pci_shm_cap {
         struct virtio_pci_cap cap;
         le32 offset_hi;      /* Most significant 32 bits of offset */
         le32 length_hi;      /* Most significant 32 bits of length */
  };

  #define VIRTIO_PCI_CAP_MYDEV_SHM_CACHE 8
  #define VIRTIO_PCI_CAP_MYDEV_SHM_JOURNAL 9

This way the "order of preference" semantics can be kept.  The drawback
is consuming more PCI capability numbers.

Stefan

--PpAOPzA3dXsRhoo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb+9X8AAoJEJykq7OBq3PIDGgH/RJUF+L/D0GGPvJo9Wif+5Di
6HvxzD2Y30GVRb4xe8zL7/moxFzOsGqeyofhMhzxkBGoCPrjt7VEqNriP0iVP83l
1bfaRIquACylYqXQGcPwfaxw6t9Erzp9LbRlG8wVPwki+f0uQ5EZQxsr1cOzsYAb
Qw8X5wqzGY2Xi3DaVw9aKfzxOBtUJtB1Ksv5GN3eMMZ0p+7sb7GB8s+nRkdZQArq
sDuvQzIZbVwz6kKuntcd14BOPGlUGeymeQsIlan6cYBm7K11aFF8wuQ9UhXRGwJg
WORM5jcp2D/IczbQYF0sUdHDYXhpICb0fw9BeqDxtYb+r30W+Kw19eyeIlsXOSM=
=361Z
-----END PGP SIGNATURE-----

--PpAOPzA3dXsRhoo+--
