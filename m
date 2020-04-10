Return-Path: virtio-comment-return-1178-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6A1B986000
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Apr 2020 10:09:29 +0000 (UTC)
Date: Fri, 10 Apr 2020 12:09:22 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20200410100922.wynrrzmbagjsaxd6@steredhat>
References: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
MIME-Version: 1.0
In-Reply-To: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
Subject: Re: [virtio-comment] Seeking guidance for custom virtIO device
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: "Eftime, Petre" <epetre@amazon.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

On Fri, Apr 10, 2020 at 09:36:58AM +0000, Eftime, Petre wrote:
> Hi all,
>=20
> I am looking for guidance on how to proceed with regards to either reserv=
ing a virtio device ID for a specific device for a particular usecase  or f=
or formalizing a device type that could be potentially used by others.
>=20
> We have developed a virtio device that acts as a transport for API calls =
between a guest userspace library and a backend server in the host system.
> Our requirements are:
> * multiple clients in the guest (multiple servers is not required)
> * provide an in-order, reliable datagram transport mechanism
> * datagram size should be either negotiable or large (16k-64k?)
> * performance is not a big concern for our usecase

It looks really close to vsock.

>=20
> The reason why we used a special device and not something else is the fol=
lowing:
> * vsock spec does not contain a datagram specification (eg. SOCK_DGRAM, S=
OCK_SEQPACKET) and the effort of updating the Linux driver and other implem=
entations for this particular purpose=A0=A0seemed relatively high. The path=
 to approach this problem wasn't clear. Vsock today only works in SOCK_STRE=
AM mode and this is not ideal: the receiver must implement additional state=
 and buffer incoming data,=A0=A0adding complexity and host resource usage.

AF_VSOCK itself supports SOCK_DGRAM, but virtio-vsock doesn't provide
this feature. (vmci provides SOCK_DGRAM support)

The changes should not be too intrusive in the virtio-vsock specs and
implementation, we already have the "type" field in the packet header
to address this new feature.

We also have the credit-mechanism to provide in-order and reliable
packets delivery.

Maybe the hardest part could be change something in the core to handle
multiple transports that provide SOCK_DGRAM, for nested VMs.
We already did for stream sockets, but we didn't handle the datagram
socket for now.

I am not sure how convenient it is to have two very similar devices...

If you decide to give virtio-vsock a chance to get SOCK_DGRAM, I can try to
give you a more complete list of changes to make. :-)

Cheers,
Stefano


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

