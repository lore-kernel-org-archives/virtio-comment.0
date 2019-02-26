Return-Path: virtio-comment-return-659-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83973985D5D
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Feb 2019 12:13:07 +0000 (UTC)
References: <54DB94AE64EDA14BAB6A1E9641A26B011AC60D30@hasmsx109.ger.corp.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <171547f8-c889-95fb-408e-c4fe23d4150e@redhat.com>
Date: Tue, 26 Feb 2019 13:13:02 +0100
MIME-Version: 1.0
In-Reply-To: <54DB94AE64EDA14BAB6A1E9641A26B011AC60D30@hasmsx109.ger.corp.intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Block Device: Legacy SCSI 'cmd' Framing
 Requirements
To: "Savir, Gil" <gil.savir@intel.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On 24/02/19 13:30, Savir, Gil wrote:
> Regarding =A0Version 1.1 draft 01
>=20
> =A0
>=20
> When using Block-device, legacy scsi commands, while VIRTIO_F_ANY_LAYOUT
> is negotiated, it is not clear if =91cmd=92 field must reside in a single,
> separate device-readable buffer.
>=20
> In Section 5.2.6.3 it is written, in general (without reference to
> VIRTIO_F_ANY_LAYOUT) that =91cmd=92 field must reside in a single buffer.
>=20
> Section 5.2.6.4, 2^nd bullet describes framing requirements for SCSI
> commands, but does not refer to =91cmd=92 field.
>=20
> I suggest adding description of =91cmd=92 field =A0framing requirement in=
 this
> bullet, as well.

Indeed, the legacy SCSI interface's framing requirements override
VIRTIO_F_ANY_LAYOUT (and the impossibility of adjusting this was one of
the reasons to dro it).

Paolo

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

