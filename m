Return-Path: virtio-return-3445-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
Date: Fri, 30 Oct 2020 14:38:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20201030143857.GF330921@stefanha-x1.localdomain>
References: <20201030061222-mutt-send-email-mst@kernel.org>
 <20201030102339.GB3046@work-vm>
 <2b6a81de-089d-aaad-7c74-78b6f534164e@siemens.com>
 <20201030131645.3f1ce61e.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201030131645.3f1ce61e.cohuck@redhat.com>
Subject: [virtio] Re: [virtio-comment] allocating device IDs without a vote
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2020 at 01:16:45PM +0100, Cornelia Huck wrote:

Let's clarify whether it is acceptable to keep the device without a spec
indefinitely.

I am starting to get the feeling people would like to define one-off
VIRTIO devices that are unlikely to be implemented elsewhere.

As VIRTIO expands we may find it acceptable to allow these use cases,
but expectations should be clear:
1. VIRTIO spec features won't be added for out-of-tree devices. The user
   needs to be in the spec so that the design can be reviewed.
2. Out-of-tree devices that violate the VIRTIO device model may cease to
   work or be impossible to implement as the VIRTIO spec evolves.

> Perhaps there needs to be some kind of annotation? If you reserve an ID
> via the quick mechanism, it gets a "reserved until YYYY-MM-DD", and
> that tag gets removed when a proper spec is merged? For
> "in-the-wild-do-not-reuse" IDs, we'd still require a vote, as the
> default should be to have a proper spec if you want something outside
> of the private namespace.

I'm not sure revoking an ID is realistic in the case where the owner
refuses to upstream a spec but is shipping devices. The upstream device
that reused the ID will suffer when collisions occur.

Stefan

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+cJYEACgkQnKSrs4Gr
c8gfhgf/TYXKLXWj9k+VWx34upB7D4OYTYCmqX+kusdTNoHmDZbZPDWubQjfjcYb
32Ono9/OHOodLAjIHuWGyMmva8qLqN7DQ3d2SnNxqdnVsJkx6//RYMWYVX0L0GRJ
n1FD5U/q4Z3KkcQ8vYZRCgytMt5siI5jkteFF6PaBaUTmceWma1RFG0q61K00iCO
7glgfwZN/PVuUdwByV+gSdOKMm4zk6CqEJKeqFlmzyxV4+7+xBFSTK1KZ2+5vO2N
Q/I/o/6xVg3j8VPweZG2t56GYdW4eZHey5s7RynYYwDmuiy3rtJa+9GB5GGelyR1
pyDwpTUBbmYpyUeXYwth/uNvtHaB0A==
=bg6X
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--

