Return-Path: virtio-comment-return-783-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A5CF984D9D
	for <virtio-comment@lists.oasis-open.org>; Tue,  9 Jul 2019 06:35:20 +0000 (UTC)
From: "Savir, Gil" <gil.savir@intel.com>
Date: Tue, 9 Jul 2019 06:35:13 +0000
Message-ID: <54DB94AE64EDA14BAB6A1E9641A26B011AE253DE@hasmsx109.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] VIRTIO_NET_F_MRG_RXBUF number of descriptors
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

v1.1 states at Section 5.1.6.3.2 (Device Requirements: Setting Up Receive B=
uffers): =

	"The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF wa=
s not negotiated." =

That's a mistake, since the device can, and should be able to use multiple =
descriptors, pertaining to the same descriptors chain.

Therefore I suggest to change it to: =

	" The device MUST use only a single descriptor-chain if VIRTIO_NET_F_MRG_R=
XBUF was not negotiated."

BTW, as result of this wrongly formulated sentence, I came across many peop=
le (including my-past-self) that confuse MRG_RXBUF feature with descriptors=
-chain support.
Fixing it will help avoiding this confusion. =


Thanks,
Gil

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

