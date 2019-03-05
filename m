Return-Path: virtio-comment-return-690-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 504DE985E55
	for <virtio-comment@lists.oasis-open.org>; Tue,  5 Mar 2019 16:20:35 +0000 (UTC)
From: "Savir, Gil" <gil.savir@intel.com>
Date: Tue, 5 Mar 2019 16:18:10 +0000
Message-ID: <54DB94AE64EDA14BAB6A1E9641A26B011AC7DF08@hasmsx109.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] virtio_blk_req.data size - Section 5.2.6 - version 1.1 draft 01
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

In version 1.1 draft 01 - Section 5.2.6 - struct virtio_blk_req definition:

Data field is defined as array of 512 Byte entries as follows:
	u8 data[][512];
It makes sense for IN and OUT requests, since defined for read/write sizes =
that are 512 Bytes multiplication.
However, it is confusing when used for DISCARD or WRITE_ZEROES requests, si=
nce virtio_blk_discard_write_zeroes struct size is 16 Bytes.

Is implying that DISCARD and WRITE_ZEROES requests must use data-field size=
s that are 512 Bytes multiplication as well?

If yes, than the device can't tell how many virtio_blk_discard_write_zeroes=
 structs reside within data-field. In that case - indication for number of =
virtio_blk_discard_write_zeroes structs needs to be added.

If not, then I suggest to add to the spec clarification, that for DISCARD o=
r WRITE_ZEROES requests, data-field is not required to be with size that is=
 512 Bytes multiplication.


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

