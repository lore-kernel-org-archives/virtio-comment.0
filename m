Return-Path: <virtio-comment-return-2877-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A3CA986721
	for <virtio-comment@lists.oasis-open.org>; Sat,  2 Apr 2022 16:42:51 +0000 (UTC)
Date: Sat, 2 Apr 2022 17:42:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Ykh9BEEm+/tjAcFf@stefanha-x1.localdomain>
References: <DM6PR11MB43316D69A8BE7ABE8E868C37F9E09@DM6PR11MB4331.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9q57VopVzZaVHMqr"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB43316D69A8BE7ABE8E868C37F9E09@DM6PR11MB4331.namprd11.prod.outlook.com>
Subject: Re: [virtio-comment] Is there a protocol for interacting with a
 Linux Host where another Linux guest is the virtio guest?
To: "Pincus, Josh" <Josh.Pincus@windriver.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--9q57VopVzZaVHMqr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 03:47:31PM +0000, Pincus, Josh wrote:
> HI,
>=20
> Thanks in advance for all the newbie help, especially to Stefan who graci=
ously responded yesterday.
>=20
> The current spec doesn't say a word about what's presented to the Linux H=
ost (see attached graphic).  It speaks directly to what's presented to the =
Linux Guest, the user of the virtual device.  By Linux Host, I mean the VM =
responsible for virtualizing the actual hardware and providing a "virtio de=
vice" that receives raw content via the queues from the guest, translates t=
he content into commands that can be understood by the hardware device driv=
er in question, and eventually sends back responses to the guest.  What sta=
ndard or interface is used by compliant HYPs to configure the Linux Host to=
 fire up a virtual device, negotiate with the guest based on features the H=
OST supports, respond to register reads/writes performed by the guest, and =
initiate interrupts back to the guest as needed? =20
>=20
> Is there any kind of standard or documentation that governs how compliant=
 Hypervisors are supposed to present such an interface to the Linux Host?  =
Are folks using vhost in the Linux Host to provide an interface to the Host=
's virtio device and then relying on the HYP to interact with that service =
when the Guest makes register requests? =20

That is beyond the scope of the VIRTIO specification because it varies
depending on the details of the hypervisor.

You said "the VM responsible for virtualizating the actual hardware".
The VIRTIO device may or may not be in a VM. It could be part of the
hypervisor, passed through to hardware, etc.

If you look at QEMU, kvmtool, Firecracker, and other VMMs, they
implement VIRTIO devices using internal APIs and there is no standard.

There are some interfaces for specific use cases: vhost, vhost-user,
vDPA, VDUSE, etc. They are sometimes called "out-of-process device
emulation" interfaces and potentially allow you to implement a VIRTIO
device once and use it across multiple hypervisors. Here are slides that
cover recent options in the Linux world:
https://vmsplice.net/~stefan/VHPC%202021%20-%20Bring%20your%20own%20virtual=
%20devices.pdf

It's typical for QEMU KVM guests to have a mix of vhost kernel and QEMU
VIRTIO devices (host userspace). That's because certain things are
better done in the host kernel and therefore implemented as vhost
drivers. Other things don't benefit from being in the kernel and
implementing them as part of QEMU (or a vhost-user device) is a natural
choice.

To summarize: there is no one-size-fits-all standard but check your
specific use case to see if an out-of-process device emulation interface
would be a good fit.

Stefan

--9q57VopVzZaVHMqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJIfQQACgkQnKSrs4Gr
c8jKQAf6AkYXR6w5qQmX9XsJkesOo7fl5AeaF1cR+lWuurzDa6RoXee/T0doMCZw
RXwjB64NAx0jyVqKL3liYf3jcHSwzNZdHmwrw84DKWlkTXNrBgdBb/r00FCK7LZI
RENrHisNjWdoioCozwXQICx63gC5/eY2tl57Qx0naOpDd1y2/Szf38NHap6LCLd1
hEP8KRf94rvCirDmqas8Sb8GusmdD5zCTNXhMrrpQslNbO9GHCWMD4VHYmUHrnct
OLtmNlO/N535iQMNbDNheNFHhtB5xavS5cyJNx9IIO4BeohYjvdfaMzmA4uzuRfg
lkKjyFdlSPsTDaJWVmZeuW19ajhT1g==
=Tgua
-----END PGP SIGNATURE-----

--9q57VopVzZaVHMqr--

